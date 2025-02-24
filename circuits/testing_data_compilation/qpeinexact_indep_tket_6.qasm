// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg psi[1];
qreg q[5];
creg c[5];
x psi[0];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
cu1(0.8437500000000007*pi) psi[0],q[0];
cu1(1.6875*pi) psi[0],q[1];
cu1(1.3750000000000002*pi) psi[0],q[2];
cu1(0.75*pi) psi[0],q[3];
cu1(1.5*pi) psi[0],q[4];
swap q[1],q[3];
swap q[0],q[4];
h q[0];
cu1(1.5*pi) q[1],q[0];
cu1(1.75*pi) q[2],q[0];
h q[1];
cu1(1.875*pi) q[3],q[0];
cu1(1.5*pi) q[2],q[1];
cu1(1.9375*pi) q[4],q[0];
cu1(1.75*pi) q[3],q[1];
h q[2];
cu1(1.875*pi) q[4],q[1];
cu1(1.5*pi) q[3],q[2];
cu1(1.75*pi) q[4],q[2];
h q[3];
cu1(1.5*pi) q[4],q[3];
h q[4];
barrier q[0],q[1],q[2],q[3],q[4],psi[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
