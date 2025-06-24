// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
ry(1.252401880795735*pi) q[0];
ry(2.639157561116421*pi) q[1];
ry(3.9101789670740876*pi) q[2];
cz q[0],q[1];
cz q[0],q[2];
ry(0.08379808104084062*pi) q[0];
cz q[1],q[2];
ry(3.794665954892972*pi) q[1];
ry(1.331198086662857*pi) q[2];
cz q[0],q[1];
cz q[0],q[2];
ry(1.073757755356186*pi) q[0];
cz q[1],q[2];
ry(0.8074531054885491*pi) q[1];
ry(1.4397957235765468*pi) q[2];
cz q[0],q[1];
cz q[0],q[2];
ry(3.097011608877402*pi) q[0];
cz q[1],q[2];
ry(0.0040714964795749604*pi) q[1];
ry(3.227874751943394*pi) q[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
