// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg psi[1];
qreg q[3];
creg c[3];
x psi[0];
h q[0];
h q[1];
h q[2];
cu1(1.0*pi) psi[0],q[0];
swap q[0],q[2];
h q[0];
cu1(1.5*pi) q[1],q[0];
cu1(1.75*pi) q[2],q[0];
h q[1];
cu1(1.5*pi) q[2],q[1];
h q[2];
barrier q[0],q[1],q[2],psi[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
