OPENQASM 2.0;
include "qelib1.inc";

qreg q[127];
creg c[1];
rz(0.5*pi) q[36];
rz(3.75*pi) q[51];
sx q[36];
x q[51];
rz(0.5*pi) q[36];
cx q[51],q[36];
rz(3.75*pi) q[36];
cx q[51],q[36];
rz(0.75*pi) q[36];
sx q[36];
rz(0.5*pi) q[36];
barrier q[36],q[51];
measure q[36] -> c[0];
