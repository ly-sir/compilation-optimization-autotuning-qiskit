// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg meas[6];
ry(8.740261012154034e-05*pi) q[0];
ry(3.4964514512729536*pi) q[1];
ry(3.0728671629662507*pi) q[2];
ry(3.0*pi) q[3];
ry(3.500014615043683*pi) q[4];
ry(1.0*pi) q[5];
cx q[4],q[5];
cx q[3],q[4];
ry(3.0*pi) q[5];
cx q[2],q[3];
ry(3.000095320588591*pi) q[4];
cx q[1],q[2];
ry(0.49998938633512896*pi) q[3];
cx q[4],q[5];
cx q[0],q[1];
ry(0.4999276398309193*pi) q[2];
cx q[3],q[4];
ry(0.9999669215426085*pi) q[5];
ry(3.044016513522042*pi) q[0];
ry(0.49992716532669346*pi) q[1];
cx q[2],q[3];
ry(3.4999567792413004*pi) q[4];
cx q[1],q[2];
ry(0.5729109858274427*pi) q[3];
cx q[0],q[1];
ry(0.9964391983690882*pi) q[2];
ry(3.9560392185611164*pi) q[0];
ry(3.499972954951099*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
