from collections import deque
from datetime import datetime
from torch_geometric.loader.cache import to_device
from Model import GATNetwork
import torch
import torch.nn as nn
import random
from qiskit_env import qiskit_env
from tqdm import tqdm
from torch_geometric.data import Batch
import os, sys
from torch.amp import GradScaler, autocast

script_name = sys.argv[0]
if len(sys.argv) < 2:
    print(f"Usage: python {script_name} <num_qubits>")
    sys.exit(1)
flag = int(sys.argv[1])

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
torch.manual_seed(42)
scaler = GradScaler()

# 定义动作数和特征维度
num_actions = 4
input_dim = 7  # One-hot编码特征的长度
hidden_dim = 256  # 隐藏层特征维度
episodes = 300000
gamma = 0.90  # 折扣因子
epsilon = 1.0  # 初始探索率
epsilon_min = 0.10  # 最小探索率
epsilon_decay = 0.999987 # 探索率衰减
batch_size = 128  # 批量大小
reward_functions = ["node_gate_num", "opt_depth_rate"]
target_net_update_frequency = 500
compile_opt_max_episode = 30
env = qiskit_env()
reward_function = reward_functions[flag]
env.reward_function = reward_function
param_set = "GAT_learn_rate_000001_30000_net_256_relu_memory_30000_batch_128_e_greedy"
max_memory_len = 30000
q_network = GATNetwork(input_dim, hidden_dim, num_actions).to(device)
target_network = GATNetwork(input_dim, hidden_dim, num_actions).to(device)
target_network.load_state_dict(q_network.state_dict())
memory = deque(maxlen=max_memory_len)
# 优化器和损失函数
optimizer = torch.optim.Adam(q_network.parameters(), lr=0.00001)

# 使用Huber损失函数
criterion = nn.MSELoss()

def select_action(state, epsilon):
    # epsilon = 0
    if random.random() <= epsilon:
        l = [random.randrange(num_actions) for i in range(num_actions)]
        # print(f"l is {l}")
        return l
    else:
        with torch.no_grad():
            state = Batch.from_data_list([state])
            state = to_device(state, device)
            q_values = q_network(state.x, state.edge_index, state.batch)
            sorted_indices = torch.argsort(-q_values, dim=1)
            # 将索引转换为 Python 列表
            sorted_indices_list = sorted_indices.tolist()
            # print(f"sorted_indices_list is {sorted_indices_list[0]}")
        return sorted_indices_list[0]

losses = 0

def learn():
    if len(memory) < batch_size:
        return
    batch = random.sample(memory, batch_size)
    
    state_batch, action_batch, reward_batch, next_state_batch, done_batch = zip(*batch)

    next_state_batch = [s if s is not None else state_batch[0] for s in next_state_batch]

    state_batch = to_device(Batch.from_data_list(list(state_batch)), device)
    next_state_batch = to_device(Batch.from_data_list(next_state_batch), device)
    reward_batch = torch.tensor(reward_batch, dtype=torch.float32, device=device)
    done_batch = torch.tensor(done_batch, dtype=torch.float32, device=device)
    action_batch = torch.tensor(action_batch, dtype=torch.int64, device=device)

    with autocast(device_type="cuda"):  # Use AMP to reduce memory usage
        q_values = q_network(state_batch.x, state_batch.edge_index, state_batch.batch)
        with torch.no_grad():  # No need to track gradients for target network
            next_q_values_online = q_network(next_state_batch.x, next_state_batch.edge_index, next_state_batch.batch)
            best_next_actions = next_q_values_online.argmax(dim=1)
            next_q_values_target = target_network(next_state_batch.x, next_state_batch.edge_index, next_state_batch.batch)
            next_max_q_values = next_q_values_target.gather(1, best_next_actions.unsqueeze(1)).squeeze(1)
        
        q_target = q_values.clone().detach()
        
        not_done_indices = torch.logical_not(done_batch)
        targets = reward_batch + gamma * next_max_q_values * not_done_indices

        for i in range(batch_size):
            q_target[i, action_batch[i]] = targets[i]
    
        loss = criterion(q_values, q_target)

    optimizer.zero_grad()
    scaler.scale(loss).backward()
    scaler.step(optimizer)
    scaler.update()
with tqdm(total=max_memory_len, desc="Filling Replay Buffer", unit="sample") as pbar:
    while len(memory) < max_memory_len:
        state = env.reset()
        init_depth = env.current_circ.depth()
        for time in range(10):  # 每回合最多60步
            actions = select_action(state, epsilon)
            next_state, reward, done, store, info = env.step(actions)
            action = info[3]
            if (action != -1):
                memory.append((state, action, reward, next_state, done))
            pbar.update(1)            
            if len(memory) == max_memory_len:
                print("Memory reached max capacity")
                break
            if done:
                # print("Episode done")
                break
            
            state = next_state

i=0
for e in tqdm(range(episodes)):  # 训练10000个回合
    state = env.reset()
    init_depth = env.current_circ.depth()
    seq = []
    for time in range(10):  # 每回合最多60步
        actions = select_action(state, epsilon)
        next_state, reward, done, store, info = env.step(actions)
        action = info[3]
        if (action != -1):
            memory.append((state, action, reward, next_state, done))
        seq.append(action)
        state = next_state
        learn()
        if i%target_net_update_frequency == 0:
            target_network.load_state_dict(q_network.state_dict())
        if i % 100 == 0:
            dir_path = "./model/" + reward_function + "/" + param_set + f"/_{i}/"
            os.makedirs(dir_path, exist_ok=True)
            torch.save(q_network, f'{dir_path}policy_model.pth')
            torch.save(target_network, f'{dir_path}target_model.pth')
        i+=1
        if epsilon > epsilon_min:
                epsilon *= epsilon_decay
        if done:
            current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            print(f"{current_time} - Episode {i}/{episodes}, epsilon: {epsilon}, Time: {time}, seq: {seq}")
            break
        
    if i>episodes:
        break
