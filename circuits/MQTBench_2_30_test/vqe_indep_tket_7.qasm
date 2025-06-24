// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg meas[7];
ry(3.0*pi) q[0];
ry(0.5000973765338017*pi) q[1];
ry(0.5003696038591975*pi) q[2];
ry(3.4999908460947506*pi) q[3];
ry(3.0*pi) q[4];
ry(0.7164864297240515*pi) q[5];
ry(3.6409207155367644*pi) q[6];
cx q[5],q[6];
cx q[4],q[5];
ry(0.7300029400968456*pi) q[6];
cx q[3],q[4];
ry(3.7675199297314266*pi) q[5];
cx q[2],q[3];
ry(3.0000349075739554*pi) q[4];
cx q[5],q[6];
cx q[1],q[2];
ry(3.0*pi) q[3];
cx q[4],q[5];
ry(0.6081038048702728*pi) q[6];
cx q[0],q[1];
ry(1.0*pi) q[2];
cx q[3],q[4];
ry(0.49998535300645236*pi) q[5];
ry(3.500171566003734*pi) q[0];
ry(1.1844505668544638e-05*pi) q[1];
cx q[2],q[3];
ry(3.5407855723980304*pi) q[4];
cx q[1],q[2];
ry(3.500014329358956*pi) q[3];
cx q[0],q[1];
ry(0.4589813711246115*pi) q[2];
ry(3.500061369238032*pi) q[0];
ry(0.6690749387349436*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
