import os
import random
import shutil
from tqdm import tqdm
from qiskit import QuantumCircuit
from qiskit.circuit.equivalence_library import StandardEquivalenceLibrary
from qiskit.transpiler import CouplingMap, PassManager
from qiskit.transpiler.passes import (
    ApplyLayout,
    BasicSwap,
    BasisTranslator,
    DenseLayout,
    EnlargeWithAncilla,
    FullAncillaAllocation,
    GatesInBasis,
    SabreLayout,
    GatesInBasis,
)
import os
import random
import shutil
from qiskit.transpiler.passes import CheckMap
from qiskit.providers.fake_provider import Fake127QPulseV1
from qiskit import qpy

import os
import random
import shutil
from datetime import datetime

def pre_deal():

    device = Fake127QPulseV1()._get_conf_from_json()
    
    layout_method = {
                "name": "DenseLayout",
                "transpile_pass": lambda device: [
                    DenseLayout(coupling_map=CouplingMap(device.coupling_map)),
                    FullAncillaAllocation(coupling_map=CouplingMap(device.coupling_map)),
                    EnlargeWithAncilla(),
                    ApplyLayout(),
                ],
            }
    rout_method = {
                "name": "BasicSwap",
                "transpile_pass": lambda device: [BasicSwap(coupling_map=CouplingMap(device.coupling_map))],
            }
    synthesis_method = {
                "name": "BasisTranslator",
                "transpile_pass": lambda device: [
                    BasisTranslator(StandardEquivalenceLibrary, target_basis=device.basis_gates)
                ],
            }

    synthesis_pass = synthesis_method["transpile_pass"](device)
    layout_pass = layout_method["transpile_pass"](device)
    rout_pass = rout_method["transpile_pass"](device)

    pm_map = PassManager()
    pm_map.append(layout_pass)
    pm_map.append(rout_pass)

    pm_synthesis = PassManager()
    pm_synthesis.append(synthesis_pass)
    
    
    file_dirs = ["../circuits/training_data_compilation/", "../circuits/testing_data_compilation/", 
                "../circuits/MQTBench_31_40/", "../circuits/MQTBench_third/"]
    target_dirs = ["../circuits/training_data_compilation_qpy/", "../circuits/testing_data_compilation_qpy/", 
                "../circuits/MQTBench_31_40_qpy/", "../circuits/MQTBench_third_2_30_qpy/"]
    for i, file_dir in enumerate(file_dirs):
        os.makedirs(target_dirs[i], exist_ok=True)
        file_list = [file_dir + file for file in os.listdir(file_dir)]
        for qasm_file in tqdm(file_list):
            print(qasm_file)
            algorithm_name, _ = os.path.splitext(os.path.basename(qasm_file))
            qc = QuantumCircuit.from_qasm_file(qasm_file)
            altered_qc = pm_synthesis.run(qc)
            altered_qc = pm_map.run(altered_qc)
            check_nat_gates = GatesInBasis(basis_gates=device.basis_gates)
            check_nat_gates(altered_qc)
            only_nat_gates = check_nat_gates.property_set["all_gates_in_basis"]
            check_mapping = CheckMap(coupling_map=CouplingMap(device.coupling_map))
            check_mapping(altered_qc)
            mapped = check_mapping.property_set["is_swap_mapped"]
            
            if(not only_nat_gates):
                altered_qc = pm_synthesis.run(altered_qc)
                check_nat_gates(altered_qc)
                only_nat_gates = check_nat_gates.property_set["all_gates_in_basis"]
            assert(mapped and only_nat_gates)
            
            with open(target_dirs[i] + f'{algorithm_name}.qpy', 'wb') as f:
                qpy.dump(altered_qc, f)
pre_deal()