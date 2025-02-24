// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[10];
creg meas[10];
ry(0.005125036852635328*pi) q[0];
ry(0.15656855624641255*pi) q[1];
ry(3.051261241916267*pi) q[2];
ry(0.9898971096788802*pi) q[3];
ry(3.989518130372065*pi) q[4];
ry(0.5245388295276455*pi) q[5];
ry(0.1298454731064728*pi) q[6];
ry(3.000423898147483*pi) q[7];
ry(3.384498143507744*pi) q[8];
ry(0.5797836870707336*pi) q[9];
cx q[8],q[9];
cx q[7],q[8];
ry(0.02876547141579272*pi) q[9];
cx q[6],q[7];
ry(0.8812830906234059*pi) q[8];
cx q[5],q[6];
ry(0.5001598889311093*pi) q[7];
cx q[8],q[9];
cx q[4],q[5];
ry(0.5000820430073737*pi) q[6];
cx q[7],q[8];
ry(0.42546624628170504*pi) q[9];
cx q[3],q[4];
ry(0.5001839937465136*pi) q[5];
cx q[6],q[7];
ry(0.5001800390008065*pi) q[8];
cx q[2],q[3];
ry(0.4998052399144914*pi) q[4];
cx q[5],q[6];
ry(3.9365486011682638*pi) q[7];
cx q[1],q[2];
ry(0.49675945572733193*pi) q[3];
cx q[4],q[5];
ry(0.97552716499182*pi) q[6];
cx q[0],q[1];
ry(3.4797606115546973*pi) q[2];
cx q[3],q[4];
ry(0.5104944370589455*pi) q[5];
ry(0.9563861821071079*pi) q[0];
ry(0.5423258772717788*pi) q[1];
cx q[2],q[3];
ry(1.0*pi) q[4];
cx q[1],q[2];
ry(3.5513431913273688*pi) q[3];
cx q[0],q[1];
ry(3.3421386410760054*pi) q[2];
ry(3.043960003436138*pi) q[0];
ry(0.5378588448545065*pi) q[1];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
