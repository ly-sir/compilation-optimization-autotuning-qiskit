import re
import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import savgol_filter
from pathlib import Path
from tabulate import tabulate


param_set = "GAT_learn_rate_000001_update_30000_net_256_batch_128_relu_DoubleDQN_node_gate_num_distribution/_299900"
# param_set = "GAT_learn_rate_000001_update_30000_net_256_relu_memory_memory_batch_128_e_greedy_no_features/_300000"
class TimeSeriesAnalyzer:
    def __init__(self, data_dir="../data/opt_rate/node_gate_num"):
        self.base_path = Path(data_dir)
        self._validate_paths()

    def _validate_paths(self):
        """验证必要文件路径是否存在"""
        required_files = [
            param_set+"/model_all_MQT_2_30_circuits_result_31_40.txt",
            param_set+"/qiskit_all_MQT_2_30_circuits_result_31_40.txt"
        ]
        for f in required_files:
            if not (self.base_path / f).exists():
                raise FileNotFoundError(f"Required file missing: {f}")

    @staticmethod
    def _validate_time_data(time_list):
        """确保时间数据非负"""
        cleaned = [max(float(t), 1e-9) for t in time_list]
        if len(cleaned) != len(time_list):
            print(f"Warning: {len(time_list)-len(cleaned)} negative values clipped")
        return cleaned

    def _load_dataset(self, filename, expected_columns=4):
        """通用数据加载方法"""
        data = {"algorithm": [], "before": [], "after": [], "time": []}
        
        try:
            with open(self.base_path / filename, 'r') as f:
                for line_num, line in enumerate(f, 1):
                    line = line.strip()
                    if not line:
                        continue
                        
                    parts = line.split()
                    if len(parts) != expected_columns:
                        raise ValueError(
                            f"Invalid format at line {line_num} in {filename}: "
                            f"Expected {expected_columns} columns, got {len(parts)}"
                        )
                        
                    data["algorithm"].append(parts[0])
                    data["before"].append(int(parts[1]))
                    data["after"].append(int(parts[2]))
                    data["time"].append(float(parts[3]))
                    
        except Exception as e:
            print(f"Error loading {filename}: {str(e)}")
            raise

        data["time"] = self._validate_time_data(data["time"])
        return data

    def get_dataset(self, dataset_type):
        """获取指定数据集"""
        file_mapping = {
            "train": {
                "model": param_set+"/model_all_MQT_2_30_train_circuits_result.txt",
                "qiskit": param_set+"/qiskit_all_MQT_2_30_train_circuits_result.txt"
            },
            "test": {
                "model": param_set+"/model_all_MQT_2_30_test_circuits_result.txt",
                "qiskit": param_set+"/qiskit_all_MQT_2_30_test_circuits_result.txt"
            },
            "big": {
                "model": param_set+"/model_all_MQT_2_30_circuits_result_31_40.txt",
                "qiskit": param_set+"/qiskit_all_MQT_2_30_circuits_result_31_40.txt"
            },
            "third": {
                "model": param_set+"/model_test_circuits_result_third.txt",
                "qiskit": param_set+"/qiskit_test_circuits_result_third.txt"
            }
        }

        if dataset_type not in file_mapping:
            raise ValueError(f"Invalid dataset type: {dataset_type}")

        model_data = self._load_dataset(file_mapping[dataset_type]["model"])
        qiskit_data = self._load_dataset(file_mapping[dataset_type]["qiskit"])
        
        return {
            "algorithm": model_data["algorithm"],
            "model_time": model_data["time"],
            "qiskit_time": qiskit_data["time"]
        }

