// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg coin[1];
qreg node[5];
creg meas[6];
h coin[0];
h node[0];
cu1(0.06249999999999997*pi) node[4],node[0];
cx node[4],node[3];
cu1(1.9375*pi) node[3],node[0];
cx node[4],node[3];
cu1(0.06249999999999997*pi) node[3],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
h node[1];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cu1(0.5*pi) node[4],node[1];
h node[0];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[0];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cu1(1.5*pi) node[4],node[1];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
cu1(0.12499999999999994*pi) coin[0],node[1];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[2];
h node[1];
u1(0.25*pi) node[4];
h node[1];
cx node[3],node[4];
cu1(1.875*pi) node[2],node[1];
u1(1.75*pi) node[4];
cx coin[0],node[2];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.12499999999999994*pi) node[4];
cu1(0.12499999999999994*pi) node[2],node[1];
h node[1];
cx node[2],node[3];
h node[1];
cu1(1.875*pi) node[3],node[1];
cx coin[0],node[3];
h node[1];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
cx node[2],node[3];
h node[1];
h node[2];
cu1(1.875*pi) node[3],node[1];
u1(0.12499999999999994*pi) node[2];
cx coin[0],node[3];
h node[1];
u1(0.12499999999999994*pi) coin[0];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
u1(0.12499999999999994*pi) node[3];
cx coin[0],node[3];
x node[1];
u1(1.875*pi) node[3];
cx coin[0],node[3];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
u1(0.12499999999999994*pi) node[4];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
ccx coin[0],node[4],node[3];
h node[2];
cx coin[0],node[4];
x node[2];
x node[3];
x coin[0];
x node[4];
cu1(0.06249999999999997*pi) node[4],node[0];
cx node[4],node[3];
cu1(1.9375*pi) node[3],node[0];
cx node[4],node[3];
cu1(0.06249999999999997*pi) node[3],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
h node[1];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cu1(0.5*pi) node[4],node[1];
h node[0];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[0];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cu1(1.5*pi) node[4],node[1];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
cu1(0.12499999999999994*pi) coin[0],node[1];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[2];
h node[1];
u1(0.25*pi) node[4];
h node[1];
cx node[3],node[4];
cu1(1.875*pi) node[2],node[1];
u1(1.75*pi) node[4];
cx coin[0],node[2];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.12499999999999994*pi) node[4];
cu1(0.12499999999999994*pi) node[2],node[1];
h node[1];
cx node[2],node[3];
h node[1];
cu1(1.875*pi) node[3],node[1];
cx coin[0],node[3];
h node[1];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
cx node[2],node[3];
h node[1];
h node[2];
cu1(1.875*pi) node[3],node[1];
u1(0.12499999999999994*pi) node[2];
cx coin[0],node[3];
h node[1];
u1(0.12499999999999994*pi) coin[0];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
u1(0.12499999999999994*pi) node[3];
cx coin[0],node[3];
x node[1];
u1(1.875*pi) node[3];
cx coin[0],node[3];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
u1(0.12499999999999994*pi) node[4];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
ccx coin[0],node[4],node[3];
h node[2];
cx coin[0],node[4];
x node[2];
x node[3];
x coin[0];
x node[4];
h coin[0];
cu1(0.06249999999999997*pi) node[4],node[0];
cx node[4],node[3];
cu1(1.9375*pi) node[3],node[0];
cx node[4],node[3];
cu1(0.06249999999999997*pi) node[3],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
h node[1];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cu1(0.5*pi) node[4],node[1];
h node[0];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[0];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cu1(1.5*pi) node[4],node[1];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
cu1(0.12499999999999994*pi) coin[0],node[1];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[2];
h node[1];
u1(0.25*pi) node[4];
h node[1];
cx node[3],node[4];
cu1(1.875*pi) node[2],node[1];
u1(1.75*pi) node[4];
cx coin[0],node[2];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.12499999999999994*pi) node[4];
cu1(0.12499999999999994*pi) node[2],node[1];
h node[1];
cx node[2],node[3];
h node[1];
cu1(1.875*pi) node[3],node[1];
cx coin[0],node[3];
h node[1];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
cx node[2],node[3];
h node[1];
h node[2];
cu1(1.875*pi) node[3],node[1];
u1(0.12499999999999994*pi) node[2];
cx coin[0],node[3];
h node[1];
u1(0.12499999999999994*pi) coin[0];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
u1(0.12499999999999994*pi) node[3];
cx coin[0],node[3];
x node[1];
u1(1.875*pi) node[3];
cx coin[0],node[3];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
u1(0.12499999999999994*pi) node[4];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
ccx coin[0],node[4],node[3];
h node[2];
cx coin[0],node[4];
x node[2];
x node[3];
x coin[0];
x node[4];
cu1(0.06249999999999997*pi) node[4],node[0];
cx node[4],node[3];
cu1(1.9375*pi) node[3],node[0];
cx node[4],node[3];
cu1(0.06249999999999997*pi) node[3],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
h node[1];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cu1(0.5*pi) node[4],node[1];
h node[0];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[0];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cu1(1.5*pi) node[4],node[1];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
cu1(0.12499999999999994*pi) coin[0],node[1];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[2];
h node[1];
u1(0.25*pi) node[4];
h node[1];
cx node[3],node[4];
cu1(1.875*pi) node[2],node[1];
u1(1.75*pi) node[4];
cx coin[0],node[2];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.12499999999999994*pi) node[4];
cu1(0.12499999999999994*pi) node[2],node[1];
h node[1];
cx node[2],node[3];
h node[1];
cu1(1.875*pi) node[3],node[1];
cx coin[0],node[3];
h node[1];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
cx node[2],node[3];
h node[1];
h node[2];
cu1(1.875*pi) node[3],node[1];
u1(0.12499999999999994*pi) node[2];
cx coin[0],node[3];
h node[1];
u1(0.12499999999999994*pi) coin[0];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
u1(0.12499999999999994*pi) node[3];
cx coin[0],node[3];
x node[1];
u1(1.875*pi) node[3];
cx coin[0],node[3];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
u1(0.12499999999999994*pi) node[4];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
ccx coin[0],node[4],node[3];
h node[2];
cx coin[0],node[4];
x node[2];
x node[3];
x coin[0];
x node[4];
h coin[0];
cu1(0.06249999999999997*pi) node[4],node[0];
cx node[4],node[3];
cu1(1.9375*pi) node[3],node[0];
cx node[4],node[3];
cu1(0.06249999999999997*pi) node[3],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
h node[1];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cu1(0.5*pi) node[4],node[1];
h node[0];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[0];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cu1(1.5*pi) node[4],node[1];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
cu1(0.12499999999999994*pi) coin[0],node[1];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[2];
h node[1];
u1(0.25*pi) node[4];
h node[1];
cx node[3],node[4];
cu1(1.875*pi) node[2],node[1];
u1(1.75*pi) node[4];
cx coin[0],node[2];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.12499999999999994*pi) node[4];
cu1(0.12499999999999994*pi) node[2],node[1];
h node[1];
cx node[2],node[3];
h node[1];
cu1(1.875*pi) node[3],node[1];
cx coin[0],node[3];
h node[1];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
cx node[2],node[3];
h node[1];
h node[2];
cu1(1.875*pi) node[3],node[1];
u1(0.12499999999999994*pi) node[2];
cx coin[0],node[3];
h node[1];
u1(0.12499999999999994*pi) coin[0];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
u1(0.12499999999999994*pi) node[3];
cx coin[0],node[3];
x node[1];
u1(1.875*pi) node[3];
cx coin[0],node[3];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
u1(0.12499999999999994*pi) node[4];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
ccx coin[0],node[4],node[3];
h node[2];
cx coin[0],node[4];
x node[2];
x node[3];
x coin[0];
x node[4];
cu1(0.06249999999999997*pi) node[4],node[0];
cx node[4],node[3];
cu1(1.9375*pi) node[3],node[0];
cx node[4],node[3];
cu1(0.06249999999999997*pi) node[3],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[3],node[2];
cu1(1.9375*pi) node[2],node[0];
cx node[4],node[2];
cu1(0.06249999999999997*pi) node[2],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[2],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[3],node[1];
cu1(1.9375*pi) node[1],node[0];
cx node[4],node[1];
cu1(0.06249999999999997*pi) node[1],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[1],coin[0];
cu1(1.9375*pi) coin[0],node[0];
h node[1];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[2],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cx node[3],coin[0];
cu1(1.9375*pi) coin[0],node[0];
cx node[4],coin[0];
cu1(0.06249999999999997*pi) coin[0],node[0];
cu1(0.5*pi) node[4],node[1];
h node[0];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
cu1(1.5*pi) node[4],node[1];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.25*pi) node[4];
cx node[3],node[4];
u1(1.75*pi) node[4];
u2(0.0*pi,1.0*pi) node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
u1(0.25*pi) node[4];
cx node[2],node[4];
u1(1.75*pi) node[4];
cx coin[0],node[4];
cu1(0.12499999999999994*pi) coin[0],node[1];
u2(0.0*pi,1.0*pi) node[4];
cx coin[0],node[2];
h node[1];
u1(0.25*pi) node[4];
h node[1];
cx node[3],node[4];
cu1(1.875*pi) node[2],node[1];
u1(1.75*pi) node[4];
cx coin[0],node[2];
h node[1];
u2(0.0*pi,1.0*pi) node[4];
h node[1];
u1(0.12499999999999994*pi) node[4];
cu1(0.12499999999999994*pi) node[2],node[1];
h node[1];
cx node[2],node[3];
h node[1];
cu1(1.875*pi) node[3],node[1];
cx coin[0],node[3];
h node[1];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
cx node[2],node[3];
h node[1];
h node[2];
cu1(1.875*pi) node[3],node[1];
u1(0.12499999999999994*pi) node[2];
cx coin[0],node[3];
h node[1];
u1(0.12499999999999994*pi) coin[0];
h node[1];
cu1(0.12499999999999994*pi) node[3],node[1];
h node[1];
u1(0.12499999999999994*pi) node[3];
cx coin[0],node[3];
x node[1];
u1(1.875*pi) node[3];
cx coin[0],node[3];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
u1(0.12499999999999994*pi) node[4];
cx node[3],node[4];
u1(1.875*pi) node[4];
cx coin[0],node[4];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx node[3],node[2];
u1(0.12499999999999994*pi) node[2];
cx node[4],node[2];
u1(1.875*pi) node[2];
cx coin[0],node[2];
ccx coin[0],node[4],node[3];
h node[2];
cx coin[0],node[4];
x node[2];
x node[3];
x coin[0];
x node[4];
barrier node[0],node[1],node[2],node[3],node[4],coin[0];
measure coin[0] -> meas[5];
measure node[0] -> meas[0];
measure node[1] -> meas[1];
measure node[2] -> meas[2];
measure node[3] -> meas[3];
measure node[4] -> meas[4];
