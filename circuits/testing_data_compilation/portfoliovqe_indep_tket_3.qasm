// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
ry(3.795031066773146*pi) q[0];
ry(2.693121422523297*pi) q[1];
ry(0.07790940672311904*pi) q[2];
cz q[0],q[1];
cz q[0],q[2];
ry(3.3589903374501056*pi) q[0];
cz q[1],q[2];
ry(1.7527410533918655*pi) q[1];
ry(3.266095666176213*pi) q[2];
cz q[0],q[1];
cz q[0],q[2];
ry(1.8964393602525378*pi) q[0];
cz q[1],q[2];
ry(1.5236741544734407*pi) q[1];
ry(0.6121636380220139*pi) q[2];
cz q[0],q[1];
cz q[0],q[2];
ry(0.9696299941212871*pi) q[0];
cz q[1],q[2];
ry(1.0766362346375073*pi) q[1];
ry(1.4106882264812313*pi) q[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
