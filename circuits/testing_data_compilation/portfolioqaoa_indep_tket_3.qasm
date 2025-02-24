// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
creg meas12[3];
h q[0];
h q[1];
h q[2];
rz(3.5224840672308306*pi) q[0];
rz(3.5226917994993805*pi) q[1];
rz(3.5228781693283815*pi) q[2];
rzz(0.4774456461359397*pi) q[0],q[1];
rzz(0.4774378867977097*pi) q[0],q[2];
rx(3.626781688112097*pi) q[0];
rzz(0.47745748406213534*pi) q[1],q[2];
rz(0.3452063158904261*pi) q[0];
rx(3.626781688112097*pi) q[1];
rx(3.626781688112097*pi) q[2];
rz(0.34505614186230343*pi) q[1];
rz(0.3449214111912452*pi) q[2];
rzz(3.654844495795735*pi) q[0],q[1];
rzz(3.6548501051846163*pi) q[0],q[2];
rx(0.24065248097068517*pi) q[0];
rzz(3.6548359379097914*pi) q[1],q[2];
rz(1.7396000354905206*pi) q[0];
rx(0.24065248097068517*pi) q[1];
rx(0.24065248097068517*pi) q[2];
rz(1.740583370244888*pi) q[1];
rz(1.7414655823889267*pi) q[2];
rzz(2.2600672512064146*pi) q[0],q[1];
rzz(2.2600305211066267*pi) q[0],q[2];
rx(0.1937724860071658*pi) q[0];
rzz(2.260123287971082*pi) q[1],q[2];
rx(0.1937724860071658*pi) q[1];
rx(0.1937724860071658*pi) q[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas12[0];
measure q[1] -> meas12[1];
measure q[2] -> meas12[2];
