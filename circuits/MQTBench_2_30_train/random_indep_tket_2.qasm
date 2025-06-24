// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg meas[2];
sdg q[0];
sdg q[1];
rxx(0.4153636201582947*pi) q[0],q[1];
u2(0.0*pi,1.5*pi) q[0];
s q[1];
cx q[1],q[0];
rz(1.0256092328731305*pi) q[0];
cx q[1],q[0];
u2(0.22740714679266594*pi,1.0*pi) q[0];
u3(1.0*pi,0.5*pi,1.5*pi) q[1];
cx q[1],q[0];
ry(3.0430739965466325*pi) q[0];
ry(0.9569260034533674*pi) q[1];
cx q[1],q[0];
u1(1.1506658127695975*pi) q[0];
u2(1.0*pi,1.0*pi) q[1];
barrier q[0],q[1];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
