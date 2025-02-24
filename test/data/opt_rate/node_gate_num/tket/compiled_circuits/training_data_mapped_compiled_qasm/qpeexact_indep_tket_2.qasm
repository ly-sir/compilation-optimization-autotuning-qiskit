OPENQASM 2.0;
include "qelib1.inc";

qreg q[127];
creg c[1];
x q[51];
cx q[51],q[36];
barrier q[36],q[51];
measure q[36] -> c[0];
