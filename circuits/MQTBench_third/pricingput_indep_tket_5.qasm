// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg meas[5];
ry(0.5531220378099326*pi) q[0];
ry(0.46466940394973005*pi) q[1];
ry(0.6249999999999998*pi) q[2];
x q[3];
x q[4];
cx q[1],q[0];
ry(0.41909154294952533*pi) q[0];
cx q[1],q[0];
cry(3.8542278766227898*pi) q[0],q[2];
cry(3.70845575324558*pi) q[1],q[2];
x q[1];
u1(0.0*pi) q[2];
ccx q[1],q[4],q[3];
x q[1];
u1(0.0*pi) q[3];
x q[4];
cx q[3],q[2];
x q[4];
u3(0.12499999999999994*pi,0.0*pi,0.0*pi) q[2];
cx q[3],q[2];
u3(3.875*pi,0.0*pi,0.0*pi) q[2];
u1(0.0*pi) q[3];
u1(0.0*pi) q[2];
cx q[3],q[2];
u3(3.9635569691556976*pi,0.0*pi,0.0*pi) q[2];
cx q[3],q[2];
u3(0.03644303084430251*pi,0.0*pi,0.0*pi) q[2];
ccx q[3],q[0],q[2];
u1(0.0*pi) q[2];
u1(0.0*pi) q[3];
cx q[3],q[2];
u3(0.03644303084430251*pi,0.0*pi,0.0*pi) q[2];
cx q[3],q[2];
u3(3.9635569691556976*pi,0.0*pi,0.0*pi) q[2];
ccx q[3],q[0],q[2];
u1(0.0*pi) q[2];
u1(0.0*pi) q[3];
cx q[3],q[2];
u3(3.927113938311395*pi,0.0*pi,0.0*pi) q[2];
cx q[3],q[2];
u3(0.07288606168860502*pi,0.0*pi,0.0*pi) q[2];
ccx q[3],q[1],q[2];
u1(0.0*pi) q[2];
u1(0.0*pi) q[3];
cx q[3],q[2];
u3(0.07288606168860502*pi,0.0*pi,0.0*pi) q[2];
cx q[3],q[2];
u3(3.927113938311395*pi,0.0*pi,0.0*pi) q[2];
ccx q[3],q[1],q[2];
x q[1];
ccx q[1],q[4],q[3];
x q[1];
x q[3];
x q[4];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
