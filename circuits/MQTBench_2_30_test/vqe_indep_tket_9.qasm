// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg meas[9];
ry(3.9999613664056013*pi) q[0];
ry(3.999998102138632*pi) q[1];
ry(1.0*pi) q[2];
ry(3.9999699390365127*pi) q[3];
ry(3.9395324039586823*pi) q[4];
ry(0.999932337556411*pi) q[5];
ry(0.4998691540925343*pi) q[6];
ry(3.0001306868198503*pi) q[7];
ry(3.2819675607976286*pi) q[8];
cx q[7],q[8];
cx q[6],q[7];
ry(3.7819770028344064*pi) q[8];
cx q[5],q[6];
ry(0.8329999475699699*pi) q[7];
cx q[4],q[5];
ry(0.8330246952747912*pi) q[6];
cx q[7],q[8];
cx q[3],q[4];
ry(3.567555288256349*pi) q[5];
cx q[6],q[7];
ry(3.180916025695111*pi) q[8];
cx q[2],q[3];
ry(0.7708766453102927*pi) q[4];
cx q[5],q[6];
ry(3.9997734730110874*pi) q[7];
cx q[1],q[2];
ry(3.0*pi) q[3];
cx q[4],q[5];
ry(0.5000060119911033*pi) q[6];
cx q[0],q[1];
ry(1.0*pi) q[2];
cx q[3],q[4];
ry(0.409617943618383*pi) q[5];
ry(3.9999975309867035*pi) q[0];
ry(3.0*pi) q[1];
cx q[2],q[3];
ry(3.764402285464206*pi) q[4];
cx q[1],q[2];
ry(0.9999682162764453*pi) q[3];
cx q[0],q[1];
ry(3.9999727526483326*pi) q[2];
ry(5.837583636625672e-06*pi) q[0];
ry(3.9999750737060205*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
