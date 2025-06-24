# Compilation Optimization Autotuning for Qiskit

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Python Version](https://img.shields.io/badge/python-3.10-brightgreen.svg)](https://www.python.org/)
[![Qiskit](https://img.shields.io/badge/Qiskit-1.3.2-623CE5?logo=Qiskit&logoColor=white)](https://qiskit.org/)

An automatic tuning tool for Qiskit that enhances quantum circuit optimization by adaptively selecting compiler passes to achieve superior gate count reduction.

---

## Table of Contents
- [Features](#features)
- [How It Works](#how-it-works)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [License](#license)

## Features

*   **Automatic Tuning:** Eliminates the need for manual configuration of complex compiler pass managers. The tool intelligently finds an effective optimization strategy for you.
*   **Performance Boost:** By adaptively selecting optimization passes, this tool consistently achieves a lower final gate count compared to Qiskit's default optimization levels. This is critical for executing algorithms on noisy intermediate-scale quantum (NISQ) devices.

## How It Works

The Qiskit transpiler uses a series of transformations, known as "passes," to rewrite a quantum circuit for a specific target backend. The sequence and configuration of these passes dramatically impact the final circuit's efficiency. Finding the optimal sequence for a given circuit and hardware target is a non-trivial challenge.

This tool introduces an intelligent layer that automates this process. It analyzes the properties of the input circuit and **adaptively selects a tailored sequence of optimization passes** from Qiskit's extensive library. The primary goal is to minimize the final gate count, leading to higher-fidelity execution on real quantum hardware.

## Installation

Follow these steps to set up the tool and its dependencies.

### 1. Prerequisites

For optimal performance, we recommend the following environment:
*   **CUDA Version**: `12.6`

Please ensure your NVIDIA drivers are compatible with CUDA 12.6.

### 2. Install PyTorch

This tool relies on a specific version of PyTorch compiled for CUDA 12.6. Run the following command to install it:
```bash
pip install torch==2.6.0 torchvision==0.21.0 torchaudio==2.6.0 --index-url https://download.pytorch.org/whl/cu126
```

### 3. Install the Project and Dependencies

First, clone the repository to your local machine:
```bash
git clone https://github.com/ly-sir/compilation-optimization-autotuning-qiskit.git
cd compilation-optimization-autotuning-qiskit
```
Next, install all the required Python packages listed in `requirements.txt`:
```bash
pip install -r requirements.txt
```
**Note:** The `requirements.txt` file should include `qiskit>=1.3` and other necessary libraries.

## Quick Start

Once installed, you can easily use the auto-tuner in your Python code.

```python
from qiskit import QuantumCircuit
from demo import run_autotuning_transpilation 

# 1. Create a sample quantum circuit
qc = QuantumCircuit(3)
qc.h(0)
qc.cx(0, 1)
qc.cx(1, 2)
qc.ccx(0, 1, 2)
qc.measure_all()

print("--- Original Circuit ---")
print(f"Gate counts: {qc.count_ops()}")
print(qc)


# 2. Initialize and run run_autotuning_transpilation
optimized_qc, seq = run_autotuning_transpilation(qc)


# 3. View the optimized results
print("\n--- Optimized Circuit ---")
print(f"Gate counts: {optimized_qc.count_ops()}")
print(optimized_qc)
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
