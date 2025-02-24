// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg meas[2];
ry(0.6819564040920701*pi) q[0];
ry(3.3810778094585983*pi) q[1];
cx q[0],q[1];
ry(0.3844364150843722*pi) q[0];
ry(3.611104638663588*pi) q[1];
cx q[0],q[1];
ry(0.24041236571165248*pi) q[0];
ry(3.2832262405379606*pi) q[1];
cx q[0],q[1];
ry(0.4977275346316433*pi) q[0];
ry(0.7074079063267773*pi) q[1];
barrier q[0],q[1];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
