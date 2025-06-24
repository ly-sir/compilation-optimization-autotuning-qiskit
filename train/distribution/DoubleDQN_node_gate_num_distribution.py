import math
from torch_geometric.loader.cache import to_device
from Model import GATNetwork
from itertools import islice
import torch
import torch.nn as nn
import random
from qiskit_env import qiskit_env
from tqdm import tqdm
from torch_geometric.data import Batch
import os, sys
from torch.amp import GradScaler, autocast
from utils import sum_deques_in_folder

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

capacity = 30000
memory_capacity = capacity
point_start = 0
point_end = memory_capacity
env = qiskit_env()
reward_function = ["node_gate_num", "opt_depth_rate"][flag]
env.reward_function = reward_function
memory_path = './memory/'+ reward_function +'/'
point_start = 0
point_end = 30000
memory_step = 1

target_net_update_frequency = 500
compile_opt_max_episode = 30
episodes = 30000

gamma = 0.90  # 折扣因子
batch_size = 128  # 批量大小

param_set = "GAT_learn_rate_000001_30000_net_256_relu_memory_30000_batch_128_distribution"

# Initialize Q Network and Target Network
q_network = GATNetwork(input_dim, hidden_dim, num_actions).to(device)
target_network = GATNetwork(input_dim, hidden_dim, num_actions).to(device)
target_network.load_state_dict(q_network.state_dict())

# 优化器和损失函数
optimizer = torch.optim.Adam(q_network.parameters(), lr=0.00001)
criterion = nn.MSELoss()

losses = 0

def learn():
    global point_start, point_end
    if (point_end - point_start) < batch_size:
        return
    
    memory_slice = list(islice(memory, math.floor(point_start), math.floor(point_end)))
    batch = random.sample(memory_slice, batch_size)
    
    state_batch, action_batch, reward_batch, next_state_batch, done_batch = zip(*batch)
    
    # 处理 next_state_batch 中可能的 None 值，替换为 state_batch 中的第一个状态
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
            next_q_values_target = target_network(next_state_batch.x, next_state_batch.edge_index, next_state_batch.batch)
            best_next_actions = next_q_values_online.argmax(dim=1)
            next_max_q_values = next_q_values_target.gather(1, best_next_actions.unsqueeze(1)).squeeze(1)
        
        q_target = q_values.clone().detach()
        not_done_indices = torch.logical_not(done_batch)
        targets = reward_batch + gamma * next_max_q_values * not_done_indices

        for i in range(batch_size):
            q_target[i, action_batch[i]] = targets[i]
    
        # 计算加权损失
        loss = criterion(q_values, q_target).mean()  # 确保这是标量

    optimizer.zero_grad()
    scaler.scale(loss).backward()
    scaler.step(optimizer)
    scaler.update()

memory = sum_deques_in_folder(memory_path, 0)

len_memory = len(memory)
nums = 0
for j in range(1,11):
    print(j)
    for i in tqdm(range(memory_capacity)):
        point_end += memory_step
        point_start += memory_step
        if point_end >= len_memory:
            del memory
            memory = sum_deques_in_folder(memory_path, j)
            point_start = 0
            point_end = memory_capacity
            len_memory = len(memory)
            break
        learn()
        if nums % target_net_update_frequency == 0:
            target_network.load_state_dict(q_network.state_dict())
        if nums % 100 == 0:
            dir_path = "./model/" + reward_function + "/" + param_set + f"/_{nums}/"
            os.makedirs(dir_path, exist_ok=True)
            torch.save(q_network, f'{dir_path}policy_model.pth')
            torch.save(target_network, f'{dir_path}target_model.pth')
        nums+=1