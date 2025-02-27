// Benchmark was created by MQT Bench on 2024-03-17
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg c[3];
h q[0];
h q[1];
h q[2];
x q[3];
x q[0];
x q[1];
h q[3];
cx q[0],q[3];
x q[0];
cx q[1],q[3];
h q[0];
x q[1];
cx q[2],q[3];
h q[1];
h q[2];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
