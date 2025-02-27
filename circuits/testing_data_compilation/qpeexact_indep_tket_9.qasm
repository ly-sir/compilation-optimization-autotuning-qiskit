// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg psi[1];
qreg q[8];
creg c[8];
x psi[0];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
cu1(1.1406249999999996*pi) psi[0],q[0];
cu1(0.2812499999999999*pi) psi[0],q[1];
swap q[0],q[7];
cu1(0.5625000000000004*pi) psi[0],q[2];
h q[0];
cu1(1.1249999999999996*pi) psi[0],q[3];
cu1(0.25*pi) psi[0],q[4];
cu1(0.5*pi) psi[0],q[5];
swap q[3],q[4];
cu1(1.0*pi) psi[0],q[6];
swap q[2],q[5];
swap q[1],q[6];
cu1(1.5*pi) q[1],q[0];
cu1(1.75*pi) q[2],q[0];
h q[1];
cu1(1.875*pi) q[3],q[0];
cu1(1.5*pi) q[2],q[1];
cu1(1.9375*pi) q[4],q[0];
cu1(1.75*pi) q[3],q[1];
h q[2];
cu1(1.96875*pi) q[5],q[0];
cu1(1.875*pi) q[4],q[1];
cu1(1.5*pi) q[3],q[2];
cu1(1.984375*pi) q[6],q[0];
cu1(1.9375*pi) q[5],q[1];
cu1(1.75*pi) q[4],q[2];
h q[3];
cu1(1.9921875*pi) q[7],q[0];
cu1(1.96875*pi) q[6],q[1];
cu1(1.875*pi) q[5],q[2];
cu1(1.5*pi) q[4],q[3];
cu1(1.984375*pi) q[7],q[1];
cu1(1.9375*pi) q[6],q[2];
cu1(1.75*pi) q[5],q[3];
h q[4];
cu1(1.96875*pi) q[7],q[2];
cu1(1.875*pi) q[6],q[3];
cu1(1.5*pi) q[5],q[4];
cu1(1.9375*pi) q[7],q[3];
cu1(1.75*pi) q[6],q[4];
h q[5];
cu1(1.875*pi) q[7],q[4];
cu1(1.5*pi) q[6],q[5];
cu1(1.75*pi) q[7],q[5];
h q[6];
cu1(1.5*pi) q[7],q[6];
h q[7];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],psi[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
measure q[6] -> c[6];
measure q[7] -> c[7];
