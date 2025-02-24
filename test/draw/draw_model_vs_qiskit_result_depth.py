import re
import numpy as np
import matplotlib.pyplot as plt
from collections import defaultdict
from scipy.signal import savgol_filter
import matplotlib.patches as patches
import seaborn as sns
import pandas as pd

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
    param_set = "GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution"
    n = 299900

    ##################################################################################################################################
    #                                                           opt_depth_rate_base_node_gate_num                                                        #
    ##################################################################################################################################
    if big:
        a_result = "../data/opt_rate/opt_depth_rate_base_node_gate_num/"+ param_set +"/_"+ str(n) +"/model_all_MQT_2_30_circuits_result_31_40.txt"
        b_result = "../data/opt_rate/opt_depth_rate_base_node_gate_num/"+ param_set +"/_"+ str(n) +"/qiskit_all_MQT_2_30_circuits_result_31_40.txt"
    if test:
        a_result = "../data/opt_rate/opt_depth_rate_base_node_gate_num/"+ param_set +"/_"+ str(n) +"/model_all_MQT_2_30_test_circuits_result.txt"
        b_result = "../data/opt_rate/opt_depth_rate_base_node_gate_num/"+ param_set +"/_"+ str(n) +"/qiskit_all_MQT_2_30_test_circuits_result.txt"
        
    if train:
        a_result = "../data/opt_rate/opt_depth_rate_base_node_gate_num/"+ param_set +"/_"+ str(n) +"/model_all_MQT_2_30_train_circuits_result.txt"
        b_result = "../data/opt_rate/opt_depth_rate_base_node_gate_num/"+ param_set +"/_"+ str(n) +"/qiskit_all_MQT_2_30_train_circuits_result.txt"

    if third:
        a_result = "../data/opt_rate/opt_depth_rate_base_node_gate_num/"+ param_set +"/_"+ str(n) +"/model_test_circuits_result_third.txt"
        b_result = "../data/opt_rate/opt_depth_rate_base_node_gate_num/"+ param_set +"/_"+ str(n) +"/qiskit_test_circuits_result_third.txt"

    for parts in process_file(a_result, 4):
        algorithm_name, before, after, time = parts
        algorithm_names.append(algorithm_name)
        before_a.append(float(before))
        after_a.append(float(after))
        time_a.append(float(time))

    for parts in process_file(b_result, 4):
        algorithm_name, before, after, time = parts
        before_b.append(float(before))
        after_b.append(float(after))
        time_b.append(float(time))

    return algorithm_names, before_a, after_a, before_b, after_b, time_a, time_b

def get_increase_rate_data(algorithm_names, before_a, after_a, before_b, after_b):
    dict_count = defaultdict(float)
    for i, name in enumerate(algorithm_names):  # 使用正确的列表
        algo_parts = name.split('_')
        algo_key = f"{algo_parts[0]}"  # 构造正确的键
        dict_count[algo_key] += after_b[i]

    # 处理并计算提升幅度
    improvements = defaultdict(list)  # 默认字典存放每种算法的提升列表

    # 匹配模型和 Qiskit 结果
    performance_dict_a = defaultdict(float)  # 使用 defaultdict 以避免 KeyError
    performance_dict_b = defaultdict(float)

    for i, name in enumerate(algorithm_names):  # 使用正确的列表
        algo_parts = name.split('_')
        algo_key = f"{algo_parts[0]}"  # 构造正确的键
        performance_dict_a[algo_key] += (after_a[i])

    for i, name in enumerate(algorithm_names):  # 使用正确的列表
        algo_parts = name.split('_')
        algo_key = f"{algo_parts[0]}"  # 构造正确的键
        performance_dict_b[algo_key] += (after_b[i])

    # 计算同一算法、不同框架下的提升幅度
    for key in performance_dict_a.keys():
        if key in performance_dict_b:
            a_value = performance_dict_a[key]
            b_value = performance_dict_b[key]
            if dict_count[key] != 0:
                improvement = (b_value - a_value)/ dict_count[key]
            else:
                print(key)
                improvement = 0
            improvements[key].append(improvement)
    return improvements

def rate(algorithm_names, after_a, after_b):
    algorithm_num = 0
    less_zero = 0
    equal_zero = 0
    greate_zero = 0
    for algorithm_name, a, b in zip(algorithm_names, after_a, after_b):
        algorithm_num += 1
        if b - a > 0:
            less_zero += 1
        elif b - a == 0:
            equal_zero += 1
        elif b - a < 0:
            greate_zero += 1
    return f"greate_zero : {greate_zero/algorithm_num:.2%}\nequal_zero : {equal_zero/algorithm_num:.2%}\nless_zero : {less_zero/algorithm_num:.2%}"

