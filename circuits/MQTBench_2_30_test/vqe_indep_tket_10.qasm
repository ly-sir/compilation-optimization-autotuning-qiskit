// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[10];
creg meas[10];
ry(3.999973796804621*pi) q[0];
ry(3.0*pi) q[1];
ry(3.0*pi) q[2];
ry(3.9302974660619583*pi) q[3];
ry(0.04993211136416494*pi) q[4];
ry(3.5014672257754773*pi) q[5];
ry(3.0012275945099938*pi) q[6];
ry(0.4498708126556786*pi) q[7];
ry(0.1658878239827952*pi) q[8];
ry(0.3305788546702547*pi) q[9];
cx q[8],q[9];
cx q[7],q[8];
ry(0.017392420307688176*pi) q[9];
cx q[6],q[7];
ry(3.0982950344255435*pi) q[8];
cx q[5],q[6];
ry(0.8862482616230727*pi) q[7];
cx q[8],q[9];
cx q[4],q[5];
ry(3.496117147260204*pi) q[6];
cx q[7],q[8];
ry(3.471520451010618*pi) q[9];
cx q[3],q[4];
ry(3.496045441967924*pi) q[5];
cx q[6],q[7];
ry(0.829518325194414*pi) q[8];
cx q[2],q[3];
ry(3.7960923836568545*pi) q[4];
cx q[5],q[6];
ry(0.5014278752813538*pi) q[7];
cx q[1],q[2];
ry(3.9406771496807385*pi) q[3];
cx q[4],q[5];
ry(3.001425569423227*pi) q[6];
cx q[0],q[1];
ry(3.9996581879375155*pi) q[2];
cx q[3],q[4];
ry(3.8181418261797044*pi) q[5];
ry(3.0*pi) q[0];
ry(0.00028594236544613355*pi) q[1];
cx q[2],q[3];
ry(0.21818156114010848*pi) q[4];
cx q[1],q[2];
ry(3.893838981096943*pi) q[3];
cx q[0],q[1];
ry(3.9997751456342*pi) q[2];
ry(3.9999433154562576*pi) q[0];
ry(3.9996052655302474*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
