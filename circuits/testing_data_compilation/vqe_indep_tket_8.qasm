// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[8];
creg meas[8];
ry(3.5646029795786687*pi) q[0];
ry(3.0*pi) q[1];
ry(0.5246452299604222*pi) q[2];
ry(3.4877912322120705*pi) q[3];
ry(0.006153113391383633*pi) q[4];
ry(3.5487457386749233*pi) q[5];
ry(0.3319712851755914*pi) q[6];
ry(1.0*pi) q[7];
cx q[6],q[7];
cx q[5],q[6];
ry(0.5000001228302826*pi) q[7];
cx q[4],q[5];
ry(3.499983159964522*pi) q[6];
cx q[3],q[4];
ry(0.49997822557189003*pi) q[5];
cx q[6],q[7];
cx q[2],q[3];
ry(0.5000035797491316*pi) q[4];
cx q[5],q[6];
ry(3.831969867207128*pi) q[7];
cx q[1],q[2];
ry(0.5000149061627961*pi) q[3];
cx q[4],q[5];
ry(0.9512619113477193*pi) q[6];
cx q[0],q[1];
ry(3.4999971264244514*pi) q[2];
cx q[3],q[4];
ry(0.5061861010796121*pi) q[5];
ry(3.6409198719767004*pi) q[0];
ry(3.6383010492574694*pi) q[1];
cx q[2],q[3];
ry(0.9878185381092345*pi) q[4];
cx q[1],q[2];
ry(0.9752998038116225*pi) q[3];
cx q[0],q[1];
ry(0.5000099810597716*pi) q[2];
ry(0.4725379908083457*pi) q[0];
ry(3.0586094917647064*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
