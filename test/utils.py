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

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
available_gate_names = ["rz", "sx", "x", "cx","rx", "barrier", "measure"]


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
