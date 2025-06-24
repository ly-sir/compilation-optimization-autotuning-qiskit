// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg meas[5];
ry(1.0119263212235405*pi) q[0];
ry(2.6096936626381884*pi) q[1];
ry(3.847097629886276*pi) q[2];
ry(3.1817132136719124*pi) q[3];
ry(1.6783284283089814*pi) q[4];
cz q[0],q[1];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
cz q[0],q[4];
cz q[1],q[3];
ry(2.5646294102390974*pi) q[0];
cz q[1],q[4];
cz q[2],q[3];
ry(2.5906542278184252*pi) q[1];
cz q[2],q[4];
cz q[0],q[1];
ry(1.5979422339624545*pi) q[2];
cz q[3],q[4];
cz q[0],q[2];
ry(1.4840138885903484*pi) q[3];
ry(1.381528224940525*pi) q[4];
cz q[0],q[3];
cz q[1],q[2];
cz q[0],q[4];
cz q[1],q[3];
ry(2.6512301631163115*pi) q[0];
cz q[1],q[4];
cz q[2],q[3];
ry(2.887447545094143*pi) q[1];
cz q[2],q[4];
cz q[0],q[1];
ry(3.2109968267753324*pi) q[2];
cz q[3],q[4];
cz q[0],q[2];
ry(3.51133559072447*pi) q[3];
ry(1.3169338816329004*pi) q[4];
cz q[0],q[3];
cz q[1],q[2];
cz q[0],q[4];
cz q[1],q[3];
ry(2.2732865886784057*pi) q[0];
cz q[1],q[4];
cz q[2],q[3];
ry(0.292759881673128*pi) q[1];
cz q[2],q[4];
ry(1.0076061759238049*pi) q[2];
cz q[3],q[4];
ry(0.17897522535317617*pi) q[3];
ry(1.4291376887777036*pi) q[4];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
