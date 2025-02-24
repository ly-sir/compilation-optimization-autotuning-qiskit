// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg meas[2];
h q[0];
h q[1];
u1(0.6366197723675814*pi) q[0];
u1(0.6366197723675814*pi) q[1];
cx q[0],q[1];
u1(0.9198050795471606*pi) q[1];
cx q[0],q[1];
h q[0];
h q[1];
u1(0.6366197723675814*pi) q[0];
u1(0.6366197723675814*pi) q[1];
cx q[0],q[1];
u1(0.9198050795471606*pi) q[1];
cx q[0],q[1];
ry(0.18299712885238104*pi) q[0];
ry(0.2329241785921171*pi) q[1];
cx q[0],q[1];
ry(0.2973661988116053*pi) q[0];
ry(0.12187127789332597*pi) q[1];
barrier q[0],q[1];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
