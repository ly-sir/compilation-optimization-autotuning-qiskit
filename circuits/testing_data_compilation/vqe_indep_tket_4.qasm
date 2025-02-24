// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
ry(5.682295649897524e-05*pi) q[0];
ry(0.7853550336296203*pi) q[1];
ry(3.998601910347878*pi) q[2];
ry(0.6014801997565982*pi) q[3];
cx q[2],q[3];
cx q[1],q[2];
ry(3.898696337068159*pi) q[3];
cx q[0],q[1];
ry(3.310974589718272*pi) q[2];
ry(0.9999239949247525*pi) q[0];
ry(0.23836121674001198*pi) q[1];
cx q[2],q[3];
cx q[1],q[2];
ry(0.4995836849970151*pi) q[3];
cx q[0],q[1];
ry(3.2251065320882124*pi) q[2];
ry(3.999914763218314*pi) q[0];
ry(0.30682514998027427*pi) q[1];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
