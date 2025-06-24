from collections import deque
import os
import pickle
from typing import Optional, List, Dict
import numpy as np
import torch
from qiskit import QuantumCircuit
from qiskit.converters import circuit_to_dag
from qiskit.dagcircuit import DAGOpNode, DAGInNode, DAGOutNode
from torch_geometric.data import Data
import random
import sys
from qiskit.transpiler.preset_passmanagers import common
from qiskit import QuantumCircuit
parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
sys.path.append(parent_dir)

from qiskit.transpiler.passmanager import StagedPassManager
from qiskit.transpiler.preset_passmanagers import common
from qiskit.transpiler.passmanager_config import PassManagerConfig
from qiskit.transpiler.preset_passmanagers.plugin import (
    PassManagerStagePluginManager,
)
from qiskit.providers.fake_provider import Fake127QPulseV1
from qiskit.transpiler import CouplingMap

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
available_gate_names = ["rz", "sx", "x", "cx", "barrier", "measure"]


def get_nodes_edge(
        circuit: QuantumCircuit, gate_set: Optional[List[str]] = None, enable_opt_gates_by_optpass: Optional[List[list]] = None
):
    gate_set = gate_set or available_gate_names
    enable_opt_gates_by_optpass = enable_opt_gates_by_optpass or None

    dag_circuit = circuit_to_dag(circuit)

    nodes = list(dag_circuit.nodes())
    edges = list(dag_circuit.edges())

    nodes_dict: Dict[DAGOpNode, List[float]] = {}

    for _, node in enumerate(nodes):
        # print(f"id: {node._node_id}")
        if isinstance(node, (DAGInNode, DAGOutNode)):
            # TODO: use in and out nodes
            pass
        elif isinstance(node, DAGOpNode):
            gate_encoding = [0.0] * len(gate_set)
            gate_encoding[gate_set.index(node.op.name)] = 1.0
            if enable_opt_gates_by_optpass:
                enable_opt_gates_encoding = [0.0] * len(enable_opt_gates_by_optpass)
                for index, gates_id in enumerate(enable_opt_gates_by_optpass):
                    for gate_id in  gates_id:
                        if node._node_id == gate_id:
                            enable_opt_gates_encoding[index] = 1.0
                feature_vector = gate_encoding + enable_opt_gates_encoding
            else:
                feature_vector = gate_encoding
            # print(f"id: {node._node_id} enable_opt_gates_encoding : {enable_opt_gates_encoding}")
            nodes_dict[node] = feature_vector

    nodes_indices = {node: idx for idx, node in enumerate(nodes_dict.keys())}

    edge_index = []

    for edge in edges:
        source, dest, _ = edge

        if isinstance(source, DAGOpNode) and isinstance(dest, DAGOpNode):
            edge_index.append([nodes_indices[source], nodes_indices[dest]])
            # edge_attr.append([0.0])
        else:
            # TODO: handle in and out nodes
            pass
    return nodes_dict, edge_index

def nodes_edge_to_tensor(
        nodes, edge
):
    # # 将 nodes_dict 转换为 numpy 数组
    x_tensor = torch.tensor(list(nodes.values()), dtype=torch.float)

    edge_index_tensor = torch.tensor(np.transpose(edge), dtype=torch.long)

    return x_tensor, edge_index_tensor

def get_reward(circuit1: QuantumCircuit, circuit2: QuantumCircuit, reward_function: str):
    reward = 0
    if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
        depth1 = circuit1.depth()
        depth2 = circuit2.depth()
        reward = ((depth1 - depth2) / depth1)
    elif reward_function in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
        reward = (circuit1.size() - circuit2.size()) / circuit1.size()
    elif reward_function == "parallelism":
         parallelism1 = (circuit1.size() / circuit1.depth() - 1) / (circuit1.num_qubits - 1)
         parallelism2 = (circuit1.size() / circuit1.depth() - 1) / (circuit1.num_qubits - 1)
         reward = parallelism2 - parallelism1
    return reward

def to_transition(
        circuit: QuantumCircuit, circuit1: QuantumCircuit, pass_id: int
) -> tuple[Data, Data, int, int]:
    nodes_dict, edge_index = get_nodes_edge(circuit)
    x_tensor, edge_index_tensor = nodes_edge_to_tensor(nodes_dict, edge_index)

    nodes_dict_, edge_index_ = get_nodes_edge(circuit1)
    x_tensor_, edge_index_tensor_ = nodes_edge_to_tensor(nodes_dict_, edge_index_)
    S = Data(x=x_tensor, edge_index=edge_index_tensor)
    S_ = Data(x=x_tensor_, edge_index=edge_index_tensor_)
    action = pass_id
    reward = get_reward(circuit, circuit1)
    return S, action, S_, reward

