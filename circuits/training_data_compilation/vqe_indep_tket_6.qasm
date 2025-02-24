// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg meas[6];
ry(3.1492703281825936*pi) q[0];
ry(0.835914074905221*pi) q[1];
ry(0.5179035384529479*pi) q[2];
ry(0.893367034427537*pi) q[3];
ry(0.12014324591436913*pi) q[4];
ry(3.579197961738296*pi) q[5];
cx q[4],q[5];
cx q[3],q[4];
ry(0.2923821676668433*pi) q[5];
cx q[2],q[3];
ry(3.889355443301857*pi) q[4];
cx q[1],q[2];
ry(3.6086008628522133*pi) q[3];
cx q[4],q[5];
cx q[0],q[1];
ry(0.6089862034265281*pi) q[2];
cx q[3],q[4];
ry(3.973130779664096*pi) q[5];
ry(0.7543649479199909*pi) q[0];
ry(0.2841132945400213*pi) q[1];
cx q[2],q[3];
ry(0.4240253316676199*pi) q[4];
cx q[1],q[2];
ry(3.0435107061385342*pi) q[3];
cx q[0],q[1];
ry(0.695060739455316*pi) q[2];
ry(3.0631328583117607*pi) q[0];
ry(0.4358664922567728*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
