// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg meas[5];
ry(0.5693889606544189*pi) q[0];
ry(2.744541168335044*pi) q[1];
ry(1.5293268392248127*pi) q[2];
ry(1.1753012192231136*pi) q[3];
ry(3.7372762022605346*pi) q[4];
cz q[0],q[1];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
cz q[0],q[4];
cz q[1],q[3];
ry(2.6531650361416776*pi) q[0];
cz q[1],q[4];
cz q[2],q[3];
ry(2.846705820641609*pi) q[1];
cz q[2],q[4];
cz q[0],q[1];
ry(2.5839157606044942*pi) q[2];
cz q[3],q[4];
cz q[0],q[2];
ry(1.7454505552333952*pi) q[3];
ry(3.136700267930394*pi) q[4];
cz q[0],q[3];
cz q[1],q[2];
cz q[0],q[4];
cz q[1],q[3];
ry(3.700196894162171*pi) q[0];
cz q[1],q[4];
cz q[2],q[3];
ry(3.560064634463958*pi) q[1];
cz q[2],q[4];
cz q[0],q[1];
ry(2.6513931757472307*pi) q[2];
cz q[3],q[4];
cz q[0],q[2];
ry(1.893441434988835*pi) q[3];
ry(2.648681737829433*pi) q[4];
cz q[0],q[3];
cz q[1],q[2];
cz q[0],q[4];
cz q[1],q[3];
ry(0.5897461377809925*pi) q[0];
cz q[1],q[4];
cz q[2],q[3];
ry(3.6232529145096306*pi) q[1];
cz q[2],q[4];
ry(0.6669612368548504*pi) q[2];
cz q[3],q[4];
ry(2.07873664883395*pi) q[3];
ry(1.829729584208828*pi) q[4];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
