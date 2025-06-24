// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
ry(3.5901578348435237*pi) q[0];
ry(3.5478016353018584*pi) q[1];
ry(0.06269023801310301*pi) q[2];
cx q[1],q[2];
cx q[0],q[1];
ry(0.47238378480698634*pi) q[2];
ry(0.6389251840787413*pi) q[0];
ry(3.471493046388796*pi) q[1];
cx q[1],q[2];
cx q[0],q[1];
ry(0.07457788372819749*pi) q[2];
ry(0.6699116037856104*pi) q[0];
ry(3.1086575163626913*pi) q[1];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
