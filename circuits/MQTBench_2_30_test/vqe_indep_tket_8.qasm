// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[8];
creg meas[8];
ry(3.3934959494771206*pi) q[0];
ry(0.004420622597663189*pi) q[1];
ry(0.09556927134005902*pi) q[2];
ry(0.6442779477532886*pi) q[3];
ry(0.4937583486382296*pi) q[4];
ry(0.5001726599506093*pi) q[5];
ry(0.5001795834359585*pi) q[6];
ry(3.499870788307014*pi) q[7];
cx q[6],q[7];
cx q[5],q[6];
ry(3.0*pi) q[7];
cx q[4],q[5];
ry(0.9999974679992507*pi) q[6];
cx q[3],q[4];
ry(1.0*pi) q[5];
cx q[6],q[7];
cx q[2],q[3];
ry(3.003639757128429*pi) q[4];
cx q[5],q[6];
ry(0.5004178290297419*pi) q[7];
cx q[1],q[2];
ry(0.13837166929899053*pi) q[3];
cx q[4],q[5];
ry(0.4999500931253333*pi) q[6];
cx q[0],q[1];
ry(0.586030207664556*pi) q[2];
cx q[3],q[4];
ry(0.5001985704092224*pi) q[5];
ry(3.4833286429740067*pi) q[0];
ry(3.5157661063412657*pi) q[1];
cx q[2],q[3];
ry(3.4936950180491766*pi) q[4];
cx q[1],q[2];
ry(0.4585840524176259*pi) q[3];
cx q[0],q[1];
ry(3.504636367990501*pi) q[2];
ry(0.49326637840355136*pi) q[0];
ry(0.8941047714374679*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
