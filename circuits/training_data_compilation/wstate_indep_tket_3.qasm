// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
ry(3.75*pi) q[0];
ry(3.695913276015304*pi) q[1];
x q[2];
cz q[2],q[1];
ry(0.30408672398469627*pi) q[1];
cz q[1],q[0];
ry(0.25*pi) q[0];
cx q[1],q[2];
cx q[0],q[1];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
