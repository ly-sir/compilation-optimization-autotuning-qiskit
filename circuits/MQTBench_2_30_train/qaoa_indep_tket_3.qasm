// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
h q[0];
h q[1];
h q[2];
rzz(2.367017633013538*pi) q[0],q[1];
rzz(2.367017633013538*pi) q[0],q[2];
rx(2.804315030009394*pi) q[0];
rzz(2.367017633013538*pi) q[1],q[2];
rx(2.804315030009394*pi) q[1];
rx(2.804315030009394*pi) q[2];
rzz(3.19611097036086*pi) q[0],q[1];
rzz(3.19611097036086*pi) q[0],q[2];
rx(1.1709674123056986*pi) q[0];
rzz(3.19611097036086*pi) q[1],q[2];
rx(1.1709674123056986*pi) q[1];
rx(1.1709674123056986*pi) q[2];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
