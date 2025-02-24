OPENQASM 2.0;
include "qelib1.inc";

qreg q[127];
creg meas[5];
rz(0.5*pi) q[36];
sx q[36];
rz(0.5*pi) q[36];
cx q[36],q[51];
cx q[51],q[50];
cx q[50],q[49];
cx q[49],q[48];
barrier q[48],q[49],q[50],q[51],q[36];
measure q[48] -> meas[0];
measure q[49] -> meas[1];
measure q[50] -> meas[2];
measure q[51] -> meas[3];
measure q[36] -> meas[4];
