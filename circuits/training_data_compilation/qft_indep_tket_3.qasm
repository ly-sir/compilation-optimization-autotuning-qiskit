// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];
creg meas[3];
h q[2];
cu1(0.5*pi) q[2],q[1];
cu1(0.25*pi) q[2],q[0];
h q[1];
cu1(0.5*pi) q[1],q[0];
h q[0];
swap q[0],q[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
