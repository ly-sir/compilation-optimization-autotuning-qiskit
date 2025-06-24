from train.e_greedy.utils import get_pre_compile_passmanager
from train.e_greedy.qiskit_env_predictor import qiskit_env
from qiskit.providers.fake_provider import Fake127QPulseV1
from qiskit.transpiler import CouplingMap
from qiskit import QuantumCircuit

def run_autotuning_transpilation(qc):
    device_cuda = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model_path = f"./train/egreedy/model/node_gate_num/GAT_learn_rate_000001_30000_net_256_relu_memory_30000_batch_128_e_greedy_O3_preprocessing/_250000/policy_model.pth"
    q_network = torch.load(model_path, map_location=device_cuda)
    q_network.eval()
    reward_function = "node_gate_num"
    s = get_pre_compile_passmanager()
    pre_compiled_qc = s.run(qc)
    env = qiskit_env()
    env.reward_function = reward_function
    env.current_circ = pre_compiled_qc
    state = circ_to_state(pre_compiled_qc)
    compiled_cir = pre_compiled_qc
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

# demo

qasm_path = "./new_circuits/MQTBench_2_30_train/graphstate_indep_tket_20.qasm"
ciruit = QuantumCircuit.from_qasm_file(qasm_path)

compiled_circuit, seq = run_autotuning_transpilation(ciruit)

