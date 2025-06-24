// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg meas[5];
ry(3.5037520781971994*pi) q[0];
ry(0.04896270380004932*pi) q[1];
ry(3.9998526458906394*pi) q[2];
ry(3.5015448258979314*pi) q[3];
ry(3.998934406450405*pi) q[4];
cx q[3],q[4];
cx q[2],q[3];
ry(0.6417713639128593*pi) q[4];
cx q[1],q[2];
ry(3.3582331805837113*pi) q[3];
cx q[0],q[1];
ry(3.1890752092872807*pi) q[2];
cx q[3],q[4];
ry(0.5357116201647167*pi) q[0];
ry(0.46387837406801696*pi) q[1];
cx q[2],q[3];
ry(0.9982247299162608*pi) q[4];
cx q[1],q[2];
ry(0.5003444330325407*pi) q[3];
cx q[0],q[1];
ry(3.764423962957882*pi) q[2];
ry(3.0025167882069557*pi) q[0];
ry(0.006664246964012706*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
