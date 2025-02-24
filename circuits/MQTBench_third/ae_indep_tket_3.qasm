// Benchmark was created by MQT Bench on 2024-03-17
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg eval[2];
qreg q[1];
creg meas[3];
h eval[0];
h eval[1];
ry(0.29516723530086647*pi) q[0];
u1(0.0*pi) eval[0];
u1(0.0*pi) eval[1];
u1(0.0*pi) q[0];
cx eval[0],q[0];
u3(3.7048327646991335*pi,0.0*pi,0.0*pi) q[0];
cx eval[0],q[0];
u3(0.29516723530086647*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[1],q[0];
u3(3.4096655293982683*pi,0.0*pi,0.0*pi) q[0];
cx eval[1],q[0];
h eval[1];
u3(0.5903344706017317*pi,0.0*pi,0.0*pi) q[0];
cu1(1.5*pi) eval[0],eval[1];
h eval[0];
barrier eval[0],eval[1],q[0];
measure eval[0] -> meas[0];
measure eval[1] -> meas[1];
measure q[0] -> meas[2];
