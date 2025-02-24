// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg meas[3];
ry(0.9285718442039134*pi) q[0];
ry(3.6493861764457436*pi) q[1];
ry(0.799834197719606*pi) q[2];
cx q[1],q[2];
cx q[0],q[1];
ry(0.46656959163996375*pi) q[2];
ry(0.757883883706716*pi) q[0];
ry(3.8451760248399514*pi) q[1];
cx q[1],q[2];
cx q[0],q[1];
ry(3.1889272172927843*pi) q[2];
ry(3.5728052728059003*pi) q[0];
ry(3.134385087186866*pi) q[1];
barrier q[0],q[1],q[2];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
