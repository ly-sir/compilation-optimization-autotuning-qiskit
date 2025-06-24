// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
h q[0];
h q[1];
h q[2];
h q[3];
rzz(3.4999129625283976*pi) q[0],q[1];
rzz(3.4999129625283976*pi) q[0],q[2];
rzz(3.4999129625283976*pi) q[1],q[3];
rx(0.7500896764088623*pi) q[0];
rx(0.7500896764088623*pi) q[1];
rzz(3.4999129625283976*pi) q[2],q[3];
rzz(3.250078032820988*pi) q[0],q[1];
rx(0.7500896764088623*pi) q[2];
rx(0.7500896764088623*pi) q[3];
rzz(3.250078032820988*pi) q[0],q[2];
rzz(3.250078032820988*pi) q[1],q[3];
rx(3.4999565420616396*pi) q[0];
rx(3.4999565420616396*pi) q[1];
rzz(3.250078032820988*pi) q[2],q[3];
rx(3.4999565420616396*pi) q[2];
rx(3.4999565420616396*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
