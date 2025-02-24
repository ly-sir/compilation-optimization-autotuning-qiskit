// Benchmark was created by MQT Bench on 2024-03-17
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg eval[3];
qreg q[1];
creg meas[4];
h eval[0];
h eval[1];
h eval[2];
ry(0.29516723530086647*pi) q[0];
u1(0.0*pi) eval[0];
u1(0.0*pi) eval[1];
u1(0.0*pi) eval[2];
u1(0.0*pi) q[0];
cx eval[0],q[0];
u3(3.7048327646991335*pi,0.0*pi,0.0*pi) q[0];
cx eval[0],q[0];
u3(0.29516723530086647*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[1],q[0];
u3(3.4096655293982683*pi,0.0*pi,0.0*pi) q[0];
cx eval[1],q[0];
u3(0.5903344706017317*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[2],q[0];
u3(2.8193310587965335*pi,0.0*pi,0.0*pi) q[0];
cx eval[2],q[0];
h eval[2];
u3(1.1806689412034665*pi,0.0*pi,0.0*pi) q[0];
cu1(1.5*pi) eval[1],eval[2];
cu1(1.75*pi) eval[0],eval[2];
h eval[1];
cu1(1.5*pi) eval[0],eval[1];
h eval[0];
barrier eval[0],eval[1],eval[2],q[0];
measure eval[0] -> meas[0];
measure eval[1] -> meas[1];
measure eval[2] -> meas[2];
measure q[0] -> meas[3];
