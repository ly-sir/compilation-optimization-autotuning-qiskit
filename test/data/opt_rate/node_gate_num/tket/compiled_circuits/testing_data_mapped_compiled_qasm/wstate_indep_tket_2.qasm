OPENQASM 2.0;
include "qelib1.inc";

qreg q[127];
creg meas[2];
sx q[36];
x q[51];
rz(0.25*pi) q[36];
sx q[36];
cx q[51],q[36];
sx q[36];
rz(2.25*pi) q[36];
sx q[36];
cx q[36],q[51];
barrier q[36],q[51];
measure q[36] -> meas[0];
measure q[51] -> meas[1];
