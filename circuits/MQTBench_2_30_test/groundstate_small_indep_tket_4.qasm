// Benchmark was created by MQT Bench on 2024-03-19
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
rx(1.5983050496669564*pi) q[0];
rx(1.25008176438498*pi) q[1];
rx(0.2739165855257941*pi) q[2];
rx(0.9569399813744673*pi) q[3];
cz q[0],q[1];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
h q[0];
cz q[1],q[3];
rx(2.005686014219034*pi) q[0];
h q[1];
cz q[2],q[3];
rx(0.9640871399284999*pi) q[1];
h q[2];
h q[3];
cz q[0],q[1];
rx(0.029743158058406497*pi) q[2];
rx(1.0065080994532452*pi) q[3];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
h q[0];
cz q[1],q[3];
rx(1.7973328427310513*pi) q[0];
h q[1];
cz q[2],q[3];
rx(0.03737047132014831*pi) q[1];
h q[2];
h q[3];
rx(0.10156935439148868*pi) q[2];
rx(3.8529459010778893*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
