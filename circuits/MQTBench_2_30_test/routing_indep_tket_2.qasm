// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg meas[2];
ry(0.6058212080311612*pi) q[0];
ry(0.2806041267664165*pi) q[1];
cx q[0],q[1];
ry(3.6023246086783858*pi) q[0];
ry(3.43865194495253*pi) q[1];
cx q[0],q[1];
ry(3.5560999438097007*pi) q[0];
ry(0.6839045873225175*pi) q[1];
cx q[0],q[1];
ry(3.3011237525522414*pi) q[0];
ry(0.20849461667916575*pi) q[1];
barrier q[0],q[1];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
