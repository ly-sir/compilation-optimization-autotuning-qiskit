// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
ry(3.260479348803689*pi) q[0];
ry(0.23735985152814396*pi) q[1];
ry(3.588609351868062*pi) q[2];
ry(3.9998668129342083*pi) q[3];
cx q[2],q[3];
cx q[1],q[2];
ry(3.500042015897012*pi) q[3];
cx q[0],q[1];
ry(0.49995637080648253*pi) q[2];
ry(0.5002090708103748*pi) q[0];
ry(3.499880703361868*pi) q[1];
cx q[2],q[3];
cx q[1],q[2];
ry(0.08859829734794848*pi) q[3];
cx q[0],q[1];
ry(3.7373602285234373*pi) q[2];
ry(3.5001809044987473*pi) q[0];
ry(3.2395639112289136*pi) q[1];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