def get_deques_in_folder(folder_path, index):
    total_sum = deque()
    fs = os.listdir(folder_path)
    file_path = os.path.join(folder_path, fs[index])
    with open(file_path, 'rb') as f:
        deque_obj = pickle.load(f)
        print(f"filename {file_path} , len {len(deque_obj)}")
        for item in deque_obj:
            total_sum.append(item)
    return total_sum

def sum_deques_in_folder(folder_path, j, seed=None):
    total_sum = deque()
    if j ==0:
        fs = os.listdir(folder_path)[0:2]
    else:
        fs = os.listdir(folder_path)[2*j-1:2*j+1]
    # 遍历文件夹中的所有文件
    for filename in fs:
        # print(filename)
        file_path = os.path.join(folder_path, filename)
        # 打开并读取pkl文件
        with open(file_path, 'rb') as file:
            deque_obj = pickle.load(file)
            print(f"filename {filename} , len {len(deque_obj)}")
            for item in deque_obj:
                total_sum.append(item)

    return total_sum

class SumTree:
    def __init__(self, capacity):
        self.capacity = capacity
        self.tree = np.zeros(2 * capacity - 1)
        self.data = np.empty(capacity, dtype=object)
        self.data_pointer = 0
        self.total_priority = 0

    def add(self, priority, data):
        tree_idx = self.data_pointer + self.capacity - 1
        self.data[self.data_pointer] = data
        self.update(tree_idx, priority)
        self.data_pointer += 1
        if self.data_pointer >= self.capacity:
            self.data_pointer = 0

        self.total_priority += priority

    def update(self, tree_idx, priority):
        change = priority - self.tree[tree_idx]
        self.tree[tree_idx] = priority
        self._propagate(tree_idx, change)

    def _propagate(self, tree_idx, change):
        parent_idx = (tree_idx - 1) // 2
        self.tree[parent_idx] += change
        if parent_idx != 0:
            self._propagate(parent_idx, change)

    def get_leaf(self, value):
        parent_idx = 0
        while True:
            left_child_idx = 2 * parent_idx + 1
            right_child_idx = left_child_idx + 1
            if left_child_idx >= len(self.tree):
                leaf_idx = parent_idx
                break
            else:
                if value <= self.tree[left_child_idx]:
                    parent_idx = left_child_idx
                else:
                    value -= self.tree[left_child_idx]
                    parent_idx = right_child_idx
        data_idx = leaf_idx - self.capacity + 1
        return leaf_idx, self.tree[leaf_idx], self.data[data_idx]

    def total_priority(self):
        return self.tree[0]

class PrioritizedReplayBuffer:
    def __init__(self, capacity, alpha=0.6, epsilon=0.01):
        self.tree = SumTree(capacity)
        self.alpha = alpha
        self.epsilon = epsilon  # 小数，避免优先级为零
        self.capacity = capacity
        self.current_tree_size = 0  # 添加当前树的大小属性

    def add(self, error, sample):
        if not isinstance(sample, tuple) or len(sample) != 5:
            print(f"Sample should be a tuple of length 5, got {sample}")

        priority = self._get_priority(error)
        # print(f"Adding sample with priority {priority}: {sample}")  # 添加调试信息
        self.tree.add(priority, sample)

        # 更新当前树的大小
        if self.current_tree_size < self.capacity:
            self.current_tree_size += 1
        else:
            self.current_tree_size = self.capacity  # 防止超出容量

    def _get_priority(self, error):
        return (error + self.epsilon) ** self.alpha

    def sample(self, batch_size, beta=0.4):
        batch = []
        idxs = []
        priorities = []

        segment = self.tree.total_priority / batch_size

        for i in range(batch_size):
            a = segment * i
            b = segment * (i + 1)

            value = random.uniform(a, b)
            idx, priority, data = self.tree.get_leaf(value)

            if isinstance(data, tuple) and len(data) == 5:
                batch.append(data)
                idxs.append(idx)
                priorities.append(priority)
            else:
                print(f"Skipping invalid data: {data}")
                i -= 1  # 重新尝试采样当前的 batch index

        # # 调试信息
        # print(f"Final batch: {batch}")

        sampling_probabilities = np.array(priorities, dtype=np.float32) / self.tree.total_priority

        # 处理零值和 NaN 值
        sampling_probabilities = np.nan_to_num(sampling_probabilities)  # 将 NaN 替换为 0
        sampling_probabilities[sampling_probabilities == 0] = self.epsilon  # 将零值替换为一个小的数

        is_weight = np.power(self.capacity * sampling_probabilities, -beta)
        is_weight /= is_weight.max()

        return batch, idxs, is_weight

    def update(self, idx, error):
        priority = self._get_priority(error)
        self.tree.update(idx, priority)

