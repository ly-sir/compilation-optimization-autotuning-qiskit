// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
creg meas11[3];
h q[0];
h q[1];
h q[2];
rz(1.8622575051922121*pi) q[0];
rz(1.8594451936057295*pi) q[1];
rz(1.8870759704272633*pi) q[2];
rzz(2.1369507323215986*pi) q[0],q[1];
rzz(2.1366077770190426*pi) q[0],q[2];
rx(3.3089150935566174*pi) q[0];
rzz(2.1370364638038017*pi) q[1],q[2];
rz(3.425060044821118*pi) q[0];
rx(3.3089150935566174*pi) q[1];
rx(3.3089150935566174*pi) q[2];
rz(3.4259282976234138*pi) q[1];
rz(3.417397770806884*pi) q[2];
rzz(0.5751843982202203*pi) q[0],q[1];
rzz(0.5752902797676036*pi) q[0],q[2];
rx(0.049041637271535876*pi) q[0];
rzz(0.575157930100531*pi) q[1],q[2];
rz(0.4020219634166875*pi) q[0];
rx(0.049041637271535876*pi) q[1];
rx(0.049041637271535876*pi) q[2];
rz(0.40141484489382917*pi) q[1];
rz(0.40737974454790343*pi) q[2];
rzz(3.5978071118275405*pi) q[0],q[1];
rzz(3.5977330750395486*pi) q[0],q[2];
rx(1.6785699799329916*pi) q[0];
rzz(3.597825619439246*pi) q[1],q[2];
rx(1.6785699799329916*pi) q[1];
rx(1.6785699799329916*pi) q[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas11[0];
measure q[1] -> meas11[1];
measure q[2] -> meas11[2];
