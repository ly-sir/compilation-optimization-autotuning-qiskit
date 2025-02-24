import pickle
import sys
import random
from collections import deque
from qiskit_env import qiskit_env
from tqdm import tqdm
import os
from datetime import datetime
script_name = sys.argv[0]
if len(sys.argv) < 2:
    print(f"Usage: python {script_name} <num_qubits>")
    sys.exit(1)
flag1 = int(sys.argv[1])
flag2 = sys.argv[2]
# n = 11
# torch.manual_seed(42)
episodes = 30000
reward_functions = ["node_gate_num", "opt_depth_rate"]
reward_function = reward_functions[flag1]
maxlen = 30000
os.makedirs("./memory/"+ reward_function, exist_ok=True)
memory = deque(maxlen=maxlen)
env = qiskit_env()
env.reward_function = reward_function
num_actions = 4

def select_action():
    return [random.randrange(num_actions) for i in range(num_actions)]

while True:
    state = env.reset()
    init_depth = env.current_circ.depth()
    rewards = 0
    for time in range(10):
        actions = select_action()
        next_state, reward, done, store, info = env.step(actions)
        # print(reward)
        action = info[3]
        if store:
            memory.append((state, action, reward, next_state, done))
        state = next_state
        
        if done:
            current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            print(f"{current_time} - {episodes}, Memory_len: {len(memory)}")
            break
    if len(memory)==maxlen:
        break

with open("./memory/"+ reward_function+"/memory"+flag2+".pkl", "wb") as f:
    pickle.dump(memory, f)