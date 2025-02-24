// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg meas[5];
ry(0.011216539805763119*pi) q[0];
ry(3.0000886010315644*pi) q[1];
ry(0.4565797481983551*pi) q[2];
ry(0.41056850946427254*pi) q[3];
ry(3.1610363383471043*pi) q[4];
cx q[3],q[4];
cx q[2],q[3];
ry(0.4515248842412969*pi) q[4];
cx q[1],q[2];
ry(3.974221321903867*pi) q[3];
cx q[0],q[1];
ry(0.09137014482325966*pi) q[2];
cx q[3],q[4];
ry(3.0721413494486947*pi) q[0];
ry(3.7762135410995277*pi) q[1];
cx q[2],q[3];
ry(3.5764212885766904*pi) q[4];
cx q[1],q[2];
ry(3.1596570476409305*pi) q[3];
cx q[0],q[1];
ry(0.499918265704625*pi) q[2];
ry(0.9853385334125697*pi) q[0];
ry(3.221356446683751*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
