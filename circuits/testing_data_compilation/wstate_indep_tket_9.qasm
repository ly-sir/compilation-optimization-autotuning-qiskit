// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg meas[9];
ry(3.75*pi) q[0];
ry(3.695913276015304*pi) q[1];
ry(3.666666666666666*pi) q[2];
ry(3.6475836176504335*pi) q[3];
ry(3.6338602364006154*pi) q[4];
ry(3.6233758572144237*pi) q[5];
ry(3.6150267280813075*pi) q[6];
ry(3.6081734479693943*pi) q[7];
x q[8];
cz q[8],q[7];
ry(0.39182655203060585*pi) q[7];
cz q[7],q[6];
ry(0.3849732719186924*pi) q[6];
cx q[7],q[8];
cz q[6],q[5];
ry(0.3766241427855764*pi) q[5];
cx q[6],q[7];
cz q[5],q[4];
ry(0.36613976359938455*pi) q[4];
cx q[5],q[6];
cz q[4],q[3];
ry(0.35241638234956657*pi) q[3];
cx q[4],q[5];
cz q[3],q[2];
ry(0.3333333333333341*pi) q[2];
cx q[3],q[4];
cz q[2],q[1];
ry(0.30408672398469627*pi) q[1];
cx q[2],q[3];
cz q[1],q[0];
ry(0.25*pi) q[0];
cx q[1],q[2];
cx q[0],q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
