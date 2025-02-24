import os
import sys
import time
from qiskit.transpiler import CouplingMap, PassManager
from qiskit.transpiler.passes import (
    Collect2qBlocks,
    CommutativeCancellation,
    ConsolidateBlocks,
    Depth,
    FixedPoint,
    GatesInBasis,
    MinimumPoint,
    Optimize1qGatesDecomposition,
    RemoveIdentityEquivalent,
    Size,
    UnitarySynthesis,
)
from qiskit.passmanager.flow_controllers import DoWhileController
from qiskit.providers.fake_provider import Fake127QPulseV1
from qiskit.passmanager import ConditionalController
from qiskit.transpiler.preset_passmanagers import common
from tqdm import tqdm
parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
sys.path.append(parent_dir)
from torch_geometric.loader.cache import to_device
from qiskit.transpiler import PassManager
import torch
from qiskit_env import qiskit_env, circ_to_state
from torch_geometric.data import Batch
import random
from qiskit import qpy
device_cuda = torch.device("cuda" if torch.cuda.is_available() else "cpu")

O3_method = {
                "name": "QiskitO3",
                "transpile_pass": lambda native_gate, coupling_map: [
                    Collect2qBlocks(),
                    ConsolidateBlocks(basis_gates=native_gate),
                    UnitarySynthesis(basis_gates=native_gate, coupling_map=coupling_map),
                    RemoveIdentityEquivalent(),
                    Optimize1qGatesDecomposition(basis=native_gate),
                    CommutativeCancellation(basis_gates=native_gate),
                    GatesInBasis(native_gate),
                    ConditionalController(
                        common.generate_translation_passmanager(
                            target=None, basis_gates=native_gate, coupling_map=coupling_map
                        ).to_flow_controller(),
                        condition=lambda property_set: not property_set["all_gates_in_basis"],
                    ),
                    Depth(recurse=True),
                    FixedPoint("depth"),
                    Size(recurse=True),
                    FixedPoint("size"),
                    MinimumPoint(["depth", "size"], "optimization_loop"),
                ],
                "origin": "qiskit",
                "do_while": lambda property_set: (not property_set["optimization_loop_minimum_point"]),
            }

device = Fake127QPulseV1()._get_conf_from_json()
num_actions = 4
def select_action(s, q_network):
    with torch.no_grad():
        state = Batch.from_data_list([s])
        state = to_device(state, device_cuda)
        q_values = q_network(state.x, state.edge_index, state.batch)
        sorted_indices = torch.argsort(-q_values, dim=1)
        sorted_indices_list = sorted_indices.tolist()
    return sorted_indices_list[0]
def random_select_action():
    return [random.randrange(num_actions) for i in range(num_actions)]

def load_q_network(flag, n):
    reward_functions = {
        0: ("node_gate_num", './model/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_' + str(n) + '/policy_model.pth', 'GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features'),
        1: ("node_gate_num", './model/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution/_' + str(n) + '/policy_model.pth', 'GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution'),
        2: ("node_gate_num_base_opt_depth_rate", './model/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_' + str(n) + '/policy_model.pth', 'GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features'),
        }
    reward_function, model_path, para_set = reward_functions.get(flag, (None, None))
    if reward_function is None:
        raise ValueError("Invalid flag value")

    q_network = torch.load(model_path)
    q_network.eval()
    return reward_function, q_network, para_set

def save_results(file_name, results):
    sorted_lines = sorted(results, key=lambda line: line.split()[0])
    with open(file_name, 'a+') as f:
        for line in sorted_lines:
            f.write(line)

def save_circuits(path, algorithm_name, circuit):
    with open(path + f'/{algorithm_name}.qpy', 'wb') as f:
        qpy.dump(circuit, f)

def run_qiskit_transpilation(qc):
    O3_pass = O3_method['transpile_pass']
    pm = PassManager()

    pm.append(
        DoWhileController(
            O3_pass(
                device.basis_gates,
                CouplingMap(device.coupling_map)
            ),
            do_while=O3_method["do_while"],
        ),
    )
    altered_qc = pm.run(qc)
    return altered_qc

