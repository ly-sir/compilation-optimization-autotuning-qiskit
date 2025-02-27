// Benchmark was created by MQT Bench on 2024-03-17
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg eval[25];
qreg q[1];
creg meas[26];
h eval[0];
h eval[1];
h eval[2];
h eval[3];
h eval[4];
h eval[5];
h eval[6];
h eval[7];
h eval[8];
h eval[9];
h eval[10];
h eval[11];
h eval[12];
h eval[13];
h eval[14];
h eval[15];
h eval[16];
h eval[17];
h eval[18];
h eval[19];
h eval[20];
h eval[21];
h eval[22];
h eval[23];
h eval[24];
ry(0.29516723530086647*pi) q[0];
u1(0.0*pi) eval[0];
u1(0.0*pi) eval[1];
u1(0.0*pi) eval[2];
u1(0.0*pi) eval[3];
u1(0.0*pi) eval[4];
u1(0.0*pi) eval[5];
u1(0.0*pi) eval[6];
u1(0.0*pi) eval[7];
u1(0.0*pi) eval[8];
u1(0.0*pi) eval[9];
u1(0.0*pi) eval[10];
u1(0.0*pi) eval[11];
u1(0.0*pi) eval[12];
u1(0.0*pi) eval[13];
u1(0.0*pi) eval[14];
u1(0.0*pi) eval[15];
u1(0.0*pi) eval[16];
u1(0.0*pi) eval[17];
u1(0.0*pi) eval[18];
u1(0.0*pi) eval[19];
u1(0.0*pi) eval[20];
u1(0.0*pi) eval[21];
u1(0.0*pi) eval[22];
u1(0.0*pi) eval[23];
u1(0.0*pi) eval[24];
u1(0.0*pi) q[0];
cx eval[0],q[0];
u3(3.7048327646991335*pi,0.0*pi,0.0*pi) q[0];
cx eval[0],q[0];
u3(0.29516723530086647*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[1],q[0];
u3(3.4096655293982683*pi,0.0*pi,0.0*pi) q[0];
cx eval[1],q[0];
u3(0.5903344706017317*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[2],q[0];
u3(2.8193310587965335*pi,0.0*pi,0.0*pi) q[0];
cx eval[2],q[0];
u3(1.1806689412034665*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[3],q[0];
u3(1.638662117593067*pi,0.0*pi,0.0*pi) q[0];
cx eval[3],q[0];
u3(2.361337882406933*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[4],q[0];
u3(3.277324235186134*pi,0.0*pi,0.0*pi) q[0];
cx eval[4],q[0];
u3(0.7226757648138662*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[5],q[0];
u3(2.5546484703722676*pi,0.0*pi,0.0*pi) q[0];
cx eval[5],q[0];
u3(1.4453515296277324*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[6],q[0];
u3(1.1092969407445352*pi,0.0*pi,0.0*pi) q[0];
cx eval[6],q[0];
u3(2.890703059255465*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[7],q[0];
u3(2.2185938814891912*pi,0.0*pi,0.0*pi) q[0];
cx eval[7],q[0];
u3(1.7814061185108088*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[8],q[0];
u3(0.4371877629780698*pi,0.0*pi,0.0*pi) q[0];
cx eval[8],q[0];
u3(3.56281223702193*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[9],q[0];
u3(0.8743755259564807*pi,0.0*pi,0.0*pi) q[0];
cx eval[9],q[0];
u3(3.1256244740435193*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[10],q[0];
u3(1.7487510519126204*pi,0.0*pi,0.0*pi) q[0];
cx eval[10],q[0];
u3(2.2512489480873796*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[11],q[0];
u3(3.497502103825923*pi,0.0*pi,0.0*pi) q[0];
cx eval[11],q[0];
u3(0.5024978961740771*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[12],q[0];
u3(2.9950042076518457*pi,0.0*pi,0.0*pi) q[0];
cx eval[12],q[0];
u3(1.0049957923481543*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[13],q[0];
u3(1.9900084153005082*pi,0.0*pi,0.0*pi) q[0];
cx eval[13],q[0];
u3(2.009991584699492*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[14],q[0];
u3(3.980016830607383*pi,0.0*pi,0.0*pi) q[0];
cx eval[14],q[0];
u3(0.01998316939261713*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[15],q[0];
u3(3.9600336612147657*pi,0.0*pi,0.0*pi) q[0];
cx eval[15],q[0];
u3(0.03996633878523426*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[16],q[0];
u3(3.9200673223967897*pi,0.0*pi,0.0*pi) q[0];
cx eval[16],q[0];
u3(0.07993267760321032*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[17],q[0];
u3(3.8401346449172706*pi,0.0*pi,0.0*pi) q[0];
cx eval[17],q[0];
u3(0.15986535508272937*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[18],q[0];
u3(3.680269289514399*pi,0.0*pi,0.0*pi) q[0];
cx eval[18],q[0];
u3(0.31973071048560087*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[19],q[0];
u3(3.3605385793489404*pi,0.0*pi,0.0*pi) q[0];
cx eval[19],q[0];
u3(0.6394614206510596*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[20],q[0];
u3(2.7210771584068425*pi,0.0*pi,0.0*pi) q[0];
cx eval[20],q[0];
u3(1.2789228415931575*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[21],q[0];
u3(1.442154316115193*pi,0.0*pi,0.0*pi) q[0];
cx eval[21],q[0];
u3(2.557845683884807*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[22],q[0];
u3(2.884308635490015*pi,0.0*pi,0.0*pi) q[0];
cx eval[22],q[0];
u3(1.1156913645099849*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[23],q[0];
u3(1.7686172677204013*pi,0.0*pi,0.0*pi) q[0];
cx eval[23],q[0];
u3(2.2313827322795987*pi,0.0*pi,0.0*pi) q[0];
u1(0.0*pi) q[0];
cx eval[24],q[0];
u3(3.5372345484793186*pi,0.0*pi,0.0*pi) q[0];
cx eval[24],q[0];
h eval[24];
u3(0.4627654515206814*pi,0.0*pi,0.0*pi) q[0];
cu1(1.5*pi) eval[23],eval[24];
cu1(1.75*pi) eval[22],eval[24];
h eval[23];
cu1(1.875*pi) eval[21],eval[24];
cu1(1.5*pi) eval[22],eval[23];
cu1(1.9375*pi) eval[20],eval[24];
cu1(1.75*pi) eval[21],eval[23];
h eval[22];
cu1(1.96875*pi) eval[19],eval[24];
cu1(1.875*pi) eval[20],eval[23];
cu1(1.5*pi) eval[21],eval[22];
cu1(1.984375*pi) eval[18],eval[24];
cu1(1.9375*pi) eval[19],eval[23];
cu1(1.75*pi) eval[20],eval[22];
h eval[21];
cu1(1.9921875*pi) eval[17],eval[24];
cu1(1.96875*pi) eval[18],eval[23];
cu1(1.875*pi) eval[19],eval[22];
cu1(1.5*pi) eval[20],eval[21];
cu1(1.99609375*pi) eval[16],eval[24];
cu1(1.984375*pi) eval[17],eval[23];
cu1(1.9375*pi) eval[18],eval[22];
cu1(1.75*pi) eval[19],eval[21];
h eval[20];
cu1(1.998046875*pi) eval[15],eval[24];
cu1(1.9921875*pi) eval[16],eval[23];
cu1(1.96875*pi) eval[17],eval[22];
cu1(1.875*pi) eval[18],eval[21];
cu1(1.5*pi) eval[19],eval[20];
cu1(1.9990234375*pi) eval[14],eval[24];
cu1(1.99609375*pi) eval[15],eval[23];
cu1(1.984375*pi) eval[16],eval[22];
cu1(1.9375*pi) eval[17],eval[21];
cu1(1.75*pi) eval[18],eval[20];
h eval[19];
cu1(1.99951171875*pi) eval[13],eval[24];
cu1(1.998046875*pi) eval[14],eval[23];
cu1(1.9921875*pi) eval[15],eval[22];
cu1(1.96875*pi) eval[16],eval[21];
cu1(1.875*pi) eval[17],eval[20];
cu1(1.5*pi) eval[18],eval[19];
cu1(1.999755859375*pi) eval[12],eval[24];
cu1(1.9990234375*pi) eval[13],eval[23];
cu1(1.99609375*pi) eval[14],eval[22];
cu1(1.984375*pi) eval[15],eval[21];
cu1(1.9375*pi) eval[16],eval[20];
cu1(1.75*pi) eval[17],eval[19];
h eval[18];
cu1(1.9998779296875*pi) eval[11],eval[24];
cu1(1.99951171875*pi) eval[12],eval[23];
cu1(1.998046875*pi) eval[13],eval[22];
cu1(1.9921875*pi) eval[14],eval[21];
cu1(1.96875*pi) eval[15],eval[20];
cu1(1.875*pi) eval[16],eval[19];
cu1(1.5*pi) eval[17],eval[18];
cu1(1.99993896484375*pi) eval[10],eval[24];
cu1(1.999755859375*pi) eval[11],eval[23];
cu1(1.9990234375*pi) eval[12],eval[22];
cu1(1.99609375*pi) eval[13],eval[21];
cu1(1.984375*pi) eval[14],eval[20];
cu1(1.9375*pi) eval[15],eval[19];
cu1(1.75*pi) eval[16],eval[18];
h eval[17];
cu1(1.999969482421875*pi) eval[9],eval[24];
cu1(1.9998779296875*pi) eval[10],eval[23];
cu1(1.99951171875*pi) eval[11],eval[22];
cu1(1.998046875*pi) eval[12],eval[21];
cu1(1.9921875*pi) eval[13],eval[20];
cu1(1.96875*pi) eval[14],eval[19];
cu1(1.875*pi) eval[15],eval[18];
cu1(1.5*pi) eval[16],eval[17];
cu1(1.9999847412109375*pi) eval[8],eval[24];
cu1(1.99993896484375*pi) eval[9],eval[23];
cu1(1.999755859375*pi) eval[10],eval[22];
cu1(1.9990234375*pi) eval[11],eval[21];
cu1(1.99609375*pi) eval[12],eval[20];
cu1(1.984375*pi) eval[13],eval[19];
cu1(1.9375*pi) eval[14],eval[18];
cu1(1.75*pi) eval[15],eval[17];
h eval[16];
cu1(1.9999923706054688*pi) eval[7],eval[24];
cu1(1.999969482421875*pi) eval[8],eval[23];
cu1(1.9998779296875*pi) eval[9],eval[22];
cu1(1.99951171875*pi) eval[10],eval[21];
cu1(1.998046875*pi) eval[11],eval[20];
cu1(1.9921875*pi) eval[12],eval[19];
cu1(1.96875*pi) eval[13],eval[18];
cu1(1.875*pi) eval[14],eval[17];
cu1(1.5*pi) eval[15],eval[16];
cu1(1.9999961853027344*pi) eval[6],eval[24];
cu1(1.9999847412109375*pi) eval[7],eval[23];
cu1(1.99993896484375*pi) eval[8],eval[22];
cu1(1.999755859375*pi) eval[9],eval[21];
cu1(1.9990234375*pi) eval[10],eval[20];
cu1(1.99609375*pi) eval[11],eval[19];
cu1(1.984375*pi) eval[12],eval[18];
cu1(1.9375*pi) eval[13],eval[17];
cu1(1.75*pi) eval[14],eval[16];
h eval[15];
cu1(1.9999980926513672*pi) eval[5],eval[24];
cu1(1.9999923706054688*pi) eval[6],eval[23];
cu1(1.999969482421875*pi) eval[7],eval[22];
cu1(1.9998779296875*pi) eval[8],eval[21];
cu1(1.99951171875*pi) eval[9],eval[20];
cu1(1.998046875*pi) eval[10],eval[19];
cu1(1.9921875*pi) eval[11],eval[18];
cu1(1.96875*pi) eval[12],eval[17];
cu1(1.875*pi) eval[13],eval[16];
cu1(1.5*pi) eval[14],eval[15];
cu1(1.9999990463256836*pi) eval[4],eval[24];
cu1(1.9999961853027344*pi) eval[5],eval[23];
cu1(1.9999847412109375*pi) eval[6],eval[22];
cu1(1.99993896484375*pi) eval[7],eval[21];
cu1(1.999755859375*pi) eval[8],eval[20];
cu1(1.9990234375*pi) eval[9],eval[19];
cu1(1.99609375*pi) eval[10],eval[18];
cu1(1.984375*pi) eval[11],eval[17];
cu1(1.9375*pi) eval[12],eval[16];
cu1(1.75*pi) eval[13],eval[15];
h eval[14];
cu1(1.9999995231628418*pi) eval[3],eval[24];
cu1(1.9999980926513672*pi) eval[4],eval[23];
cu1(1.9999923706054688*pi) eval[5],eval[22];
cu1(1.999969482421875*pi) eval[6],eval[21];
cu1(1.9998779296875*pi) eval[7],eval[20];
cu1(1.99951171875*pi) eval[8],eval[19];
cu1(1.998046875*pi) eval[9],eval[18];
cu1(1.9921875*pi) eval[10],eval[17];
cu1(1.96875*pi) eval[11],eval[16];
cu1(1.875*pi) eval[12],eval[15];
cu1(1.5*pi) eval[13],eval[14];
cu1(1.999999761581421*pi) eval[2],eval[24];
cu1(1.9999990463256836*pi) eval[3],eval[23];
cu1(1.9999961853027344*pi) eval[4],eval[22];
cu1(1.9999847412109375*pi) eval[5],eval[21];
cu1(1.99993896484375*pi) eval[6],eval[20];
cu1(1.999755859375*pi) eval[7],eval[19];
cu1(1.9990234375*pi) eval[8],eval[18];
cu1(1.99609375*pi) eval[9],eval[17];
cu1(1.984375*pi) eval[10],eval[16];
cu1(1.9375*pi) eval[11],eval[15];
cu1(1.75*pi) eval[12],eval[14];
h eval[13];
cu1(1.9999998807907104*pi) eval[1],eval[24];
cu1(1.9999995231628418*pi) eval[2],eval[23];
cu1(1.9999980926513672*pi) eval[3],eval[22];
cu1(1.9999923706054688*pi) eval[4],eval[21];
cu1(1.999969482421875*pi) eval[5],eval[20];
cu1(1.9998779296875*pi) eval[6],eval[19];
cu1(1.99951171875*pi) eval[7],eval[18];
cu1(1.998046875*pi) eval[8],eval[17];
cu1(1.9921875*pi) eval[9],eval[16];
cu1(1.96875*pi) eval[10],eval[15];
cu1(1.875*pi) eval[11],eval[14];
cu1(1.5*pi) eval[12],eval[13];
cu1(1.9999999403953552*pi) eval[0],eval[24];
cu1(1.999999761581421*pi) eval[1],eval[23];
cu1(1.9999990463256836*pi) eval[2],eval[22];
cu1(1.9999961853027344*pi) eval[3],eval[21];
cu1(1.9999847412109375*pi) eval[4],eval[20];
cu1(1.99993896484375*pi) eval[5],eval[19];
cu1(1.999755859375*pi) eval[6],eval[18];
cu1(1.9990234375*pi) eval[7],eval[17];
cu1(1.99609375*pi) eval[8],eval[16];
cu1(1.984375*pi) eval[9],eval[15];
cu1(1.9375*pi) eval[10],eval[14];
cu1(1.75*pi) eval[11],eval[13];
h eval[12];
cu1(1.9999998807907104*pi) eval[0],eval[23];
cu1(1.9999995231628418*pi) eval[1],eval[22];
cu1(1.9999980926513672*pi) eval[2],eval[21];
cu1(1.9999923706054688*pi) eval[3],eval[20];
cu1(1.999969482421875*pi) eval[4],eval[19];
cu1(1.9998779296875*pi) eval[5],eval[18];
cu1(1.99951171875*pi) eval[6],eval[17];
cu1(1.998046875*pi) eval[7],eval[16];
cu1(1.9921875*pi) eval[8],eval[15];
cu1(1.96875*pi) eval[9],eval[14];
cu1(1.875*pi) eval[10],eval[13];
cu1(1.5*pi) eval[11],eval[12];
cu1(1.999999761581421*pi) eval[0],eval[22];
cu1(1.9999990463256836*pi) eval[1],eval[21];
cu1(1.9999961853027344*pi) eval[2],eval[20];
cu1(1.9999847412109375*pi) eval[3],eval[19];
cu1(1.99993896484375*pi) eval[4],eval[18];
cu1(1.999755859375*pi) eval[5],eval[17];
cu1(1.9990234375*pi) eval[6],eval[16];
cu1(1.99609375*pi) eval[7],eval[15];
cu1(1.984375*pi) eval[8],eval[14];
cu1(1.9375*pi) eval[9],eval[13];
cu1(1.75*pi) eval[10],eval[12];
h eval[11];
cu1(1.9999995231628418*pi) eval[0],eval[21];
cu1(1.9999980926513672*pi) eval[1],eval[20];
cu1(1.9999923706054688*pi) eval[2],eval[19];
cu1(1.999969482421875*pi) eval[3],eval[18];
cu1(1.9998779296875*pi) eval[4],eval[17];
cu1(1.99951171875*pi) eval[5],eval[16];
cu1(1.998046875*pi) eval[6],eval[15];
cu1(1.9921875*pi) eval[7],eval[14];
cu1(1.96875*pi) eval[8],eval[13];
cu1(1.875*pi) eval[9],eval[12];
cu1(1.5*pi) eval[10],eval[11];
cu1(1.9999990463256836*pi) eval[0],eval[20];
cu1(1.9999961853027344*pi) eval[1],eval[19];
cu1(1.9999847412109375*pi) eval[2],eval[18];
cu1(1.99993896484375*pi) eval[3],eval[17];
cu1(1.999755859375*pi) eval[4],eval[16];
cu1(1.9990234375*pi) eval[5],eval[15];
cu1(1.99609375*pi) eval[6],eval[14];
cu1(1.984375*pi) eval[7],eval[13];
cu1(1.9375*pi) eval[8],eval[12];
cu1(1.75*pi) eval[9],eval[11];
h eval[10];
cu1(1.9999980926513672*pi) eval[0],eval[19];
cu1(1.9999923706054688*pi) eval[1],eval[18];
cu1(1.999969482421875*pi) eval[2],eval[17];
cu1(1.9998779296875*pi) eval[3],eval[16];
cu1(1.99951171875*pi) eval[4],eval[15];
cu1(1.998046875*pi) eval[5],eval[14];
cu1(1.9921875*pi) eval[6],eval[13];
cu1(1.96875*pi) eval[7],eval[12];
cu1(1.875*pi) eval[8],eval[11];
cu1(1.5*pi) eval[9],eval[10];
cu1(1.9999961853027344*pi) eval[0],eval[18];
cu1(1.9999847412109375*pi) eval[1],eval[17];
cu1(1.99993896484375*pi) eval[2],eval[16];
cu1(1.999755859375*pi) eval[3],eval[15];
cu1(1.9990234375*pi) eval[4],eval[14];
cu1(1.99609375*pi) eval[5],eval[13];
cu1(1.984375*pi) eval[6],eval[12];
cu1(1.9375*pi) eval[7],eval[11];
cu1(1.75*pi) eval[8],eval[10];
h eval[9];
cu1(1.9999923706054688*pi) eval[0],eval[17];
cu1(1.999969482421875*pi) eval[1],eval[16];
cu1(1.9998779296875*pi) eval[2],eval[15];
cu1(1.99951171875*pi) eval[3],eval[14];
cu1(1.998046875*pi) eval[4],eval[13];
cu1(1.9921875*pi) eval[5],eval[12];
cu1(1.96875*pi) eval[6],eval[11];
cu1(1.875*pi) eval[7],eval[10];
cu1(1.5*pi) eval[8],eval[9];
cu1(1.9999847412109375*pi) eval[0],eval[16];
cu1(1.99993896484375*pi) eval[1],eval[15];
cu1(1.999755859375*pi) eval[2],eval[14];
cu1(1.9990234375*pi) eval[3],eval[13];
cu1(1.99609375*pi) eval[4],eval[12];
cu1(1.984375*pi) eval[5],eval[11];
cu1(1.9375*pi) eval[6],eval[10];
cu1(1.75*pi) eval[7],eval[9];
h eval[8];
cu1(1.999969482421875*pi) eval[0],eval[15];
cu1(1.9998779296875*pi) eval[1],eval[14];
cu1(1.99951171875*pi) eval[2],eval[13];
cu1(1.998046875*pi) eval[3],eval[12];
cu1(1.9921875*pi) eval[4],eval[11];
cu1(1.96875*pi) eval[5],eval[10];
cu1(1.875*pi) eval[6],eval[9];
cu1(1.5*pi) eval[7],eval[8];
cu1(1.99993896484375*pi) eval[0],eval[14];
cu1(1.999755859375*pi) eval[1],eval[13];
cu1(1.9990234375*pi) eval[2],eval[12];
cu1(1.99609375*pi) eval[3],eval[11];
cu1(1.984375*pi) eval[4],eval[10];
cu1(1.9375*pi) eval[5],eval[9];
cu1(1.75*pi) eval[6],eval[8];
h eval[7];
cu1(1.9998779296875*pi) eval[0],eval[13];
cu1(1.99951171875*pi) eval[1],eval[12];
cu1(1.998046875*pi) eval[2],eval[11];
cu1(1.9921875*pi) eval[3],eval[10];
cu1(1.96875*pi) eval[4],eval[9];
cu1(1.875*pi) eval[5],eval[8];
cu1(1.5*pi) eval[6],eval[7];
cu1(1.999755859375*pi) eval[0],eval[12];
cu1(1.9990234375*pi) eval[1],eval[11];
cu1(1.99609375*pi) eval[2],eval[10];
cu1(1.984375*pi) eval[3],eval[9];
cu1(1.9375*pi) eval[4],eval[8];
cu1(1.75*pi) eval[5],eval[7];
h eval[6];
cu1(1.99951171875*pi) eval[0],eval[11];
cu1(1.998046875*pi) eval[1],eval[10];
cu1(1.9921875*pi) eval[2],eval[9];
cu1(1.96875*pi) eval[3],eval[8];
cu1(1.875*pi) eval[4],eval[7];
cu1(1.5*pi) eval[5],eval[6];
cu1(1.9990234375*pi) eval[0],eval[10];
cu1(1.99609375*pi) eval[1],eval[9];
cu1(1.984375*pi) eval[2],eval[8];
cu1(1.9375*pi) eval[3],eval[7];
cu1(1.75*pi) eval[4],eval[6];
h eval[5];
cu1(1.998046875*pi) eval[0],eval[9];
cu1(1.9921875*pi) eval[1],eval[8];
cu1(1.96875*pi) eval[2],eval[7];
cu1(1.875*pi) eval[3],eval[6];
cu1(1.5*pi) eval[4],eval[5];
cu1(1.99609375*pi) eval[0],eval[8];
cu1(1.984375*pi) eval[1],eval[7];
cu1(1.9375*pi) eval[2],eval[6];
cu1(1.75*pi) eval[3],eval[5];
h eval[4];
cu1(1.9921875*pi) eval[0],eval[7];
cu1(1.96875*pi) eval[1],eval[6];
cu1(1.875*pi) eval[2],eval[5];
cu1(1.5*pi) eval[3],eval[4];
cu1(1.984375*pi) eval[0],eval[6];
cu1(1.9375*pi) eval[1],eval[5];
cu1(1.75*pi) eval[2],eval[4];
h eval[3];
cu1(1.96875*pi) eval[0],eval[5];
cu1(1.875*pi) eval[1],eval[4];
cu1(1.5*pi) eval[2],eval[3];
cu1(1.9375*pi) eval[0],eval[4];
cu1(1.75*pi) eval[1],eval[3];
h eval[2];
cu1(1.875*pi) eval[0],eval[3];
cu1(1.5*pi) eval[1],eval[2];
cu1(1.75*pi) eval[0],eval[2];
h eval[1];
cu1(1.5*pi) eval[0],eval[1];
h eval[0];
barrier eval[0],eval[1],eval[2],eval[3],eval[4],eval[5],eval[6],eval[7],eval[8],eval[9],eval[10],eval[11],eval[12],eval[13],eval[14],eval[15],eval[16],eval[17],eval[18],eval[19],eval[20],eval[21],eval[22],eval[23],eval[24],q[0];
measure eval[0] -> meas[0];
measure eval[1] -> meas[1];
measure eval[2] -> meas[2];
measure eval[3] -> meas[3];
measure eval[4] -> meas[4];
measure eval[5] -> meas[5];
measure eval[6] -> meas[6];
measure eval[7] -> meas[7];
measure eval[8] -> meas[8];
measure eval[9] -> meas[9];
measure eval[10] -> meas[10];
measure eval[11] -> meas[11];
measure eval[12] -> meas[12];
measure eval[13] -> meas[13];
measure eval[14] -> meas[14];
measure eval[15] -> meas[15];
measure eval[16] -> meas[16];
measure eval[17] -> meas[17];
measure eval[18] -> meas[18];
measure eval[19] -> meas[19];
measure eval[20] -> meas[20];
measure eval[21] -> meas[21];
measure eval[22] -> meas[22];
measure eval[23] -> meas[23];
measure eval[24] -> meas[24];
measure q[0] -> meas[25];
