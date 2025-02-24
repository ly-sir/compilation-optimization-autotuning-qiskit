// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg meas[5];
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
rzz(3.614037152155276*pi) q[0],q[1];
rzz(3.614037152155276*pi) q[0],q[2];
rzz(3.614037152155276*pi) q[1],q[3];
rx(3.8417605064056026*pi) q[0];
rx(3.8417605064056026*pi) q[1];
rzz(3.614037152155276*pi) q[2],q[4];
rzz(3.158740421870817*pi) q[0],q[1];
rx(3.8417605064056026*pi) q[2];
rzz(3.614037152155276*pi) q[3],q[4];
rzz(3.158740421870817*pi) q[0],q[2];
rx(3.8417605064056026*pi) q[3];
rx(3.8417605064056026*pi) q[4];
rx(0.38517431212444553*pi) q[0];
rzz(3.158740421870817*pi) q[1],q[3];
rzz(3.158740421870817*pi) q[2],q[4];
rx(0.38517431212444553*pi) q[1];
rx(0.38517431212444553*pi) q[2];
rzz(3.158740421870817*pi) q[3],q[4];
rx(0.38517431212444553*pi) q[3];
rx(0.38517431212444553*pi) q[4];
barrier q[0],q[1],q[2],q[3],q[4];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