def run_random_transpilation(qc, reward_function):
    env = qiskit_env()
    env.predictor()
    env.reward_function = reward_function
    env.current_circ = qc
    state = circ_to_state(qc)
    seq, r, i, depth, altered_qc, gate_num = [], 0, 0, None, None, 0
    while True:
        i+=1
        actions = random_select_action()
        if actions is None:
            break
        observation, reward, done, _, info = env.step(actions)
        depth, gate_num, compiled_cir, action = info
        seq.append(action)
        r += reward
        if done or i>10:
            break
        state = observation
    return compiled_cir, seq

def run_autotuning_transpilation(qc, reward_function, q_network):
    env = qiskit_env()
    env.predictor()
    env.reward_function = reward_function
    env.current_circ = qc
    state = circ_to_state(qc)
    seq, r, i, depth, altered_qc, gate_num = [], 0, 0, None, None, 0
    while True:
        i+=1
        actions = select_action(state, q_network)
        if actions is None:
            break
        observation, reward, done, _, info = env.step(actions)
        depth, gate_num, compiled_cir, action = info
        seq.append(action)
        r += reward
        if done or i>10:
            break
        state = observation
    return compiled_cir, seq

def test(t, reward_function, q_network, para_set, n):
    env = qiskit_env()
    env.predictor()
    env.reward_function = reward_function
    file_dir = "../circuits/" + t + "ing_data_compilation_qpy/"
    file_list = [file_dir + file for file in os.listdir(file_dir)]

    model_results = []
    qiskit_results = []
    random_results = []

    os.makedirs('./data/opt_rate/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    os.makedirs('./data/autotuning_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    os.makedirs('./data/qiskit_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    # os.makedirs('./data/random_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    filename_model = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/model_all_MQT_2_30_{t}_circuits_result.txt'
    filename_qiskit = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/qiskit_all_MQT_2_30_{t}_circuits_result.txt'
    # filename_random = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/random_all_MQT_2_30_{t}_circuits_result.txt'
    compiled_file_model_path = f'./data/autotuning_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    compiled_file_qiskit_path = f'./data/qiskit_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    # compiled_file_random_path = f'./data/random_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    for qasm_file in tqdm(file_list):
        algorithm_name, _ = os.path.splitext(os.path.basename(qasm_file))
        with open(qasm_file, 'rb') as f:
            qc = qpy.load(f)[0]
        env.current_circ = qc
        start_time_model = time.time()
        compiled_cir, seq = run_autotuning_transpilation(qc, reward_function, q_network)
        end_time_model = time.time()
        compile_time_model = end_time_model - start_time_model
        print(f"{qasm_file} : {seq}")
        save_circuits(compiled_file_model_path, algorithm_name, compiled_cir)
        # 记录模型结果
        if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
            model_results.append(f"{algorithm_name} {qc.depth()} {compiled_cir.depth()} {compile_time_model/60:.16f}\n")
        elif reward_function  in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
            model_results.append(f"{algorithm_name} {qc.size()} {compiled_cir.size()} {compile_time_model/60:.16f}\n")

        # start_time_model = time.time()
        # compiled_cir, seq = run_random_transpilation(qc, reward_function)
        # end_time_model = time.time()
        # compile_time_model = end_time_model - start_time_model
        # print(f"{qasm_file} : {seq}")
        # save_circuits(compiled_file_random_path, algorithm_name, compiled_cir)
        # # 记录模型结果
        # if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
        #     random_results.append(f"{algorithm_name} {qc.depth()} {compiled_cir.depth()} {compile_time_model/60:.16f}\n")
        # elif reward_function  in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
            # random_results.append(f"{algorithm_name} {qc.size()} {compiled_cir.size()} {compile_time_model/60:.16f}\n")

        start_time_qiskit = time.time()  # 记录开始时间
        altered_qc_qiskit = run_qiskit_transpilation(qc)
        end_time_qiskit = time.time()  # 记录结束时间
        compile_time_qiskit = end_time_qiskit - start_time_qiskit  # 计算编译时间
        save_circuits(compiled_file_qiskit_path, algorithm_name, altered_qc_qiskit)
        # 记录 Qiskit 结果
        if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
            qiskit_results.append(f"{algorithm_name} {qc.depth()} {altered_qc_qiskit.depth()} {compile_time_qiskit/60:.16f}\n")
        elif reward_function  in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
            qiskit_results.append(f"{algorithm_name} {qc.size()} {altered_qc_qiskit.size()} {compile_time_qiskit/60:.16f}\n")

    # 保存结果
    save_results(filename_model, model_results)
    save_results(filename_qiskit, qiskit_results)
    # save_results(filename_random, random_results)

def test_31_40(reward_function, q_network, para_set, n):
    env = qiskit_env()
    env.predictor()
    env.reward_function = reward_function
    file_dir = "../circuits/MQTBench_31_40_qpy/"
    file_list = [file_dir + file for file in os.listdir(file_dir)]

    model_results = []
    qiskit_results = []
    random_results = []
    os.makedirs('./data/opt_rate/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    os.makedirs('./data/autotuning_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    os.makedirs('./data/qiskit_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    # os.makedirs('./data/random_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    filename_model = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/model_all_MQT_2_30_circuits_result_31_40.txt'
    filename_qiskit = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/qiskit_all_MQT_2_30_circuits_result_31_40.txt'
    # filename_random = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/random_all_MQT_2_30_circuits_result_31_40.txt'
    compiled_file_model_path = f'./data/autotuning_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    compile_file_qiskit_path = f'./data/qiskit_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    # compiled_file_random_path = f'./data/random_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    for qasm_file in tqdm(file_list):
        algorithm_name, _ = os.path.splitext(os.path.basename(qasm_file))        
        with open(qasm_file, 'rb') as f:
            qc = qpy.load(f)[0]
        env.current_circ = qc
        start_time_model = time.time()
        compiled_cir, seq = run_autotuning_transpilation(qc, reward_function, q_network)
        end_time_model = time.time()
        compile_time_model = end_time_model - start_time_model
        print(f"{qasm_file} : {seq}")
        save_circuits(compiled_file_model_path, algorithm_name, compiled_cir)
        # 记录模型结果
        if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
            model_results.append(f"{algorithm_name} {qc.depth()} {compiled_cir.depth()} {compile_time_model/60:.16f}\n")
        elif reward_function in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
            model_results.append(f"{algorithm_name} {qc.size()} {compiled_cir.size()} {compile_time_model/60:.16f}\n")

        # start_time_model = time.time()
        # compiled_cir, seq = run_random_transpilation(qc, reward_function)
        # end_time_model = time.time()
        # compile_time_model = end_time_model - start_time_model
        # print(f"{qasm_file} : {seq}")
        # save_circuits(compiled_file_random_path, algorithm_name, compiled_cir)
        # # 记录模型结果
        # if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
        #     random_results.append(f"{algorithm_name} {qc.depth()} {compiled_cir.depth()} {compile_time_model/60:.16f}\n")
        # elif reward_function  in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
        #     random_results.append(f"{algorithm_name} {qc.size()} {compiled_cir.size()} {compile_time_model/60:.16f}\n")

        start_time_qiskit = time.time()  # 记录开始时间
        altered_qc_qiskit = run_qiskit_transpilation(qc)
        end_time_qiskit = time.time()  # 记录结束时间
        compile_time_qiskit = end_time_qiskit - start_time_qiskit  # 计算编译时间
        save_circuits(compile_file_qiskit_path, algorithm_name, altered_qc_qiskit)
        # 记录 Qiskit 结果
        if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
            qiskit_results.append(f"{algorithm_name} {qc.depth()} {altered_qc_qiskit.depth()} {compile_time_qiskit/60:.16f}\n")
        elif reward_function  in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
            qiskit_results.append(f"{algorithm_name} {qc.size()} {altered_qc_qiskit.size()} {compile_time_qiskit/60:.16f}\n")

    # 保存结果
    save_results(filename_model, model_results)
    save_results(filename_qiskit, qiskit_results)
    # save_results(filename_random, random_results)

def test_third(reward_function, q_network, para_set, n):
    env = qiskit_env()
    env.predictor()
    env.reward_function = reward_function
    file_dir = "../circuits/MQTBench_third_2_30_qpy/"
    file_list = [file_dir + file for file in os.listdir(file_dir)]

    model_results = []
    qiskit_results = []
    random_results = []
    os.makedirs('./data/autotuning_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    os.makedirs('./data/qiskit_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    # os.makedirs('./data/random_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    os.makedirs('./data/opt_rate/' + reward_function + '/' + para_set + '/_' + str(n), exist_ok=True)
    filename_model = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/model_test_circuits_result_third.txt'
    filename_qiskit = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/qiskit_test_circuits_result_third.txt'
    # filename_random = f'./data/opt_rate/{reward_function}/{para_set}/_{n}/random_test_circuits_result_third.txt'
    compiled_file_model_path = f'./data/autotuning_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    compile_file_qiskit_path = f'./data/qiskit_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    # compiled_file_random_path = f'./data/random_compiled_circuits/' + reward_function + '/' + para_set + '/_' + str(n)
    for qasm_file in tqdm(file_list):
        algorithm_name, _ = os.path.splitext(os.path.basename(qasm_file))
        with open(qasm_file, 'rb') as f:
            qc = qpy.load(f)[0]
        env.current_circ = qc
        start_time_model = time.time()
        compiled_cir, seq = run_autotuning_transpilation(qc, reward_function, q_network)
        end_time_model = time.time()
        compile_time_model = end_time_model - start_time_model
        print(f"{qasm_file} : {seq}")
        save_circuits(compiled_file_model_path, algorithm_name, compiled_cir)
        # 记录模型结果
        if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
            model_results.append(f"{algorithm_name} {qc.depth()} {compiled_cir.depth()} {compile_time_model/60:.16f}\n")
        elif reward_function in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
            model_results.append(f"{algorithm_name} {qc.size()} {compiled_cir.size()} {compile_time_model/60:.16f}\n")

        # start_time_model = time.time()
        # compiled_cir, seq = run_random_transpilation(qc, reward_function)
        # end_time_model = time.time()
        # compile_time_model = end_time_model - start_time_model
        # print(f"{qasm_file} : {seq}")
        # save_circuits(compiled_file_random_path, algorithm_name, compiled_cir)
        # # 记录模型结果
        # if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
        #     random_results.append(f"{algorithm_name} {qc.depth()} {compiled_cir.depth()} {compile_time_model/60:.16f}\n")
        # elif reward_function  in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
        #     random_results.append(f"{algorithm_name} {qc.size()} {compiled_cir.size()} {compile_time_model/60:.16f}\n")

        start_time_qiskit = time.time()  # 记录开始时间
        altered_qc_qiskit = run_qiskit_transpilation(qc)
        end_time_qiskit = time.time()  # 记录结束时间
        compile_time_qiskit = end_time_qiskit - start_time_qiskit  # 计算编译时间
        save_circuits(compile_file_qiskit_path, algorithm_name, altered_qc_qiskit)
        # 记录 Qiskit 结果
        if reward_function in ["opt_depth_rate", "opt_depth_rate_base_node_gate_num"]:
            qiskit_results.append(f"{algorithm_name} {qc.depth()} {altered_qc_qiskit.depth()} {compile_time_qiskit/60:.16f}\n")
        elif reward_function in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
            qiskit_results.append(f"{algorithm_name} {qc.size()} {altered_qc_qiskit.size()} {compile_time_qiskit/60:.16f}\n")

    # 保存结果
    save_results(filename_model, model_results)
    save_results(filename_qiskit, qiskit_results)
    # save_results(filename_random, random_results)

def main():
    if len(sys.argv) < 3:
        print(f"Usage: python {sys.argv[0]} <flag> <num_qubits>")
        sys.exit(1)
    
    flag = int(sys.argv[1])
    n = int(sys.argv[2])

    reward_function, q_network, para_set = load_q_network(flag, n)
    
    test("train", reward_function, q_network, para_set, n)
    test("test", reward_function, q_network, para_set, n)
    test_31_40(reward_function, q_network, para_set, n)
    test_third(reward_function, q_network, para_set, n)

if __name__ == "__main__":
    main()