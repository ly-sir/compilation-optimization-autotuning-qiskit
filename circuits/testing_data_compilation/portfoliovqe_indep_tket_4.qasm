// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
ry(1.2770140001583732*pi) q[0];
ry(3.072880747448157*pi) q[1];
ry(1.4391921112286463*pi) q[2];
ry(0.6334166895945071*pi) q[3];
cz q[0],q[1];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
ry(2.9562545453765114*pi) q[0];
cz q[1],q[3];
ry(0.6481118026273561*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(2.7407573893082797*pi) q[2];
ry(0.2605030829382765*pi) q[3];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
ry(1.773167867817301*pi) q[0];
cz q[1],q[3];
ry(0.43383587949331015*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(3.6149234217098596*pi) q[2];
ry(3.1192897761218523*pi) q[3];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
ry(2.592261190975921*pi) q[0];
cz q[1],q[3];
ry(0.025287950651953713*pi) q[1];
cz q[2],q[3];
ry(0.4730335864194065*pi) q[2];
ry(3.800506747940491*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