def average_positive_change_rate(change_rates):
    positive_changes = [rate for rate in change_rates if rate > 0]
    if positive_changes:
        return sum(positive_changes) / len(positive_changes)
    else:
        return 0  # 或者根据需求处理没有正值的情况

def plot_4x2(x_values_list, y_values_list, texts, left_colors, right_colors, rate_texts, bar_labels_list, bar_values_list):
    """
    Generates a 4x2 grid of subplots, with scatter plots on the left and bar charts on the right.

    Args:
        x_values_list: A list of lists, where each inner list contains x-values for a scatter plot.
        y_values_list: A list of lists, where each inner list contains y-values for a scatter plot.
        texts: A list of strings, used as titles for each row of subplots.
        left_colors: A list of colors for the scatter plots.
        right_colors: A list of colors for the bar charts.
        rate_texts: A list of strings, used as annotations in the scatter plots.
        bar_labels_list: A list of lists, where each inner list contains labels for the bar charts.
        bar_values_list: A list of lists, where each inner list contains values for the bar charts.
    """
    fig, axs = plt.subplots(4, 2, figsize=(14, 14))  # Adjusted figsize for a more compact layout
    annotation_labels = ['a)', 'b)', 'c)', 'd)', 'e)', 'f)', 'g)', 'h)']

    for i in range(4):
        # Left Scatter Plot
        axs[i, 0].scatter(x_values_list[i], y_values_list[i], color=left_colors[i], s=5)
        axs[i, 0].axhline(y=0, color='red', linestyle='--')
        axs[i, 0].set_xlabel('Circuit Index', fontsize=9)
        axs[i, 0].set_ylabel('Improvement - Metric (%)', fontsize=9, fontweight='bold')
        if i in [2,3]:
            # Annotation Box
            box = patches.FancyBboxPatch((0.857, 0.18), 0.042, 0.043, boxstyle="round,pad=0.1", edgecolor='black', facecolor='none', linestyle='--', transform=axs[i, 0].transAxes, linewidth=1.5)
            axs[i, 0].add_patch(box)
            axs[i, 0].text(0.88, 0.2, rate_texts[i], ha='center', va='center', transform=axs[i, 0].transAxes, fontsize=11, fontname='Times New Roman')
        else: 
            # Annotation Box
            box = patches.FancyBboxPatch((0.857, 0.79), 0.042, 0.043, boxstyle="round,pad=0.1", edgecolor='black', facecolor='none', linestyle='--', transform=axs[i, 0].transAxes, linewidth=1.5)
            axs[i, 0].add_patch(box)
            axs[i, 0].text(0.88, 0.8, rate_texts[i], ha='center', va='center', transform=axs[i, 0].transAxes, fontsize=11, fontname='Times New Roman')

        # Right Bar Chart
        bars = axs[i, 1].bar(bar_labels_list[i], bar_values_list[i], color=right_colors[i], edgecolor='black', linewidth=1.2)
        for bar in bars:
            height = bar.get_height()
            axs[i, 1].annotate(f'{height:.2f}%',
                            xy=(bar.get_x() + bar.get_width() / 2, height),
                            xytext=(0, 5),  # 5 points vertical offset
                            textcoords="offset points",
                            ha='center', va='bottom', fontsize=7, fontweight='bold', color='black')
        axs[i, 1].set_ylabel('Improvement - Metric (%)', fontsize=9, fontweight='bold')
        axs[i, 1].grid(axis='y', linestyle='--', alpha=0.7)
        axs[i, 1].spines['top'].set_visible(False)
        axs[i, 1].spines['right'].set_visible(False)
        axs[i, 1].spines['left'].set_linewidth(1.2)
        axs[i, 1].spines['bottom'].set_linewidth(1.2)
        axs[i, 1].set_facecolor('whitesmoke')
        axs[i, 1].tick_params(axis='x', rotation=45, labelsize=8)

        # Subplot Labels
        axs[i, 0].text(0.5, -0.4, f"{annotation_labels[i*2]} {texts[i]} - Scatter Plot", ha='center', va='center', transform=axs[i, 0].transAxes, fontsize=11, fontname='Times New Roman')
        axs[i, 1].text(0.5, -0.4, f"{annotation_labels[i*2+1]} {texts[i]} - Bar Chart", ha='center', va='center', transform=axs[i, 1].transAxes, fontsize=11, fontname='Times New Roman')

    plt.tight_layout(rect=[0, 0, 1, 0.95], pad=0.8, h_pad=0.1)  # pad从1.5→0.8，h_pad控制行间距
    plt.show()

