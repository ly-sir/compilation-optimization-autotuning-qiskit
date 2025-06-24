// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
ry(2.3869153071644345*pi) q[0];
ry(3.1077145786458216*pi) q[1];
ry(0.6171986522865733*pi) q[2];
ry(3.436115875527885*pi) q[3];
cz q[0],q[1];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
ry(1.1435501734394786*pi) q[0];
cz q[1],q[3];
ry(0.9767700509507932*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(3.9266736542033196*pi) q[2];
ry(1.8213424681546309*pi) q[3];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
ry(3.3035467277205823*pi) q[0];
cz q[1],q[3];
ry(1.5877744935841533*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(2.1192042162620663*pi) q[2];
ry(2.6454494596210196*pi) q[3];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
ry(1.9929124895889279*pi) q[0];
cz q[1],q[3];
ry(0.3964858227112252*pi) q[1];
cz q[2],q[3];
ry(2.8428935604807175*pi) q[2];
ry(3.002955104033868*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
