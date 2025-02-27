// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg meas[9];
ry(0.5300824855541897*pi) q[0];
ry(0.5346025235087456*pi) q[1];
ry(0.5281838926074929*pi) q[2];
ry(0.48185297491282886*pi) q[3];
ry(0.3749999999999992*pi) q[4];
x q[5];
cx q[3],q[2];
ry(0.29569285827881053*pi) q[2];
cx q[3],q[2];
cx q[2],q[1];
ry(0.09085431366891114*pi) q[1];
cx q[3],q[1];
ry(0.04186283938875178*pi) q[1];
cx q[2],q[1];
ry(0.1881587025878101*pi) q[1];
cx q[3],q[1];
cx q[1],q[0];
ry(0.0296415333910364*pi) q[0];
cx q[2],q[0];
ry(0.007410268398399478*pi) q[0];
cx q[1],q[0];
ry(0.059418329391464075*pi) q[0];
cx q[3],q[0];
ry(0.032264192013762585*pi) q[0];
cx q[1],q[0];
ry(0.003207735119781107*pi) q[0];
cx q[2],q[0];
ry(0.015700423609464685*pi) q[0];
cx q[1],q[0];
ry(0.1109910759898897*pi) q[0];
cx q[3],q[0];
cry(0.0*pi) q[0],q[4];
cx q[0],q[6];
cry(0.0*pi) q[1],q[4];
ccx q[1],q[6],q[7];
cry(0.0*pi) q[2],q[4];
ccx q[2],q[7],q[8];
cry(0.0*pi) q[3],q[4];
x q[3];
u1(0.0*pi) q[4];
x q[8];
ccx q[3],q[8],q[5];
x q[3];
u1(0.0*pi) q[5];
x q[8];
ccx q[2],q[7],q[8];
cx q[5],q[4];
ccx q[1],q[6],q[7];
u3(0.09366343673910417*pi,0.0*pi,0.0*pi) q[4];
cx q[0],q[6];
cx q[5],q[4];
u3(3.9063365632608957*pi,0.0*pi,0.0*pi) q[4];
u1(0.0*pi) q[5];
u1(0.0*pi) q[4];
cx q[5],q[4];
u3(3.992711218775363*pi,0.0*pi,0.0*pi) q[4];
cx q[5],q[4];
u3(0.007288781224636804*pi,0.0*pi,0.0*pi) q[4];
ccx q[5],q[0],q[4];
u1(0.0*pi) q[4];
u1(0.0*pi) q[5];
cx q[5],q[4];
u3(0.007288781224636804*pi,0.0*pi,0.0*pi) q[4];
cx q[5],q[4];
u3(3.992711218775363*pi,0.0*pi,0.0*pi) q[4];
ccx q[5],q[0],q[4];
cx q[0],q[6];
u1(0.0*pi) q[4];
u1(0.0*pi) q[5];
cx q[5],q[4];
u3(3.9854224375507266*pi,0.0*pi,0.0*pi) q[4];
cx q[5],q[4];
u3(0.014577562449273608*pi,0.0*pi,0.0*pi) q[4];
ccx q[5],q[1],q[4];
u1(0.0*pi) q[4];
u1(0.0*pi) q[5];
cx q[5],q[4];
u3(0.014577562449273608*pi,0.0*pi,0.0*pi) q[4];
cx q[5],q[4];
u3(3.9854224375507266*pi,0.0*pi,0.0*pi) q[4];
ccx q[5],q[1],q[4];
ccx q[1],q[6],q[7];
u1(0.0*pi) q[4];
u1(0.0*pi) q[5];
cx q[5],q[4];
u3(3.9708448751014527*pi,0.0*pi,0.0*pi) q[4];
cx q[5],q[4];
u3(0.029155124898547248*pi,0.0*pi,0.0*pi) q[4];
ccx q[5],q[2],q[4];
u1(0.0*pi) q[4];
u1(0.0*pi) q[5];
cx q[5],q[4];
u3(0.029155124898547248*pi,0.0*pi,0.0*pi) q[4];
cx q[5],q[4];
u3(3.9708448751014527*pi,0.0*pi,0.0*pi) q[4];
ccx q[5],q[2],q[4];
ccx q[2],q[7],q[8];
u1(0.0*pi) q[4];
u1(0.0*pi) q[5];
cx q[5],q[4];
x q[8];
u3(3.9416897502029054*pi,0.0*pi,0.0*pi) q[4];
cx q[5],q[4];
u3(0.058310249797094565*pi,0.0*pi,0.0*pi) q[4];
ccx q[5],q[3],q[4];
u1(0.0*pi) q[4];
u1(0.0*pi) q[5];
cx q[5],q[4];
u3(0.058310249797094565*pi,0.0*pi,0.0*pi) q[4];
cx q[5],q[4];
u3(3.9416897502029054*pi,0.0*pi,0.0*pi) q[4];
ccx q[5],q[3],q[4];
x q[3];
ccx q[3],q[8],q[5];
x q[3];
x q[5];
x q[8];
ccx q[2],q[7],q[8];
ccx q[1],q[6],q[7];
cx q[0],q[6];
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
