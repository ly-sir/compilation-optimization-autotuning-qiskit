import numpy as np
import matplotlib.pyplot as plt
import os
import ast
import matplotlib.ticker as ticker
from matplotlib.lines import Line2D
from matplotlib.patches import ConnectionPatch, Rectangle
from tqdm import tqdm
from qiskit import qpy

def sum_numbers_in_folder(folder_path):
    total_sum = 0

    # 遍历文件夹中的所有文件
    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)
        
        # 检查是否为文件（排除子文件夹）
        if os.path.isfile(file_path):
            try:
                # 读取文件内容
                with open(file_path, 'r', encoding='utf-8') as file:
                    content = file.read().strip()  # 去除首尾空白和换行

                # 使用 ast.literal_eval 将内容解析为列表
                numbers = ast.literal_eval(content)
                
                # 检查是否为列表
                if isinstance(numbers, list) and all(isinstance(num, (int, float)) for num in numbers):
                    # 将数字累加
                    total_sum += sum(numbers)
                else:
                    print(f"文件 {file_path} 的内容格式不正确，无法解析为数字列表。")
            except Exception as e:
                print(f"处理文件 {file_path} 时出错：{e}")
    return total_sum

def load_reward_data(file_path, start=0, end=3000):
    """加载并处理奖励数据"""
    if not os.path.exists(file_path):
        print(f"文件不存在: {file_path}")
        return np.array([]), np.array([])
    
    try:
        with open(file_path, "r") as f:
            raw_data = f.read().strip().strip('[]')
        data_list = [float(x.strip()) for x in raw_data.split(',') if x.strip()]
        data = np.array(data_list[start:end], dtype=float)
        return np.arange(len(data)), data
    except Exception as e:
        print(f"加载数据出错 {file_path}: {str(e)}")
        return np.array([]), np.array([])

def calculate_plot_limits(*datasets, padding_ratio=0.15):
    """动态计算绘图范围"""
    valid_data = [d for d in datasets if len(d) > 0]
    if not valid_data:
        return 0, 1  # 默认范围
    
    data_min = min(np.min(d) for d in valid_data)
    data_max = max(np.max(d) for d in valid_data)
    padding = (data_max - data_min) * padding_ratio
    return data_min - padding, data_max + padding

def count_sum_reward(defores, afters):
    sum_reward = 0
    for defore, after in zip(defores, afters):
        sum_reward += (defore-after)/defore
    return sum_reward

def get_count(qpy_path):
    reward_functions = ["opt_depth_rate", "node_gate_num"]
    node_gate_num_afteres = []
    opt_depth_rate_afteres = []
    file_list = [qpy_path + file for file in os.listdir(qpy_path)]
    for qasm_file in tqdm(file_list):
        algorithm_name, _ = os.path.splitext(os.path.basename(qasm_file))
        with open(qasm_file, 'rb') as f:
            qc = qpy.load(f)[0]
        for reward_function in reward_functions:
            if reward_function in ["opt_depth_rate"]:
                opt_depth_rate_afteres.append(qc.depth())
            elif reward_function  in ["node_gate_num", "node_gate_num_base_opt_depth_rate"]:
                node_gate_num_afteres.append(qc.size())
    return node_gate_num_afteres, opt_depth_rate_afteres

def process_file(filename, expected_parts):
    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            # 文件B有5个部分
            parts = line.split()
            if len(parts) == expected_parts:
                yield parts
            else:
                print(f"Unexpected number of parts in line: {line}")

def get_data(train=False, test=False, third=False, big=False):
    algorithm_names = []
    before_a = []
    after_a = []
    before_b = []
    after_b = []
    time_a = []
    time_b = []
    if big:
        a_result = "./result/fanxiu/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000/model_all_MQT_2_30_circuits_result_30_40.txt"
        b_result = "./result/fanxiu/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000/qiskit_all_MQT_2_30_circuits_result_30_40.txt"
    if test:
        a_result = "./result/fanxiu/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000/model_all_MQT_2_30_test_circuits_result.txt"
        b_result = "./result/fanxiu/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000/qiskit_all_MQT_2_30_test_circuits_result.txt"
        
    if train:
        a_result = "./result/fanxiu/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000/model_all_MQT_2_30_train_circuits_result.txt"
        b_result = "./result/fanxiu/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000/qiskit_all_MQT_2_30_train_circuits_result.txt"

    if third:
        a_result = "./result/fanxiu/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000/model_test_circuits_result_third.txt"
        b_result = "./result/fanxiu/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000/qiskit_test_circuits_result_third.txt"


    for parts in process_file(a_result, 4):
        algorithm_name, before, after, time = parts
        algorithm_names.append(algorithm_name)
        before_a.append(int(before))
        after_a.append(int(after))
        time_a.append(float(time))
    for parts in process_file(b_result, 4):
        algorithm_name, before, after, time = parts
        before_b.append(int(before))
        after_b.append(int(after))
        time_b.append(float(time))

    return algorithm_names, before_a, after_a, before_b, after_b, time_a, time_b

