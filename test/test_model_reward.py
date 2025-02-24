from datetime import datetime
import os
import sys
from qiskit.transpiler import PassManager
from tqdm import tqdm
parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
# 将上一层目录添加到 sys.path 中
sys.path.append(parent_dir)
from qiskit.transpiler import PassManager
import torch
from qiskit_env import qiskit_env
from torch_geometric.data import Batch

from qiskit import QuantumCircuit
from utils import get_reward, nodes_edge_to_tensor, get_nodes_edge
from torch_geometric.data import Data, Batch
from multiprocessing import Pool
from qiskit.qpy import load
import concurrent.futures
from torch_geometric.loader.cache import to_device
device_cuda = torch.device("cuda" if torch.cuda.is_available() else "cpu")
device1 = "ibm_washington"
script_name = sys.argv[0]
if len(sys.argv) < 2:
    print(f"Usage: python {script_name} <num_qubits>")
    sys.exit(1)
flag = int(sys.argv[1])
num_processes = int(sys.argv[2])
flag2 = int(sys.argv[3])

reward_function = "node_gate_num"
q_network = None
def select_action(q_network, s):
    with torch.no_grad():
        state = Batch.from_data_list([s])
        state = to_device(state, device_cuda)
        q_values = q_network(state.x, state.edge_index, state.batch)
        sorted_indices = torch.argsort(-q_values, dim=1)
        # 将索引转换为 Python 列表
        sorted_indices_list = sorted_indices.tolist()
        # print(f"sorted_indices_list is {sorted_indices_list[0]}")
    return sorted_indices_list[0]
def circ_to_state(circuit, removes_gates=None):
    nodes_dict, edge_index = get_nodes_edge(circuit=circuit, enable_opt_gates_by_optpass=removes_gates)
    tensor_x, tensor_edge_index = nodes_edge_to_tensor(nodes_dict, edge_index)
    next_state = Data(x=tensor_x, edge_index=tensor_edge_index)
    return next_state

def get_all_results():
    global flag2, flag
    
    file_dir = "../circuits/reward_circuits_train_qpy/"
    file_list = [file_dir + file for file in os.listdir(file_dir)]
    reward_results = []
    total_iterations = 3000
    chunk_size = (total_iterations + num_processes - 1) // num_processes  # 确保所有任务都被覆盖
    chunks = range(flag2 * chunk_size, min((flag2 + 1) * chunk_size, total_iterations))  # 限制在总任务数范围内

    def process_file(qc_file):
        env = qiskit_env()
        env.predictor()
        env.reward_function = reward_function
        with open(qc_file, 'rb') as f:
            qc = load(f)[0]
        env.compiling_passmanager = PassManager()
        env.current_circ = qc
        state = circ_to_state(qc)
        while True:
            actions = select_action(q_network, state)
            observation, reward, done, store, info = env.step(actions)
            _, _, last_circuit, action = info
            if done:
                rw=get_reward(qc, last_circuit, reward_function=reward_function)
                return rw
            else:
                state = observation
    for i in tqdm(chunks):
        print(f"datetime : {datetime.now()}")
        i = i * 100
        try:
            if flag == 0:
                q_network = torch.load('../train/e-greedy/model/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_' + str(i) + '/policy_model.pth', map_location=torch.device('cpu'))
            elif flag == 1:
                q_network = torch.load('../train/e-greedy/model/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution/_' + str(i) + '/policy_model.pth', map_location=torch.device('cpu'))
            q_network.eval()                                                                            
        except Exception as e:
            print(f"Error loading model for iteration {i}: {e}")
            continue  # 如果加载模型失败，跳过当前迭代
        rs = 0
        with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
            results = list(executor.map(process_file, file_list))
            print(f"个数：{len(results)}")
            rs = sum(results)
        reward_results.append(rs)

    return reward_results

if __name__ == '__main__':
    if flag == 0:
        param_set= 'GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features'
    elif flag == 1:
        param_set= 'GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution'
    output_dir = './data/reward_line_data/' + reward_function+ '/' + param_set + '/'

    os.makedirs(output_dir, exist_ok=True)
    filename_model = os.path.join(output_dir, f'{param_set}_'+ str(flag2) +'.txt')
    reward_result = get_all_results()
    with open(filename_model, 'a+') as f:
        print(reward_result, file=f)
