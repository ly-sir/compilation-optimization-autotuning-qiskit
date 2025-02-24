// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg meas[4];
ry(2.0368498236902934*pi) q[0];
ry(3.154742953788209*pi) q[1];
ry(1.3689688609711652*pi) q[2];
ry(2.408013303807374*pi) q[3];
cz q[0],q[1];
ry(0.7142862549579845*pi) q[0];
cz q[1],q[2];
ry(2.6849746023078227*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(0.9924569179313286*pi) q[2];
ry(1.2871145209735977*pi) q[3];
ry(3.1325713079846933*pi) q[0];
cz q[1],q[2];
ry(2.2342044125279283*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(1.0892707423885568*pi) q[2];
ry(3.014222542804309*pi) q[3];
ry(0.29461554341530727*pi) q[0];
cz q[1],q[2];
ry(0.8031311734995162*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(1.0818580729235387*pi) q[2];
ry(2.217708595071355*pi) q[3];
ry(2.8307412295823227*pi) q[0];
cz q[1],q[2];
ry(1.6455319377460669*pi) q[1];
cz q[2],q[3];
cz q[0],q[1];
ry(2.801183567936439*pi) q[2];
ry(1.7887096778252243*pi) q[3];
ry(3.0093823757421583*pi) q[0];
cz q[1],q[2];
ry(1.467165271030345*pi) q[1];
cz q[2],q[3];
ry(2.681448449844991*pi) q[2];
ry(1.8057241157112727*pi) q[3];
barrier q[0],q[1],q[2],q[3];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
