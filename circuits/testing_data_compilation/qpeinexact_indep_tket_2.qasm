// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg psi[1];
qreg q[1];
creg c[1];
x psi[0];
h q[0];
cu1(0.5*pi) psi[0],q[0];
h q[0];
barrier q[0],psi[0];
measure q[0] -> c[0];