def get_pre_compile_passmanager():
    device_quantum = Fake127QPulseV1()._get_conf_from_json()
    target=None
    basis_gates=["id", "rz", "sx", "x", "cx", "reset"]
    inst_map=None
    coupling_map = CouplingMap(device_quantum.coupling_map)
    instruction_durations = None
    backend_properties = None
    timing_constraints = None
    layout_method="dense"
    routing_method="basic"
    translation_method = None
    scheduling_method = None
    approximation_degree = 1.0
    seed_transpiler = None
    unitary_synthesis_method="default"
    unitary_synthesis_plugin_config = None
    initial_layout = None
    hls_config = None 
    init_method = None
    optimization_method=None
    qubits_initially_zero=True
    optimization_level=3
    pm_options = {
        "target": target,
        "basis_gates": basis_gates,
        "inst_map": inst_map,
        "coupling_map": coupling_map,
        "instruction_durations": instruction_durations,
        "backend_properties": backend_properties,
        "timing_constraints": timing_constraints,
        "layout_method": layout_method,
        "routing_method": routing_method,
        "translation_method": translation_method,
        "scheduling_method": scheduling_method,
        "approximation_degree": approximation_degree,
        "seed_transpiler": seed_transpiler,
        "unitary_synthesis_method": unitary_synthesis_method,
        "unitary_synthesis_plugin_config": unitary_synthesis_plugin_config,
        "initial_layout": initial_layout,
        "hls_config": hls_config,
        "init_method": init_method,
        "optimization_method": optimization_method,
        "qubits_initially_zero": qubits_initially_zero,
    }

    pass_manager_config = PassManagerConfig(**pm_options)

    plugin_manager = PassManagerStagePluginManager()
    basis_gates = pass_manager_config.basis_gates
    coupling_map = pass_manager_config.coupling_map
    initial_layout = pass_manager_config.initial_layout
    init_method = pass_manager_config.init_method or "default"
    layout_method = pass_manager_config.layout_method or "default"
    routing_method = pass_manager_config.routing_method or "sabre"
    translation_method = pass_manager_config.translation_method or "translator"
    scheduling_method = pass_manager_config.scheduling_method
    optimization_method = pass_manager_config.optimization_method or "default"
    scheduling_method = pass_manager_config.scheduling_method or "default"
    target = pass_manager_config.target

    pre_init = common.generate_control_flow_options_check(
            layout_method=layout_method,
            routing_method=routing_method,
            translation_method=translation_method,
            optimization_method=optimization_method,
            scheduling_method=scheduling_method,
            basis_gates=basis_gates,
            target=target,
        )
    init = plugin_manager.get_passmanager_stage(
            "init", init_method, pass_manager_config, optimization_level=3
        )
    routing_pm = plugin_manager.get_passmanager_stage(
        "routing", routing_method, pass_manager_config, optimization_level=3
    )
    if coupling_map or initial_layout:
        layout = plugin_manager.get_passmanager_stage(
            "layout", layout_method, pass_manager_config, optimization_level=3
        )
        routing = routing_pm
    else:
        layout = None
        routing = None
    translation = plugin_manager.get_passmanager_stage(
        "translation", translation_method, pass_manager_config, optimization_level=3
    )
    optimization = plugin_manager.get_passmanager_stage(
            "optimization", optimization_method, pass_manager_config, optimization_level=3
        )
    sched = plugin_manager.get_passmanager_stage(
        "scheduling", scheduling_method, pass_manager_config, optimization_level=3
    )

    # pre_optimization = common.generate_pre_op_passmanager(remove_reset_in_zero=False)
    s = StagedPassManager(
            pre_init=pre_init,
            init=init,
            layout=layout,
            routing=routing,
            translation=translation,
            optimization=None,
            scheduling=None,
        )
    # s.draw("./a.png")
    return s
