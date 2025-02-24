// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
ry(1.5426412865334935*pi) q[0];
ry(0.0415038987188029*pi) q[1];
ry(1.26729646985255*pi) q[2];
ry(1.4976077650772253*pi) q[3];
cx q[0],q[1];
cx q[0],q[2];
cx q[0],q[3];
cx q[1],q[2];
ry(0.9970140246051811*pi) q[0];
cx q[1],q[3];
ry(0.44959329106169543*pi) q[1];
cx q[2],q[3];
cx q[0],q[1];
ry(0.39612572951924896*pi) q[2];
ry(1.5210614243979164*pi) q[3];
cx q[0],q[2];
cx q[0],q[3];
cx q[1],q[2];
ry(0.33822167312507057*pi) q[0];
cx q[1],q[3];
ry(0.17667962834802045*pi) q[1];
cx q[2],q[3];
cx q[0],q[1];
ry(1.3707196367355934*pi) q[2];
ry(1.9067866923898744*pi) q[3];
cx q[0],q[2];
cx q[0],q[3];
cx q[1],q[2];
ry(0.00789653265582891*pi) q[0];
cx q[1],q[3];
ry(1.024384526771554*pi) q[1];
cx q[2],q[3];
ry(1.6252419233042286*pi) q[2];
ry(1.2250521336587754*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