def count_rate():

    algorithm_names_train, _, after_a_train, before_b_train, after_b_train, time_a_train, time_b_train = get_data(train=True)
    algorithm_names_test, _, after_a_test, before_b_test, after_b_test, time_a_test, time_b_test = get_data(test=True)
    algorithm_names_test_31_40, _, after_a_test_31_40, before_b_test_31_40, after_b_test_31_40, time_a_31_40, time_b_31_40 = get_data(big=True)
    algorithm_names_test_third, _, after_a_test_third, before_b_test_third, after_b_test_third, time_a_third, time_b_third = get_data(third=True)

    # 计算每种情况的变化率
    change_rates_a_vs_b_train = [(after1 - after) / after1 for before, after, after1 in zip(before_b_train, after_a_train, after_b_train)]
    change_rates_a_vs_b_test = [(after1 - after) / after1 for before, after, after1 in zip(before_b_test, after_a_test, after_b_test)]
    change_rates_a_vs_b_test_31_40 = [(after1 - after) / after1 for before, after, after1 in zip(before_b_test_31_40, after_a_test_31_40, after_b_test_31_40)]
    change_rates_a_vs_b_test_third = [(after1 - after) / after1 for before, after, after1 in zip(before_b_test_third, after_a_test_third, after_b_test_third)]

    # 计算平均值
    average_train = sum(change_rates_a_vs_b_train) / len(change_rates_a_vs_b_train)
    average_test = sum(change_rates_a_vs_b_test) / len(change_rates_a_vs_b_test)
    average_test_31_40 = sum(change_rates_a_vs_b_test_31_40) / len(change_rates_a_vs_b_test_31_40)
    average_test_third = sum(change_rates_a_vs_b_test_third) / len(change_rates_a_vs_b_test_third)
    print(f"average_train improve {average_train}")
    print(f"average_test improve {average_test}")
    print(f"average_test_31_40 improve {average_test_31_40}")
    print(f"average_test_third improve {average_test_third}")

    # 计算有提升的数据的平均变化率
    def average_positive_change_rate(change_rates):
        positive_changes = [rate for rate in change_rates if rate > 0]
        if positive_changes:
            return sum(positive_changes) / len(positive_changes)
        else:
            return 0  # 如果没有正值的情况

    average_train_positive = average_positive_change_rate(change_rates_a_vs_b_train)
    average_test_positive = average_positive_change_rate(change_rates_a_vs_b_test)
    average_test_31_40_positive = average_positive_change_rate(change_rates_a_vs_b_test_31_40)
    average_test_third_positive = average_positive_change_rate(change_rates_a_vs_b_test_third)
    print("Average positive change rate for train data:", average_train_positive)
    print("Average positive change rate for test data:", average_test_positive)
    print("Average positive change rate for test data 31-40:", average_test_31_40_positive)
    print("Average positive change rate for test data third:", average_test_third_positive)

    # 获取改进率数据
    improvements_train = get_increase_rate_data(algorithm_names_train, _, after_a_train, before_b_train, after_b_train)
    improvements_test = get_increase_rate_data(algorithm_names_test, _, after_a_test, before_b_test, after_b_test)
    improvements_test_31_40 = get_increase_rate_data(algorithm_names_test_31_40, _, after_a_test_31_40, before_b_test_31_40, after_b_test_31_40)
    improvements_test_third = get_increase_rate_data(algorithm_names_test_third, _, after_a_test_third, before_b_test_third, after_b_test_third)
    
    print(improvements_train)
    print(improvements_test)
    print(improvements_test_31_40)
    print(improvements_test_third)

    # 准备数据
    labels_train = list(improvements_train.keys())
    values_train = [np.mean(improvements_train[key]) * 100 for key in labels_train]  # 转换为百分比
    labels_test = list(improvements_test.keys())
    values_test = [np.mean(improvements_test[key]) * 100 for key in labels_test]  # 转换为百分比
    labels_test_31_40 = list(improvements_test_31_40.keys())
    values_test_31_40 = [np.mean(improvements_test_31_40[key]) * 100 for key in labels_test_31_40]  # 转换为百分比
    labels_test_third = list(improvements_test_third.keys())
    values_test_third = [np.mean(improvements_test_third[key]) * 100 for key in labels_test_third]  # 转换为百分比
    
    # 将数据传递给 plot_4x2 函数
    plot_4x2(
        [list(range(len(change_rates_a_vs_b_train))), list(range(len(change_rates_a_vs_b_test))), list(range(len(change_rates_a_vs_b_test_31_40))), list(range(len(change_rates_a_vs_b_test_third)))],
        [change_rates_a_vs_b_train, change_rates_a_vs_b_test, change_rates_a_vs_b_test_31_40, change_rates_a_vs_b_test_third],
        ["Train Set (2-30 bit)", "Test Set 1 (2-30 bit)", "Test Set 2 (31-40 bit)", "Test Set 3 (other algorithms)"],
        ['blue','purple','green','brown'],
        ['cornflowerblue', 'lightsalmon', 'lightsalmon', 'lightsalmon'],
        [rate(algorithm_names_train, after_a_train, after_b_train), rate(algorithm_names_test, after_a_test, after_b_test), rate(algorithm_names_test_31_40, after_a_test_31_40, after_b_test_31_40), rate(algorithm_names_test_third, after_a_test_third, after_b_test_third)],
        [labels_train, labels_test, labels_test_31_40, labels_test_third],
        [values_train, values_test, values_test_31_40, values_test_third]
    )

