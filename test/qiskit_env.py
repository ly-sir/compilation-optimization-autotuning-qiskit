import random, os
from qiskit.transpiler import PassManager
from qiskit.transpiler.passes import UnitarySynthesis
from qiskit.transpiler.passes import Optimize1qGatesDecomposition
from qiskit.transpiler.passes import CommutativeCancellation
from qiskit.transpiler.passes import Collect2qBlocks
from qiskit.transpiler.passes import ConsolidateBlocks
from qiskit.transpiler.passes import UnitarySynthesis, RemoveIdentityEquivalent

from utils import get_nodes_edge, nodes_edge_to_tensor,get_reward
from torch_geometric.data import Data
from qiskit.transpiler.passes import CheckMap
from qiskit.transpiler import CouplingMap

from qiskit.transpiler.passes import GatesInBasis
from qiskit.providers.fake_provider import Fake127QPulseV1
from qiskit import qpy

device = Fake127QPulseV1()._get_conf_from_json()

def check_circuit_mapped_and_only_nat_gates(circuit, device=device):
    check_nat_gates = GatesInBasis(basis_gates=device.basis_gates)
    check_nat_gates(circuit)
    only_nat_gates = check_nat_gates.property_set["all_gates_in_basis"]
    check_mapping = CheckMap(coupling_map=CouplingMap(device.coupling_map))
    check_mapping(circuit)
    mapped = check_mapping.property_set["is_swap_mapped"]
    if(mapped and only_nat_gates):
        return True
    else:
        print("no only_nat_gates")
        return False
    
def circ_to_state(circuit):
    nodes_dict, edge_index = get_nodes_edge(circuit=circuit)
    tensor_x, tensor_edge_index = nodes_edge_to_tensor(nodes_dict, edge_index)
    next_state = Data(x=tensor_x, edge_index=tensor_edge_index)
    return next_state

class qiskit_env:
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.file_list = None
        self.action_dim = 4
        self.action_space = [0, 1, 2, 3]  # 可选动作：0和1
        
        self.current_circ = None
        self.current_qasm = None
        self.compiling_passmanager = PassManager()
        self.basis_gates = ["id", "rz", "sx", "x", "cx", "reset"]
        self.target = None
        self.approximation_degree = 1.0
        self.idling = 0
        self.model = 'train'
        self.circuits_qasm_path = "../circuits/training_data_compilation_qpy/"
        self.reward_function = "node_gate_num"
        opt_pass_dict = {0 : ConsolidateBlocks(basis_gates=self.basis_gates, target=self.target, approximation_degree=self.approximation_degree),
                       1 : RemoveIdentityEquivalent(target=self.target),
                       2 : Optimize1qGatesDecomposition(basis=self.basis_gates, target=self.target),
                       3 : CommutativeCancellation(basis_gates=self.basis_gates, target=self.target)}
        self.action_dict = {0 : [Collect2qBlocks(), opt_pass_dict[0], UnitarySynthesis(basis_gates=self.basis_gates)],
                            1: [opt_pass_dict[1]],
                            2 : [opt_pass_dict[2]],
                            3 : [opt_pass_dict[3]]}

    def reset(self):
        self.current_circ = None
        self.current_qasm = None
        self.compiling_passmanager = PassManager()
        self.idling = 0
        self.set_random_qasm()
        self.model = 'train'
        with open(self.current_qasm, 'rb') as f:
            self.current_circ = qpy.load(f)[0]
        state = circ_to_state(self.current_circ)
        return state

    def compile(self, actions):
        for action in actions:
            if action==0:
                self.compiling_passmanager.append(self.action_dict[0])
                c0 = self.compiling_passmanager.run(self.current_circ)
                self.compiling_passmanager.remove(len(self.compiling_passmanager) - 2)
                if check_circuit_mapped_and_only_nat_gates(circuit=c0):
                    return c0, action
                else:
                    continue
            if action==1:
                self.compiling_passmanager.append(self.action_dict[1])
                c1 = self.compiling_passmanager.run(self.current_circ)
                self.compiling_passmanager.remove(len(self.compiling_passmanager) - 1)
                if check_circuit_mapped_and_only_nat_gates(circuit=c1):
                    return c1, action
                else:
                    continue
            if action==2:
                self.compiling_passmanager.append(self.action_dict[2])
                c2 = self.compiling_passmanager.run(self.current_circ)
                self.compiling_passmanager.remove(len(self.compiling_passmanager) - 1)
                if check_circuit_mapped_and_only_nat_gates(circuit=c2):
                    return c2, action
                else:
                    continue
            if action==3:
                self.compiling_passmanager.append(self.action_dict[3])
                c3 = self.compiling_passmanager.run(self.current_circ)
                self.compiling_passmanager.remove(len(self.compiling_passmanager) - 2)
                if check_circuit_mapped_and_only_nat_gates(circuit=c3):
                    return c3, action
                else:
                    continue

        return self.current_circ, -1

    def predictor(self):
        self.model = 'predictor'

    def step(self, actions):
        compiled_circ = None
        compiled_circ, action = self.compile(actions)
        info = (compiled_circ.depth(), compiled_circ.size(), compiled_circ, action)
        done = self._is_done(compiled_circ)        
        # 计算奖励
        reward = self._calculate_reward(compiled_circ)
        if compiled_circ != self.current_circ:
            next_state = circ_to_state(compiled_circ)
        else:
            next_state = None

        # 判断是否被截断
        if action != -1:
            store = True
        else:
            store = False
        
        self.current_circ = compiled_circ

        return next_state, reward, done, store, info

    def action_sample(self):
        return random.sample(self.action_space, 1)

    def _calculate_reward(self, compiled_circ):
        reward = get_reward(self.current_circ, compiled_circ, self.reward_function)

        return reward

    def _is_done(self, compiled_circ):
        if compiled_circ == self.current_circ:
            assert(check_circuit_mapped_and_only_nat_gates(circuit=self.current_circ))
            return 1
        if compiled_circ != self.current_circ:
            return 0

    def set_random_qasm(self):
        file_list = [self.circuits_qasm_path + file for file in os.listdir(self.circuits_qasm_path)]
        random_file = random.choice(file_list)
        self.current_qasm = random_file