class VisualizationEngine:
    @staticmethod
    def _safe_savgol_filter(data, max_window=21):
        """安全应用Savitzky-Golay滤波器"""
        n = len(data)
        window_size = min(max_window, n)
        window_size = max(5, window_size)
        if window_size % 2 == 0:
            window_size -= 1
        polyorder = min(3, window_size//2)
        
        try:
            return savgol_filter(data, window_size, polyorder)
        except Exception as e:
            print(f"Filter failed: {str(e)}")
            return np.array(data)

    def plot_comparison(self, dataset, title, ax):
        """绘制单个数据集对比图"""
        model_time = dataset["model_time"]
        qiskit_time = dataset["qiskit_time"]
        
        # 应用安全滤波
        smooth_model = self._safe_savgol_filter(model_time)
        smooth_qiskit = self._safe_savgol_filter(qiskit_time)
        
        # 非负约束
        smooth_model = np.clip(smooth_model, 0, None)
        smooth_qiskit = np.clip(smooth_qiskit, 0, None)

        # 创建双轴图表
        ax2 = ax.twinx()
        line1, = ax.plot(smooth_model, 'b-', lw=2, label='Agent')
        line2, = ax2.plot(smooth_qiskit, 'r-', lw=2, label='Qiskit')
        
        # 样式配置
        ax.set_title(f"Time Comparison - {title}", fontsize=12)
        ax.set_xlabel("Circuit Index", fontsize=10)
        ax.set_ylabel("Agent Time (s)", color='b', fontsize=10)
        ax2.set_ylabel("Qiskit Time (s)", color='r', fontsize=10)
        ax.tick_params(axis='y', colors='b')
        ax2.tick_params(axis='y', colors='r')
        ax.grid(True, alpha=0.3)
        
        return [line1, line2]

    def generate_report(self, datasets):
        """生成完整分析报告"""
        fig = plt.figure(figsize=(18, 16))
        gs = fig.add_gridspec(2, 2, hspace=0.4, wspace=0.3)
        axes = [fig.add_subplot(gs[i, j]) for i in range(2) for j in range(2)]
        
        # 绘制各子图
        all_lines = []
        for idx, (title, data) in enumerate(datasets.items()):
            lines = self.plot_comparison(data, title, axes[idx])
            all_lines.extend(lines)
        
        # 添加统一图例
        fig.legend(all_lines[:2], ['Agent', 'Qiskit'], 
                  loc='upper center', ncol=2,
                  bbox_to_anchor=(0.8, 0.07),
                  fontsize=12, frameon=False)
        
        # 添加统计表格
        stats = self._calculate_statistics(datasets)
        self._add_stat_table(fig, stats)
        
        plt.tight_layout()
        plt.show()

    def _calculate_statistics(self, datasets):
        """计算统计指标"""
        stats = []
        total_model = total_qiskit = 0
        
        for title, data in datasets.items():
            model_t = data["model_time"]
            qiskit_t = data["qiskit_time"]
            
            avg_model = np.mean(model_t)
            avg_qiskit = np.mean(qiskit_t)
            total_model += sum(model_t)
            total_qiskit += sum(qiskit_t)
            
            stats.append([
                title,
                f"{avg_model:.4f} ± {np.std(model_t):.4f}",
                f"{avg_qiskit:.4f} ± {np.std(qiskit_t):.4f}",
                f"{avg_qiskit/avg_model:.2f}x"
            ])
        
        # 总计行
        stats.append([
            "TOTAL",
            f"{total_model:.2f}",
            f"{total_qiskit:.2f}",
            f"{total_qiskit/total_model:.2f}x"
        ])
        
        return stats

    def _add_stat_table(self, fig, stats):
        """添加统计表格"""
        columns = ["Dataset", "Model Time (s)", "Qiskit Time (s)", "Speedup"]
        
        # 在figure中创建新坐标轴
        ax_table = fig.add_axes([0.1, -0.4, 0.8, 0.3])  # 调整位置参数
        
        table = ax_table.table(
            cellText=stats,
            colLabels=columns,
            cellLoc='center',
            loc='center',
            colColours=['#f0f0f0']*4,
            fontsize=12
        )
        table.auto_set_font_size(False)
        table.set_fontsize(10)
        ax_table.axis('off')

if __name__ == "__main__":
    try:
        analyzer = TimeSeriesAnalyzer()
        datasets = {
            "Training Set\n(2-30 Qubits)": analyzer.get_dataset("train"),
            "Test Set 1\n(2-30 Qubits)": analyzer.get_dataset("test"),
            "Test Set 2\n(30-40 Qubits)": analyzer.get_dataset("big"),
            "Test Set 3\n(3rd-party)": analyzer.get_dataset("third")
        }
        
        vis_engine = VisualizationEngine()
        vis_engine.generate_report(datasets)

        # Calculate and print average times in a table
        table_data = []
        total_model_time = 0
        total_qiskit_time = 0
        num_circuits = 0

        for dataset_name, dataset in datasets.items():
            model_time = dataset["model_time"]
            qiskit_time = dataset["qiskit_time"]

            avg_model_time = np.mean(model_time)
            avg_qiskit_time = np.mean(qiskit_time)

            total_model_time += np.sum(model_time)
            total_qiskit_time += np.sum(qiskit_time)
            num_circuits += len(model_time)  # Assuming model_time and qiskit_time have the same length

            table_data.append([dataset_name, f"{avg_model_time:.4f}", f"{avg_qiskit_time:.4f}"])

        # Calculate overall averages
        overall_avg_model_time = total_model_time / num_circuits
        overall_avg_qiskit_time = total_qiskit_time / num_circuits

        table_data.append(["Overall Averages", f"{overall_avg_model_time:.4f}", f"{overall_avg_qiskit_time:.4f}"])

        # Print the table using tabulate
        headers = ["Dataset", "Average Model Time (s)", "Average Qiskit Time (s)"]
        print(tabulate(table_data, headers=headers, tablefmt="grid"))
        
    except Exception as e:
        print(f"Critical error occurred: {str(e)}")
        raise
