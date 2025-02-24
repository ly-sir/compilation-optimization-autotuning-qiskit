// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg flag[1];
qreg q[2];
creg meas[3];
x flag[0];
h q[0];
h q[1];
cu1(0.5*pi) q[1],flag[0];
cx q[1],q[0];
cu1(1.5*pi) q[0],flag[0];
cx q[1],q[0];
cu1(0.5*pi) q[0],flag[0];
h q[1];
h q[0];
x q[1];
x q[0];
h q[1];
cx q[0],q[1];
x q[0];
h q[1];
h q[0];
x q[1];
h q[1];
barrier q[0],q[1],flag[0];
measure flag[0] -> meas[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
