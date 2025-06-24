// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg meas[2];
h q[0];
h q[1];
u1(0.6366197723675814*pi) q[0];
u1(0.6366197723675814*pi) q[1];
cx q[0],q[1];
u1(0.9198050795471668*pi) q[1];
cx q[0],q[1];
h q[0];
h q[1];
u1(0.6366197723675814*pi) q[0];
u1(0.6366197723675814*pi) q[1];
cx q[0],q[1];
u1(0.9198050795471668*pi) q[1];
cx q[0],q[1];
ry(0.015841403968215116*pi) q[0];
ry(0.04192418798236902*pi) q[1];
cx q[0],q[1];
ry(0.31027251035453784*pi) q[0];
ry(0.1345191154856742*pi) q[1];
barrier q[0],q[1];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
