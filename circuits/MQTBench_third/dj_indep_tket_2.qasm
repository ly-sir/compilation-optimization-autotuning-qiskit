// Benchmark was created by MQT Bench on 2024-03-17
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[1];
h q[0];
x q[1];
x q[0];
h q[1];
cx q[0],q[1];
x q[0];
h q[0];
barrier q[0],q[1];
measure q[0] -> c[0];
