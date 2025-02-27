// Benchmark was created by MQT Bench on 2023-06-29
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: v1.0.0
// TKET version: 1.16.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[8];
creg meas[8];
ry(3.805046086926211*pi) q[0];
ry(2.603623877438576*pi) q[1];
ry(2.144982757261155*pi) q[2];
ry(0.5093601694083676*pi) q[3];
ry(2.348641521322618*pi) q[4];
ry(2.064302106668086*pi) q[5];
ry(0.8364479875315423*pi) q[6];
ry(0.59560716125077*pi) q[7];
cz q[0],q[1];
cz q[0],q[2];
cz q[0],q[3];
cz q[1],q[2];
cz q[0],q[4];
cz q[1],q[3];
cz q[0],q[5];
cz q[1],q[4];
cz q[2],q[3];
cz q[0],q[6];
cz q[1],q[5];
cz q[2],q[4];
cz q[0],q[7];
cz q[1],q[6];
cz q[2],q[5];
cz q[3],q[4];
ry(0.7485689620876285*pi) q[0];
cz q[1],q[7];
cz q[2],q[6];
cz q[3],q[5];
ry(3.644331141567796*pi) q[1];
cz q[2],q[7];
cz q[3],q[6];
cz q[4],q[5];
cz q[0],q[1];
ry(2.299548570367516*pi) q[2];
cz q[3],q[7];
cz q[4],q[6];
cz q[0],q[2];
ry(0.8497048261698968*pi) q[3];
cz q[4],q[7];
cz q[5],q[6];
cz q[0],q[3];
cz q[1],q[2];
ry(0.8363560143544405*pi) q[4];
cz q[5],q[7];
cz q[0],q[4];
cz q[1],q[3];
ry(0.039802682498588926*pi) q[5];
cz q[6],q[7];
cz q[0],q[5];
cz q[1],q[4];
cz q[2],q[3];
ry(1.4931672682489114*pi) q[6];
ry(3.5032090200608015*pi) q[7];
cz q[0],q[6];
cz q[1],q[5];
cz q[2],q[4];
cz q[0],q[7];
cz q[1],q[6];
cz q[2],q[5];
cz q[3],q[4];
ry(1.055729740758328*pi) q[0];
cz q[1],q[7];
cz q[2],q[6];
cz q[3],q[5];
ry(0.7460851265281094*pi) q[1];
cz q[2],q[7];
cz q[3],q[6];
cz q[4],q[5];
cz q[0],q[1];
ry(3.472959098252674*pi) q[2];
cz q[3],q[7];
cz q[4],q[6];
cz q[0],q[2];
ry(0.8948720285009721*pi) q[3];
cz q[4],q[7];
cz q[5],q[6];
cz q[0],q[3];
cz q[1],q[2];
ry(0.7521867568522944*pi) q[4];
cz q[5],q[7];
cz q[0],q[4];
cz q[1],q[3];
ry(0.25010846722473373*pi) q[5];
cz q[6],q[7];
cz q[0],q[5];
cz q[1],q[4];
cz q[2],q[3];
ry(1.363722690249593*pi) q[6];
ry(3.7835396840773785*pi) q[7];
cz q[0],q[6];
cz q[1],q[5];
cz q[2],q[4];
cz q[0],q[7];
cz q[1],q[6];
cz q[2],q[5];
cz q[3],q[4];
ry(2.218446173028422*pi) q[0];
cz q[1],q[7];
cz q[2],q[6];
cz q[3],q[5];
ry(3.5073355846792498*pi) q[1];
cz q[2],q[7];
cz q[3],q[6];
cz q[4],q[5];
ry(0.7239399270665106*pi) q[2];
cz q[3],q[7];
cz q[4],q[6];
ry(1.2769862789628992*pi) q[3];
cz q[4],q[7];
cz q[5],q[6];
ry(3.6409870215637037*pi) q[4];
cz q[5],q[7];
ry(0.9918138566075311*pi) q[5];
cz q[6],q[7];
ry(2.0660666780382364*pi) q[6];
ry(2.129095245456928*pi) q[7];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
