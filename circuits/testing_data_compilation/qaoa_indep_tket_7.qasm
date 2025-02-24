// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg meas[7];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
rzz(2.571073300943498*pi) q[0],q[3];
rzz(2.571073300943498*pi) q[1],q[2];
rzz(2.571073300943498*pi) q[0],q[5];
rzz(2.571073300943498*pi) q[1],q[4];
rzz(2.571073300943498*pi) q[3],q[6];
rx(3.8002410970171354*pi) q[0];
rx(3.8002410970171354*pi) q[1];
rzz(2.571073300943498*pi) q[2],q[4];
rx(3.8002410970171354*pi) q[3];
rzz(2.571073300943498*pi) q[5],q[6];
rzz(1.2327758992805162*pi) q[0],q[3];
rx(3.8002410970171354*pi) q[2];
rx(3.8002410970171354*pi) q[4];
rx(3.8002410970171354*pi) q[5];
rx(3.8002410970171354*pi) q[6];
rzz(1.2327758992805162*pi) q[0],q[5];
rzz(1.2327758992805162*pi) q[1],q[2];
rzz(1.2327758992805162*pi) q[3],q[6];
rx(2.4288544431966557*pi) q[0];
rzz(1.2327758992805162*pi) q[1],q[4];
rx(2.4288544431966557*pi) q[3];
rzz(1.2327758992805162*pi) q[5],q[6];
rx(2.4288544431966557*pi) q[1];
rzz(1.2327758992805162*pi) q[2],q[4];
rx(2.4288544431966557*pi) q[5];
rx(2.4288544431966557*pi) q[6];
rx(2.4288544431966557*pi) q[2];
rx(2.4288544431966557*pi) q[4];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
