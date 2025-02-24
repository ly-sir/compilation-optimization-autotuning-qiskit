// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg meas[9];
ry(0.495941217331949*pi) q[0];
ry(9.563411407119326e-05*pi) q[1];
ry(0.5000221575090564*pi) q[2];
ry(3.0000190421609703*pi) q[3];
ry(0.49992892298053304*pi) q[4];
ry(3.999837665009486*pi) q[5];
ry(0.051232054209677226*pi) q[6];
ry(3.5519105339773756*pi) q[7];
ry(0.04678245100786179*pi) q[8];
cx q[7],q[8];
cx q[6],q[7];
ry(3.2963843818574903*pi) q[8];
cx q[5],q[6];
ry(3.696348546705241*pi) q[7];
cx q[4],q[5];
ry(0.45683185239274676*pi) q[6];
cx q[7],q[8];
cx q[3],q[4];
ry(0.9464439448651759*pi) q[5];
cx q[6],q[7];
ry(0.9327311896744978*pi) q[8];
cx q[2],q[3];
ry(0.05353355160522503*pi) q[4];
cx q[5],q[6];
ry(3.440262336017355*pi) q[7];
cx q[1],q[2];
ry(0.97492968868062*pi) q[3];
cx q[4],q[5];
ry(0.5000402929214833*pi) q[6];
cx q[0],q[1];
ry(0.02501670930877569*pi) q[2];
cx q[3],q[4];
ry(3.9999936359356325*pi) q[5];
ry(3.0999413365606436*pi) q[0];
ry(0.09988882191892759*pi) q[1];
cx q[2],q[3];
ry(0.5000512744239453*pi) q[4];
cx q[1],q[2];
ry(1.0*pi) q[3];
cx q[0],q[1];
ry(3.502790696930819*pi) q[2];
ry(3.504005765899448*pi) q[0];
ry(0.0012492374504682764*pi) q[1];
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
