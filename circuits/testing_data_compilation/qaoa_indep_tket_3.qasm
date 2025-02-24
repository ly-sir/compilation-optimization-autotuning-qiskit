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
rzz(2.9128707508416403*pi) q[0],q[1];
rzz(2.9128707508416403*pi) q[0],q[2];
rx(3.1648254259933224*pi) q[0];
rzz(2.9128707508416403*pi) q[1],q[2];
rx(3.1648254259933224*pi) q[1];
rx(3.1648254259933224*pi) q[2];
rzz(0.2680730422223964*pi) q[0],q[1];
rzz(0.2680730422223964*pi) q[0],q[2];
rx(3.8839287528005784*pi) q[0];
rzz(0.2680730422223964*pi) q[1],q[2];
rx(3.8839287528005784*pi) q[1];
rx(3.8839287528005784*pi) q[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
