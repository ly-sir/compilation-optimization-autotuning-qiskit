import os, ast, sys
script_name = sys.argv[0]
if len(sys.argv) < 2:
    print(f"Usage: python {script_name} <num_qubits>")
    sys.exit(1)
flag = int(sys.argv[1])

if flag==0:
    reward_function = "opt_depth_rate"
else:
    reward_function = "node_gate_num"

def get_number_from_filename(filename):
    """从文件名中提取最后的数字"""
    base = os.path.basename(filename)
    number = base.split('_')[-1].split('.')[0]  # 假设文件名格式为 xxx_0.txt
    return int(number)

def read_list_from_file(filename):
    """从文件中读取列表字符串并转换为列表"""
    with open(filename, 'r') as f:
        content = f.read().strip()  # 读取文件内容并去除多余的空格和换行
        return ast.literal_eval(content)  # 将字符串转换为列表

def merge_lists_from_files(directory):
    """合并目录中的所有列表文件"""
    all_files = [os.path.join(directory, f) for f in os.listdir(directory) if os.path.isfile(os.path.join(directory, f))]
    sorted_files = sorted(all_files, key=get_number_from_filename)

    merged_list = []
    for filename in sorted_files:
        file_list = read_list_from_file(filename)
        merged_list.extend(file_list)

    return merged_list

param_set= 'GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution'

input_dir = './data/reward_line_data/' + reward_function+ '/' + param_set + '/'
output_dir = './data/reward_line_data/' + reward_function+ '/'
filename_model = os.path.join(output_dir, 'GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution.txt')
merged_list = merge_lists_from_files(input_dir)
try:
    with open(filename_model, 'a+') as f:
        f.write(str(merged_list) + '\n')
except PermissionError as e:
    print(f"Permission error: {e}")
except Exception as e:
    print(f"An error occurred: {e}")
