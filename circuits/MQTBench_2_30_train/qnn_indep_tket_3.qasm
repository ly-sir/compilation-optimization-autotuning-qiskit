// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
h q[0];
h q[1];
h q[2];
u1(0.6366197723675814*pi) q[0];
u1(0.6366197723675814*pi) q[1];
u1(0.6366197723675814*pi) q[2];
cx q[0],q[1];
u1(0.9198050795471668*pi) q[1];
cx q[0],q[1];
cx q[0],q[2];
u1(0.9198050795471668*pi) q[2];
cx q[0],q[2];
h q[0];
cx q[1],q[2];
u1(0.6366197723675814*pi) q[0];
u1(0.9198050795471668*pi) q[2];
cx q[1],q[2];
h q[1];
h q[2];
u1(0.6366197723675814*pi) q[1];
u1(0.6366197723675814*pi) q[2];
cx q[0],q[1];
u1(0.9198050795471668*pi) q[1];
cx q[0],q[1];
cx q[0],q[2];
u1(0.9198050795471668*pi) q[2];
cx q[0],q[2];
ry(0.13192309041793546*pi) q[0];
cx q[1],q[2];
u1(0.9198050795471668*pi) q[2];
cx q[1],q[2];
ry(0.2637458857303867*pi) q[1];
ry(0.2178528766551228*pi) q[2];
cx q[1],q[2];
cx q[0],q[1];
ry(0.09750295083924282*pi) q[2];
ry(0.298527570748409*pi) q[0];
ry(0.03265659602986962*pi) q[1];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
