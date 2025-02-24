// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg meas[6];
ry(3.995646619057791*pi) q[0];
ry(3.1664576138300027*pi) q[1];
ry(0.2471036219338319*pi) q[2];
ry(3.1145036042971643*pi) q[3];
ry(0.5025646529420761*pi) q[4];
ry(0.023681585033935734*pi) q[5];
cx q[4],q[5];
cx q[3],q[4];
ry(0.4586797545094316*pi) q[5];
cx q[2],q[3];
ry(0.533706893418067*pi) q[4];
cx q[1],q[2];
ry(3.618288836778299*pi) q[3];
cx q[4],q[5];
cx q[0],q[1];
ry(0.06323067527813192*pi) q[2];
cx q[3],q[4];
ry(0.49221350125639474*pi) q[5];
ry(0.28927538328031266*pi) q[0];
ry(3.734628408753284*pi) q[1];
cx q[2],q[3];
ry(3.885224971772062*pi) q[4];
cx q[1],q[2];
ry(0.8232393224901647*pi) q[3];
cx q[4],q[5];
cx q[0],q[1];
ry(0.6607990720140589*pi) q[2];
cx q[3],q[4];
ry(3.5011334406214623*pi) q[5];
ry(3.559973821864115*pi) q[0];
ry(0.48663425177379815*pi) q[1];
cx q[2],q[3];
ry(3.4771926071834236*pi) q[4];
cx q[1],q[2];
ry(0.7496737772363379*pi) q[3];
cx q[0],q[1];
ry(3.2004916092192444*pi) q[2];
ry(3.422414261294106*pi) q[0];
ry(0.18840522276191865*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