def make_reward_compare_e_greedy_distribution_plot(n):
    # ==================== 数据加载配置 ====================
    file_config = {
        "node_gate_num": {
            "data3": "../data/reward_line_data/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features.txt",
            "data5": "../data/reward_line_data/node_gate_num/GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution.txt",
            "data4": "../data/reward_line_data/node_gate_num/force_grove/reward_results/"
        },
    }
    # ==================== 数据加载 ====================
    all_config = file_config.get(n, {})

    # 主图加载0 - 3000步数据
    x3, data3 = load_reward_data(all_config.get("data3", ""), 0, 3000)
    x5, data5 = load_reward_data(all_config.get("data5", ""), 0, 3000) if n == "node_gate_num" else (np.array([]), np.array([]))

    # ==================== 可视化设置 ====================
    plt.style.use('seaborn-v0_8')
    fig = plt.figure(figsize=(16, 8))
    plt.rcParams.update({
        'legend.framealpha': 0.9,
        'legend.facecolor': '#F8F8FF',  # 浅灰色背景
        'legend.labelspacing': 0.3,
        'legend.borderpad': 0.4
    })
    gs = fig.add_gridspec(2, 2, width_ratios=[3, 1.5], height_ratios=[1, 1],
                          hspace=0.35, wspace=0.25)

    # ==================== 主图绘制 ====================
    ax = fig.add_subplot(gs[:, 0])

    total_sum4 = sum_numbers_in_folder(all_config.get("data4", ""))
    ax.axhline(y=total_sum4, color='#FF4500', linestyle='-')

    # 绘制主曲线
    line_width = 1.5
    if len(data3) > 0:
        ax.plot(x3, data3, color='#6A5ACD', linewidth=line_width, zorder=3)
    if len(data5) > 0:
        ax.plot(x5, data5, color='green', linewidth=line_width, zorder=3)

   # 创建自定义图例
    legend_elements = [
        Line2D([0], [0], color='#FF4500', lw=2, linestyle='-', label=f'Force Grove (Sum = {total_sum4})'),
        Line2D([0], [0], color='#6A5ACD', lw=2, label='D3QN (e-greedy)'),
        Line2D([0], [0], color='green', lw=2, label='Distribution D3QN')
    ]

    # 将图例放置在绘图区域外的右上方
    leg = ax.legend(
        handles=legend_elements,
        loc='upper right',
        bbox_to_anchor=(1, 0.16),
        frameon=True,
        fancybox=True,
        shadow=True,
        edgecolor='#FF4500',
        fontsize=11
    )

    # 在调用tight_layout之前设置图例
    fig.tight_layout(rect=[0, 0, 0.85, 1])  # 右侧保留15%空间给图例
    # 坐标轴设置
    ax.set_xlim(-50, 3000)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(500))
    ax.xaxis.set_minor_locator(ticker.MultipleLocator(100))
    ax.yaxis.set_major_locator(ticker.AutoLocator())

    # 动态纵坐标范围
    y_min, y_max = calculate_plot_limits(data3, data5, padding_ratio=0.2)
    ax.set_ylim(y_min, y_max)

    # ==================== 动态虚线框设置 ====================
    def get_region_limits(data, x_array, start_step, end_step):
        mask = (x_array >= start_step) & (x_array <= end_step)
        region_data = data[mask]
        if len(region_data) == 0:
            return np.min(data), np.max(data)  # 回退到全局范围
        y_min = np.min(region_data)
        y_max = np.max(region_data)
        return y_min - 4.56, y_max + 4.56

    # 第一个虚线框（500 - 2000步）
    box1_ylim = get_region_limits(data3, x3, 500, 2000)
    rect1 = Rectangle((450, box1_ylim[0]), 1500, box1_ylim[1] - box1_ylim[0],
                      linestyle='--', linewidth=1.2, edgecolor='#2F4F4F',
                      alpha=0.8, fill=False, zorder=2)
    ax.add_patch(rect1)

    # 第二个虚线框（2000 - 3000步）
    box2_ylim = get_region_limits(data3, x3, 1500, 3000)
    rect2 = Rectangle((1500, box2_ylim[0] + 1), 1450, box2_ylim[1] - box2_ylim[0],
                      linestyle='--', linewidth=1.2, edgecolor='#2F4F4F',
                      alpha=0.8, fill=False, zorder=2)
    ax.add_patch(rect2)

    # ==================== 子图绘制 ====================
    # 子图1：500 - 2000步
    ax1 = fig.add_subplot(gs[0, 1])
    mask1 = (x3 >= 500) & (x3 <= 2000)
    ax1.plot(x3[mask1], data3[mask1], color='#6A5ACD', alpha=0.8)
    ax1.fill_between(x3[mask1], data3[mask1], color='#6A5ACD', alpha=0.1)
    ax1.axhline(y=total_sum4, color='#FF4500', linestyle='-')
    ax1.plot(x5[mask1], data5[mask1], color='green', linewidth=line_width, alpha=0.8)
    ax1.fill_between(x5[mask1], data5[mask1], color='#FF4500', alpha=0.1)
    ax1.set_title('50000 - 200000 Steps', fontsize=12, fontweight='bold')
    ax1.set_xlim(500, 2000)
    ax1.set_ylim(box1_ylim[0], box1_ylim[1])

    # 子图2：1500 - 3000步
    ax2 = fig.add_subplot(gs[1, 1])
    mask2 = (x3 >= 1500) & (x3 <= 3000)
    ax2.plot(x3[mask2], data3[mask2], color='#6A5ACD', linewidth=line_width, alpha=0.8)
    ax2.fill_between(x3[mask2], data3[mask2], color='#6A5ACD', alpha=0.1)
    ax2.axhline(y=total_sum4, color='#FF4500', linestyle='-')
    ax2.plot(x5[mask2], data5[mask2], color='green', linewidth=line_width, alpha=0.8)
    ax2.fill_between(x5[mask2], data5[mask2], color='#FF4500', alpha=0.1)
    ax2.set_title('150000 - 300000 Steps', fontsize=12, fontweight='bold')
    ax2.set_xlim(1500, 3000)
    ax2.set_ylim(box2_ylim[0], box2_ylim[1])


    # ==================== 图例和标签 ====================
    ax.set_xlabel('N/100 Steps', fontsize=14, fontweight='bold')
    ax.set_ylabel('Reward', fontsize=14, fontweight='bold')

    # 箭头样式配置
    arrow_style1 = {
        "arrowstyle": "->",
        "color": "#2F4F4F",
        "linewidth": 1.2,
        "linestyle": "--",
        "mutation_scale": 20,
        "connectionstyle": "arc3,rad=0.3"  # 添加曲线样式，rad控制弧度
    }
    arrow_style2 = {
        "arrowstyle": "->",
        "color": "#2F4F4F",
        "linewidth": 1.2,
        "linestyle": "--",
        "mutation_scale": 20,
        "connectionstyle": "arc3,rad=-0.3"  # 添加曲线样式，rad控制弧度
    }

    # 第一个箭头（连接主图框1到子图1）
    box1_mid_y = (box1_ylim[0])
    connection1 = ConnectionPatch(
        xyA=(1200, box1_mid_y),  # 主图框右侧中点（数据坐标系）
        xyB=(-0.1, 0.5),            # 子图左侧中点（axes坐标系）
        coordsA=ax.transData,    # 主图数据坐标系
        coordsB=ax1.transAxes,   # 子图axes坐标系
        **arrow_style1
    )
    fig.add_artist(connection1)

    # 第二个箭头（连接主图框2到子图2）
    box2_mid_y = (box2_ylim[0]+1)
    connection2 = ConnectionPatch(
        xyA=(2200, box2_mid_y),  # 主图框右侧中点（数据坐标系）
        xyB=(-0.1, 1),            # 子图左侧中点（axes坐标系）
        coordsA=ax.transData,    # 主图数据坐标系
        coordsB=ax2.transAxes,   # 子图axes坐标系
        **arrow_style2
    )
    fig.add_artist(connection2)
    # 设置主图标题
    ax.set_title("Reward Line (Gate Number)", 
                fontsize=16, 
                fontweight='bold', 
                pad=20)  # pad参数控制标题与图的间距
    plt.show()

make_reward_compare_e_greedy_distribution_plot("node_gate_num")