def depth_():
    algorithm_names_train, _, after_a_train, _, after_b_train, _, _ = get_data(train=True)
    algorithm_names_test, _, after_a_test, _, after_b_test, _, _ = get_data(test=True)
    algorithm_names_test_31_40, _, after_a_test_31_40, _, after_b_test_31_40, _, _ = get_data(big=True)
    algorithm_names_test_third, _, after_a_test_third, _, after_b_test_third, _, _ = get_data(third=True)

    after_a = after_a_train + after_a_test + after_a_test_31_40 + after_a_test_third
    after_b = after_b_train + after_b_test + after_b_test_31_40 + after_b_test_third
    algorithm_names = algorithm_names_train + algorithm_names_test + algorithm_names_test_31_40 + algorithm_names_test_third


    # 打印提升率
    print(rate(algorithm_names, after_a, after_b))

    # 计算每种情况的变化率
    change_rates_a_vs_b = [(after1 - after) / after1 for after, after1 in zip(after_a, after_b)]

    # 计算平均值
    average_ = sum(change_rates_a_vs_b) / len(change_rates_a_vs_b)
    print(f"average improve {average_}")

    # 计算有提升的数据的平均变化率
    def average_positive_change_rate(change_rates):
        positive_changes = [rate for rate in change_rates if rate >= 0]
        if positive_changes:
            return sum(positive_changes) / len(positive_changes)
        else:
            return 0  # 或者根据需求处理没有正值的情况

    # 计算每种情况的有提升数据的平均变化率
    average_train_positive = average_positive_change_rate(change_rates_a_vs_b)

    # 打印结果
    print("Average positive change rate for train data:", average_train_positive)

    # 提取算法名称的类别
    categories = []

    for name in algorithm_names:
        algo_parts = name.split('_')
        algo_key = f"{algo_parts[0]}"
        categories.append(algo_key)

    # 将数据放入 DataFrame 中
    data_train = pd.DataFrame({'Improvement Rate': change_rates_a_vs_b, 'Category': categories})

    # 创建一个新的 figure 和 axes
    fig, axs = plt.subplots(figsize=(12, 6))

    # 设置更鲜明的颜色
    color_train = '#4682B4'  # 钢蓝色

    # 绘制训练集的箱线图，显示异常点
    sns.boxplot(ax=axs, x='Category', y='Improvement Rate', data=data_train, color=color_train, showfliers=True)
    sns.stripplot(ax=axs, x='Category', y='Improvement Rate', data=data_train, color='black', size=2, jitter=False)  # 添加数据点

    # 添加一条水平线，表示 y=0
    axs.axhline(y=0, color='green', linestyle='--')

    # 旋转 x 轴标签
    axs.tick_params(axis='x', rotation=60)

    # 设置图表标题
    axs.set_title('Agent vs Qiskit -O3 (Circuit Parallelism)')

    # 调整子图间距
    plt.tight_layout()
    plt.subplots_adjust(hspace=0.25)

    # 显示图形
    plt.show()

depth_()


count_rate()