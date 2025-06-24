// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
ry(0.11584936398588014*pi) q[0];
ry(2.8426283537180685*pi) q[1];
ry(1.0702431698866588*pi) q[2];
ry(0.9488363256419555*pi) q[3];
cz q[0],q[1];
ry(3.6807946352719254*pi) q[0];
cz q[1],q[2];
ry(1.987213716880078*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(0.9791785571093603*pi) q[2];
ry(3.3761219588395184*pi) q[3];
ry(0.2804645994458903*pi) q[0];
cz q[1],q[2];
ry(1.1458441599641114*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(1.4516854789800835*pi) q[2];
ry(1.8481480927515097*pi) q[3];
ry(2.7679510461553636*pi) q[0];
cz q[1],q[2];
ry(1.2213384131534233*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(2.7828769635283876*pi) q[2];
ry(1.907126075093196*pi) q[3];
ry(2.842480193822043*pi) q[0];
cz q[1],q[2];
ry(1.7132260135155855*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(2.993990975452*pi) q[2];
ry(2.0565480282754094*pi) q[3];
ry(0.14667815078433827*pi) q[0];
cz q[1],q[2];
ry(2.787691430745379*pi) q[1];
cz q[2],q[3];
ry(3.137592791988654*pi) q[2];
ry(0.5319134942614157*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
