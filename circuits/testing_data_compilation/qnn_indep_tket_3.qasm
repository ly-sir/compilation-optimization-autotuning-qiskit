// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

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
u1(0.9198050795471606*pi) q[1];
cx q[0],q[1];
cx q[0],q[2];
u1(0.9198050795471606*pi) q[2];
cx q[0],q[2];
h q[0];
cx q[1],q[2];
u1(0.6366197723675814*pi) q[0];
u1(0.9198050795471606*pi) q[2];
cx q[1],q[2];
h q[1];
h q[2];
u1(0.6366197723675814*pi) q[1];
u1(0.6366197723675814*pi) q[2];
cx q[0],q[1];
u1(0.9198050795471606*pi) q[1];
cx q[0],q[1];
cx q[0],q[2];
u1(0.9198050795471606*pi) q[2];
cx q[0],q[2];
ry(0.15432412305245122*pi) q[0];
cx q[1],q[2];
u1(0.9198050795471606*pi) q[2];
cx q[1],q[2];
ry(0.2944372357037066*pi) q[1];
ry(0.22421916063952518*pi) q[2];
cx q[1],q[2];
cx q[0],q[1];
ry(0.28869005274233994*pi) q[2];
ry(0.020075554746488124*pi) q[0];
ry(0.12304052870534789*pi) q[1];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
