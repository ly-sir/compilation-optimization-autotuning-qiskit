from datetime import datetime
import glob
import os
import sys
import copy
from qiskit import QuantumCircuit
from qiskit.transpiler import CouplingMap, Layout, PassManager
from tqdm import tqdm

from utils import get_pre_compile_passmanager, get_reward
parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
sys.path.append(parent_dir)
from qiskit.transpiler import PassManager
import torch
from qiskit_env_test import qiskit_env
from qiskit.qpy import load
import concurrent.futures
device_cuda = torch.device("cuda" if torch.cuda.is_available() else "cpu")
device1 = "ibm_washington"
script_name = sys.argv[0]
if len(sys.argv) < 2:
    print(f"Usage: python {script_name} <num_qubits>")
    sys.exit(1)
flag = int(sys.argv[1])
num_processes = int(sys.argv[2])
flag2 = int(sys.argv[3])
if flag==0:
    reward_function = "opt_depth_rate"
else:
    reward_function = "node_gate_num"
q_network = None

def get_all_results():
    global flag2, flag
    
    # file_dir = "../circuits/MQTBench_2_30_train/"
    # file_list = [file_dir + file for file in os.listdir(file_dir)]
    # 获取当前脚本所在目录的父目录
    parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))

    # 构造目标文件夹路径（假设目标文件夹在父目录下）
    qasm_files_dir = os.path.join(parent_dir, "new_circuits/MQTBench_2_30_train/")

    # 使用 glob 查找指定目录中的所有 .qasm 文件
    file_list = glob.glob(os.path.join(qasm_files_dir, "*.qasm"))

    seqs = []
    reward_results = []
    seq_results = []
    file_results = []
    total_iterations = 255
    chunk_size = (total_iterations + num_processes - 1) // num_processes  # 确保所有任务都被覆盖
    chunks = range(flag2 * chunk_size, min((flag2 + 1) * chunk_size, total_iterations))  # 限制在总任务数范围内
    with open('all_sequences.txt', 'r') as f:
        lines = f.read()
        seqs = lines.split('\n')
    env_ = qiskit_env()
    def process_file(seq):
        env = copy.deepcopy(env_)
        env.reward_function = reward_function

        s = [int(char) for char in seq if char.isdigit()]
        
        env.current_circ = env.pre_passmanager.run(init_qc)
        
        for index, action in enumerate(s):
            observation, reward, done, store, info = env.step(s[index:])
            _, _, last_circuit, action = info
            if index == len(s)-1:
                rw = get_reward(init_qc, last_circuit, reward_function=reward_function)
                return (rw, seq)
        
    for i in tqdm(chunks):
        print(f"datetime : {datetime.now()}")
        q_file = file_list[i]
        init_qc = QuantumCircuit.from_qasm_file(q_file)
        rs = []
        ss = []
        r_max = 0
        with concurrent.futures.ThreadPoolExecutor(max_workers=2) as executor:
            results = list(executor.map(process_file, seqs))
            results = [r for r in results if r is not None]
            print(results)
            for result in results:
                rw, seq_ = result
                rs.append(rw)
                ss.append(seq_)
            r_max = max(rs)
            max_index = rs.index(max(rs))
            max_seq = ss[max_index]

        reward_results.append(r_max)
        seq_results.append(max_seq)
        file_results.append(q_file)

    return reward_results, seq_results, file_results

if __name__ == '__main__':
    param_set= 'force_grove'
    output_dir1 = './data/reward_line_data/' + reward_function+ '/' + param_set + '/reward_results/'
    output_dir2 = './data/reward_line_data/' + reward_function+ '/' + param_set + '/seq_results/'
    output_dir3 = './data/reward_line_data/' + reward_function+ '/' + param_set + '/file_results/'
    
    os.makedirs(output_dir1, exist_ok=True)
    os.makedirs(output_dir2, exist_ok=True)
    os.makedirs(output_dir3, exist_ok=True)
    result_file_name1 = os.path.join(output_dir1, 'force_grove_'+ 'reward_results_' + str(flag2) +'.txt')
    result_file_name2 = os.path.join(output_dir2, 'force_grove_'+ 'seq_results_' + str(flag2) +'.txt')
    result_file_name3 = os.path.join(output_dir3, 'force_grove_'+ 'file_results_' + str(flag2) +'.txt')
    reward_result, seq_results, file_results = get_all_results()
    with open(result_file_name1, 'a+') as f:
        print(reward_result, file=f)
    with open(result_file_name2, 'a+') as f:
        print(seq_results, file=f)
    with open(result_file_name3, 'a+') as f:
        print(file_results, file=f)