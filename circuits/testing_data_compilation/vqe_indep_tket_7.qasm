// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg meas[7];
ry(1.6410062210014044e-05*pi) q[0];
ry(3.999628071203152*pi) q[1];
ry(3.5262997013243065*pi) q[2];
ry(3.050535349479498*pi) q[3];
ry(0.9997656577073536*pi) q[4];
ry(0.5456735851549547*pi) q[5];
ry(3.001764937500677*pi) q[6];
cx q[5],q[6];
cx q[4],q[5];
ry(3.512929353408254*pi) q[6];
cx q[3],q[4];
ry(0.5127528218430971*pi) q[5];
cx q[2],q[3];
ry(3.5937547648727968*pi) q[4];
cx q[5],q[6];
cx q[1],q[2];
ry(3.549679310352527*pi) q[3];
cx q[4],q[5];
ry(0.9542493956555482*pi) q[6];
cx q[0],q[1];
ry(3.549232628233451*pi) q[2];
cx q[3],q[4];
ry(3.500189423583314*pi) q[5];
ry(1.0*pi) q[0];
ry(3.6258727688403267*pi) q[1];
cx q[2],q[3];
ry(3.467277458927259*pi) q[4];
cx q[1],q[2];
ry(0.027123328538483805*pi) q[3];
cx q[0],q[1];
ry(3.789053056871404*pi) q[2];
ry(0.999981046709555*pi) q[0];
ry(0.3707606648839295*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
