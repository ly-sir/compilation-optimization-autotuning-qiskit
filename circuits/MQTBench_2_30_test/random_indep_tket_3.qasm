// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
u3(1.0256092328731305*pi,1.7718392080410132*pi,0.22816079195898678*pi) q[0];
u2(0.0*pi,0.0*pi) q[1];
u1(0.20143575383595938*pi) q[2];
cx q[1],q[2];
ry(0.8284448852745293*pi) q[1];
ry(3.1715551147254706*pi) q[2];
cx q[1],q[2];
u2(1.0*pi,1.0*pi) q[1];
u1(0.7985642461640403*pi) q[2];
cu1(0.5*pi) q[0],q[1];
cswap q[0],q[1],q[2];
u1(1.8668769417031639*pi) q[0];
rzz(1.6542078740495894*pi) q[1],q[2];
rzz(1.813057512225854*pi) q[0],q[2];
u3(0.7882700083606491*pi,1.6675289134386766*pi,0.8095264143653405*pi) q[1];
cu3(1.0356684272337393*pi,0.6449491175321237*pi,0.5648670343293598*pi) q[0],q[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
