// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
h q[0];
h q[1];
h q[2];
h q[3];
rx(1.5561336296063406*pi) q[0];
rx(3.174376728393666*pi) q[1];
rx(1.3894566299251363*pi) q[2];
rx(2.964807915935281*pi) q[3];
cz q[0],q[1];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
h q[0];
cz q[1],q[3];
rx(0.041440975505851935*pi) q[0];
h q[1];
cz q[2],q[3];
rx(0.05498577063113465*pi) q[1];
h q[2];
h q[3];
cz q[0],q[1];
rx(1.1056183764858563*pi) q[2];
rx(3.288970717922111*pi) q[3];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
h q[0];
cz q[1],q[3];
rx(1.7961244477102514*pi) q[0];
h q[1];
cz q[2],q[3];
rx(0.9437272365056859*pi) q[1];
h q[2];
h q[3];
rx(3.0350926096229722*pi) q[2];
rx(2.510264304283419*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
