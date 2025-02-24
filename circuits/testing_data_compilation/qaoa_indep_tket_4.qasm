// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
h q[0];
h q[1];
h q[2];
h q[3];
rzz(1.7121398540535084*pi) q[0],q[1];
rzz(1.7121398540535084*pi) q[0],q[2];
rzz(1.7121398540535084*pi) q[1],q[3];
rx(3.3560146223229688*pi) q[0];
rx(3.3560146223229688*pi) q[1];
rzz(1.7121398540535084*pi) q[2],q[3];
rzz(3.64393438747316*pi) q[0],q[1];
rx(3.3560146223229688*pi) q[2];
rx(3.3560146223229688*pi) q[3];
rzz(3.64393438747316*pi) q[0],q[2];
rzz(3.64393438747316*pi) q[1],q[3];
rx(2.2879096806838786*pi) q[0];
rx(2.2879096806838786*pi) q[1];
rzz(3.64393438747316*pi) q[2],q[3];
rx(2.2879096806838786*pi) q[2];
rx(2.2879096806838786*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
