// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg meas[6];
ry(0.007920209158215369*pi) q[0];
ry(3.9941822526412736*pi) q[1];
ry(3.862367283940368*pi) q[2];
ry(3.449551421196152*pi) q[3];
ry(3.495369919836497*pi) q[4];
ry(3.8958271370632653*pi) q[5];
cx q[4],q[5];
cx q[3],q[4];
ry(0.49802630202083603*pi) q[5];
cx q[2],q[3];
ry(3.5345742219407543*pi) q[4];
cx q[1],q[2];
ry(3.1086472346668343*pi) q[3];
cx q[4],q[5];
cx q[0],q[1];
ry(3.485699596238033*pi) q[2];
cx q[3],q[4];
ry(3.528491643737019*pi) q[5];
ry(0.3685853823664041*pi) q[0];
ry(0.4075269172051547*pi) q[1];
cx q[2],q[3];
ry(0.11013057072766708*pi) q[4];
cx q[1],q[2];
ry(0.3664455549048144*pi) q[3];
cx q[4],q[5];
cx q[0],q[1];
ry(3.5033675037055225*pi) q[2];
cx q[3],q[4];
ry(0.5466701428833962*pi) q[5];
ry(3.456116364840308*pi) q[0];
ry(0.48489606252752837*pi) q[1];
cx q[2],q[3];
ry(3.0157317839677016*pi) q[4];
cx q[1],q[2];
ry(0.029891791857802302*pi) q[3];
cx q[0],q[1];
ry(0.0879440208834494*pi) q[2];
ry(3.5981174881525124*pi) q[0];
ry(0.128219350043679*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
