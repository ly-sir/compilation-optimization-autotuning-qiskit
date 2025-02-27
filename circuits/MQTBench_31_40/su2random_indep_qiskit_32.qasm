// Benchmark was created by MQT Bench on 2024-03-18
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// Qiskit version: 1.0.2

OPENQASM 2.0;
include "qelib1.inc";
qreg q[32];
creg meas[32];
u3(1.4368347742816616,2.567616643692406,-pi) q[0];
u3(0.13038834331032634,2.005819503854303,0) q[1];
cx q[0],q[1];
u3(2.3018560275705338,-2.5732197993538017,-pi) q[2];
cx q[0],q[2];
cx q[1],q[2];
u3(1.5783117544539513,-1.252238475865131,-pi) q[3];
cx q[0],q[3];
cx q[1],q[3];
cx q[2],q[3];
u3(3.1322119352256292,0.716184867709297,0) q[4];
cx q[0],q[4];
cx q[1],q[4];
cx q[2],q[4];
cx q[3],q[4];
u3(1.4124389803026796,-1.0764269733891005,0) q[5];
cx q[0],q[5];
cx q[1],q[5];
cx q[2],q[5];
cx q[3],q[5];
cx q[4],q[5];
u3(1.244465681755567,0.29465826494733527,0) q[6];
cx q[0],q[6];
cx q[1],q[6];
cx q[2],q[6];
cx q[3],q[6];
cx q[4],q[6];
cx q[5],q[6];
u3(1.5046299106322627,0.7934855547557511,-pi) q[7];
cx q[0],q[7];
cx q[1],q[7];
cx q[2],q[7];
cx q[3],q[7];
cx q[4],q[7];
cx q[5],q[7];
cx q[6],q[7];
u3(1.062554723574571,-2.8426000178928454,0) q[8];
cx q[0],q[8];
cx q[1],q[8];
cx q[2],q[8];
cx q[3],q[8];
cx q[4],q[8];
cx q[5],q[8];
cx q[6],q[8];
cx q[7],q[8];
u3(0.5550554224571163,-1.1354532936221062,0) q[9];
cx q[0],q[9];
cx q[1],q[9];
cx q[2],q[9];
cx q[3],q[9];
cx q[4],q[9];
cx q[5],q[9];
cx q[6],q[9];
cx q[7],q[9];
cx q[8],q[9];
u3(1.9769425662797728,-1.891568395380352,-pi) q[10];
cx q[0],q[10];
cx q[1],q[10];
cx q[2],q[10];
cx q[3],q[10];
cx q[4],q[10];
cx q[5],q[10];
cx q[6],q[10];
cx q[7],q[10];
cx q[8],q[10];
cx q[9],q[10];
u3(0.2928382424047807,2.2421565772650203,-pi) q[11];
cx q[0],q[11];
cx q[1],q[11];
cx q[2],q[11];
cx q[3],q[11];
cx q[4],q[11];
cx q[5],q[11];
cx q[6],q[11];
cx q[7],q[11];
cx q[8],q[11];
cx q[9],q[11];
cx q[10],q[11];
u3(0.024807688980383977,2.2094986973106154,0) q[12];
cx q[0],q[12];
cx q[1],q[12];
cx q[2],q[12];
cx q[3],q[12];
cx q[4],q[12];
cx q[5],q[12];
cx q[6],q[12];
cx q[7],q[12];
cx q[8],q[12];
cx q[9],q[12];
cx q[10],q[12];
cx q[11],q[12];
u3(3.0649864034230183,1.5999986339275987,-pi) q[13];
cx q[0],q[13];
cx q[1],q[13];
cx q[2],q[13];
cx q[3],q[13];
cx q[4],q[13];
cx q[5],q[13];
cx q[6],q[13];
cx q[7],q[13];
cx q[8],q[13];
cx q[9],q[13];
cx q[10],q[13];
cx q[11],q[13];
cx q[12],q[13];
u3(1.1773372206208805,-1.2820104054356045,-pi) q[14];
cx q[0],q[14];
cx q[1],q[14];
cx q[2],q[14];
cx q[3],q[14];
cx q[4],q[14];
cx q[5],q[14];
cx q[6],q[14];
cx q[7],q[14];
cx q[8],q[14];
cx q[9],q[14];
cx q[10],q[14];
cx q[11],q[14];
cx q[12],q[14];
cx q[13],q[14];
u3(2.434570523812673,2.4123440472691007,-pi) q[15];
cx q[0],q[15];
cx q[1],q[15];
cx q[2],q[15];
cx q[3],q[15];
cx q[4],q[15];
cx q[5],q[15];
cx q[6],q[15];
cx q[7],q[15];
cx q[8],q[15];
cx q[9],q[15];
cx q[10],q[15];
cx q[11],q[15];
cx q[12],q[15];
cx q[13],q[15];
cx q[14],q[15];
u3(1.748262901313365,-1.0963427134462451,-pi) q[16];
cx q[0],q[16];
cx q[1],q[16];
cx q[2],q[16];
cx q[3],q[16];
cx q[4],q[16];
cx q[5],q[16];
cx q[6],q[16];
cx q[7],q[16];
cx q[8],q[16];
cx q[9],q[16];
cx q[10],q[16];
cx q[11],q[16];
cx q[12],q[16];
cx q[13],q[16];
cx q[14],q[16];
cx q[15],q[16];
u3(1.8339114230470697,1.0368254640000032,0) q[17];
cx q[0],q[17];
cx q[1],q[17];
cx q[2],q[17];
cx q[3],q[17];
cx q[4],q[17];
cx q[5],q[17];
cx q[6],q[17];
cx q[7],q[17];
cx q[8],q[17];
cx q[9],q[17];
cx q[10],q[17];
cx q[11],q[17];
cx q[12],q[17];
cx q[13],q[17];
cx q[14],q[17];
cx q[15],q[17];
cx q[16],q[17];
u3(0.5166404252966228,-0.6752586753862846,-pi) q[18];
cx q[0],q[18];
cx q[1],q[18];
cx q[2],q[18];
cx q[3],q[18];
cx q[4],q[18];
cx q[5],q[18];
cx q[6],q[18];
cx q[7],q[18];
cx q[8],q[18];
cx q[9],q[18];
cx q[10],q[18];
cx q[11],q[18];
cx q[12],q[18];
cx q[13],q[18];
cx q[14],q[18];
cx q[15],q[18];
cx q[16],q[18];
cx q[17],q[18];
u3(1.7933732440688748,-2.554363801359381,-pi) q[19];
cx q[0],q[19];
cx q[1],q[19];
cx q[2],q[19];
cx q[3],q[19];
cx q[4],q[19];
cx q[5],q[19];
cx q[6],q[19];
cx q[7],q[19];
cx q[8],q[19];
cx q[9],q[19];
cx q[10],q[19];
cx q[11],q[19];
cx q[12],q[19];
cx q[13],q[19];
cx q[14],q[19];
cx q[15],q[19];
cx q[16],q[19];
cx q[17],q[19];
cx q[18],q[19];
u3(2.8742785055981956,2.0175663513732243,-pi) q[20];
cx q[0],q[20];
cx q[1],q[20];
cx q[2],q[20];
cx q[3],q[20];
cx q[4],q[20];
cx q[5],q[20];
cx q[6],q[20];
cx q[7],q[20];
cx q[8],q[20];
cx q[9],q[20];
cx q[10],q[20];
cx q[11],q[20];
cx q[12],q[20];
cx q[13],q[20];
cx q[14],q[20];
cx q[15],q[20];
cx q[16],q[20];
cx q[17],q[20];
cx q[18],q[20];
cx q[19],q[20];
u3(0.8932807542109367,0.9497161489686778,0) q[21];
cx q[0],q[21];
cx q[1],q[21];
cx q[2],q[21];
cx q[3],q[21];
cx q[4],q[21];
cx q[5],q[21];
cx q[6],q[21];
cx q[7],q[21];
cx q[8],q[21];
cx q[9],q[21];
cx q[10],q[21];
cx q[11],q[21];
cx q[12],q[21];
cx q[13],q[21];
cx q[14],q[21];
cx q[15],q[21];
cx q[16],q[21];
cx q[17],q[21];
cx q[18],q[21];
cx q[19],q[21];
cx q[20],q[21];
u3(2.345769178126651,2.413462260298216,0) q[22];
cx q[0],q[22];
cx q[1],q[22];
cx q[2],q[22];
cx q[3],q[22];
cx q[4],q[22];
cx q[5],q[22];
cx q[6],q[22];
cx q[7],q[22];
cx q[8],q[22];
cx q[9],q[22];
cx q[10],q[22];
cx q[11],q[22];
cx q[12],q[22];
cx q[13],q[22];
cx q[14],q[22];
cx q[15],q[22];
cx q[16],q[22];
cx q[17],q[22];
cx q[18],q[22];
cx q[19],q[22];
cx q[20],q[22];
cx q[21],q[22];
u3(2.0474788819188667,2.7913723796959733,-pi) q[23];
cx q[0],q[23];
cx q[1],q[23];
cx q[2],q[23];
cx q[3],q[23];
cx q[4],q[23];
cx q[5],q[23];
cx q[6],q[23];
cx q[7],q[23];
cx q[8],q[23];
cx q[9],q[23];
cx q[10],q[23];
cx q[11],q[23];
cx q[12],q[23];
cx q[13],q[23];
cx q[14],q[23];
cx q[15],q[23];
cx q[16],q[23];
cx q[17],q[23];
cx q[18],q[23];
cx q[19],q[23];
cx q[20],q[23];
cx q[21],q[23];
cx q[22],q[23];
u3(2.7761197097590844,-0.0777514342798824,0) q[24];
cx q[0],q[24];
cx q[1],q[24];
cx q[2],q[24];
cx q[3],q[24];
cx q[4],q[24];
cx q[5],q[24];
cx q[6],q[24];
cx q[7],q[24];
cx q[8],q[24];
cx q[9],q[24];
cx q[10],q[24];
cx q[11],q[24];
cx q[12],q[24];
cx q[13],q[24];
cx q[14],q[24];
cx q[15],q[24];
cx q[16],q[24];
cx q[17],q[24];
cx q[18],q[24];
cx q[19],q[24];
cx q[20],q[24];
cx q[21],q[24];
cx q[22],q[24];
cx q[23],q[24];
u3(2.72699034602209,2.867046025905182,0) q[25];
cx q[0],q[25];
cx q[1],q[25];
cx q[2],q[25];
cx q[3],q[25];
cx q[4],q[25];
cx q[5],q[25];
cx q[6],q[25];
cx q[7],q[25];
cx q[8],q[25];
cx q[9],q[25];
cx q[10],q[25];
cx q[11],q[25];
cx q[12],q[25];
cx q[13],q[25];
cx q[14],q[25];
cx q[15],q[25];
cx q[16],q[25];
cx q[17],q[25];
cx q[18],q[25];
cx q[19],q[25];
cx q[20],q[25];
cx q[21],q[25];
cx q[22],q[25];
cx q[23],q[25];
cx q[24],q[25];
u3(2.4016409048004452,2.0490902607683257,-pi) q[26];
cx q[0],q[26];
cx q[1],q[26];
cx q[2],q[26];
cx q[3],q[26];
cx q[4],q[26];
cx q[5],q[26];
cx q[6],q[26];
cx q[7],q[26];
cx q[8],q[26];
cx q[9],q[26];
cx q[10],q[26];
cx q[11],q[26];
cx q[12],q[26];
cx q[13],q[26];
cx q[14],q[26];
cx q[15],q[26];
cx q[16],q[26];
cx q[17],q[26];
cx q[18],q[26];
cx q[19],q[26];
cx q[20],q[26];
cx q[21],q[26];
cx q[22],q[26];
cx q[23],q[26];
cx q[24],q[26];
cx q[25],q[26];
u3(3.059042641009883,-1.5621623869350083,-pi) q[27];
cx q[0],q[27];
cx q[1],q[27];
cx q[2],q[27];
cx q[3],q[27];
cx q[4],q[27];
cx q[5],q[27];
cx q[6],q[27];
cx q[7],q[27];
cx q[8],q[27];
cx q[9],q[27];
cx q[10],q[27];
cx q[11],q[27];
cx q[12],q[27];
cx q[13],q[27];
cx q[14],q[27];
cx q[15],q[27];
cx q[16],q[27];
cx q[17],q[27];
cx q[18],q[27];
cx q[19],q[27];
cx q[20],q[27];
cx q[21],q[27];
cx q[22],q[27];
cx q[23],q[27];
cx q[24],q[27];
cx q[25],q[27];
cx q[26],q[27];
u3(2.1966192898367836,0.6118041095001514,-pi) q[28];
cx q[0],q[28];
cx q[1],q[28];
cx q[2],q[28];
cx q[3],q[28];
cx q[4],q[28];
cx q[5],q[28];
cx q[6],q[28];
cx q[7],q[28];
cx q[8],q[28];
cx q[9],q[28];
cx q[10],q[28];
cx q[11],q[28];
cx q[12],q[28];
cx q[13],q[28];
cx q[14],q[28];
cx q[15],q[28];
cx q[16],q[28];
cx q[17],q[28];
cx q[18],q[28];
cx q[19],q[28];
cx q[20],q[28];
cx q[21],q[28];
cx q[22],q[28];
cx q[23],q[28];
cx q[24],q[28];
cx q[25],q[28];
cx q[26],q[28];
cx q[27],q[28];
u3(2.506746186105557,2.5310665977809697,-pi) q[29];
cx q[0],q[29];
cx q[1],q[29];
cx q[2],q[29];
cx q[3],q[29];
cx q[4],q[29];
cx q[5],q[29];
cx q[6],q[29];
cx q[7],q[29];
cx q[8],q[29];
cx q[9],q[29];
cx q[10],q[29];
cx q[11],q[29];
cx q[12],q[29];
cx q[13],q[29];
cx q[14],q[29];
cx q[15],q[29];
cx q[16],q[29];
cx q[17],q[29];
cx q[18],q[29];
cx q[19],q[29];
cx q[20],q[29];
cx q[21],q[29];
cx q[22],q[29];
cx q[23],q[29];
cx q[24],q[29];
cx q[25],q[29];
cx q[26],q[29];
cx q[27],q[29];
cx q[28],q[29];
u3(1.2238187478398983,0.2171339961578287,-pi) q[30];
cx q[0],q[30];
cx q[1],q[30];
cx q[2],q[30];
cx q[3],q[30];
cx q[4],q[30];
cx q[5],q[30];
cx q[6],q[30];
cx q[7],q[30];
cx q[8],q[30];
cx q[9],q[30];
cx q[10],q[30];
cx q[11],q[30];
cx q[12],q[30];
cx q[13],q[30];
cx q[14],q[30];
cx q[15],q[30];
cx q[16],q[30];
cx q[17],q[30];
cx q[18],q[30];
cx q[19],q[30];
cx q[20],q[30];
cx q[21],q[30];
cx q[22],q[30];
cx q[23],q[30];
cx q[24],q[30];
cx q[25],q[30];
cx q[26],q[30];
cx q[27],q[30];
cx q[28],q[30];
cx q[29],q[30];
u3(3.0055795837278336,0.5667518785975814,-pi) q[31];
cx q[0],q[31];
u3(0.24681462267060233,-0.1440060461338284,0) q[0];
cx q[1],q[31];
u3(2.2442391778450834,2.769463620405215,0) q[1];
cx q[0],q[1];
cx q[2],q[31];
u3(0.5002237983271179,1.999767015060172,0) q[2];
cx q[0],q[2];
cx q[1],q[2];
cx q[3],q[31];
u3(1.9192612708638719,-3.017204522811163,0) q[3];
cx q[0],q[3];
cx q[1],q[3];
cx q[2],q[3];
cx q[4],q[31];
u3(2.0779707218466736,-2.650646985396806,0) q[4];
cx q[0],q[4];
cx q[1],q[4];
cx q[2],q[4];
cx q[3],q[4];
cx q[5],q[31];
u3(1.4210661597787437,2.223831340859621,-pi) q[5];
cx q[0],q[5];
cx q[1],q[5];
cx q[2],q[5];
cx q[3],q[5];
cx q[4],q[5];
cx q[6],q[31];
u3(0.251071112927388,0.42786778855263696,0) q[6];
cx q[0],q[6];
cx q[1],q[6];
cx q[2],q[6];
cx q[3],q[6];
cx q[4],q[6];
cx q[5],q[6];
cx q[7],q[31];
u3(2.6985789450702233,2.918733146171366,0) q[7];
cx q[0],q[7];
cx q[1],q[7];
cx q[2],q[7];
cx q[3],q[7];
cx q[4],q[7];
cx q[5],q[7];
cx q[6],q[7];
cx q[8],q[31];
u3(1.978743893998008,-1.370054094109726,0) q[8];
cx q[0],q[8];
cx q[1],q[8];
cx q[2],q[8];
cx q[3],q[8];
cx q[4],q[8];
cx q[5],q[8];
cx q[6],q[8];
cx q[7],q[8];
cx q[9],q[31];
u3(2.28399350890765,1.3735219663019196,-pi) q[9];
cx q[0],q[9];
cx q[1],q[9];
cx q[2],q[9];
cx q[3],q[9];
cx q[4],q[9];
cx q[5],q[9];
cx q[6],q[9];
cx q[7],q[9];
cx q[8],q[9];
cx q[10],q[31];
u3(2.1761633245663865,-2.601100612425183,0) q[10];
cx q[0],q[10];
cx q[1],q[10];
cx q[2],q[10];
cx q[3],q[10];
cx q[4],q[10];
cx q[5],q[10];
cx q[6],q[10];
cx q[7],q[10];
cx q[8],q[10];
cx q[9],q[10];
cx q[11],q[31];
u3(0.270788675285506,0.23307107221287948,0) q[11];
cx q[0],q[11];
cx q[1],q[11];
cx q[2],q[11];
cx q[3],q[11];
cx q[4],q[11];
cx q[5],q[11];
cx q[6],q[11];
cx q[7],q[11];
cx q[8],q[11];
cx q[9],q[11];
cx q[10],q[11];
cx q[12],q[31];
u3(0.7545152110842549,-0.9383535680109967,-pi) q[12];
cx q[0],q[12];
cx q[1],q[12];
cx q[2],q[12];
cx q[3],q[12];
cx q[4],q[12];
cx q[5],q[12];
cx q[6],q[12];
cx q[7],q[12];
cx q[8],q[12];
cx q[9],q[12];
cx q[10],q[12];
cx q[11],q[12];
cx q[13],q[31];
u3(1.487603264195289,0.3970387803554365,-pi) q[13];
cx q[0],q[13];
cx q[1],q[13];
cx q[2],q[13];
cx q[3],q[13];
cx q[4],q[13];
cx q[5],q[13];
cx q[6],q[13];
cx q[7],q[13];
cx q[8],q[13];
cx q[9],q[13];
cx q[10],q[13];
cx q[11],q[13];
cx q[12],q[13];
cx q[14],q[31];
u3(0.7659413833270341,-1.2583343230489683,-pi) q[14];
cx q[0],q[14];
cx q[1],q[14];
cx q[2],q[14];
cx q[3],q[14];
cx q[4],q[14];
cx q[5],q[14];
cx q[6],q[14];
cx q[7],q[14];
cx q[8],q[14];
cx q[9],q[14];
cx q[10],q[14];
cx q[11],q[14];
cx q[12],q[14];
cx q[13],q[14];
cx q[15],q[31];
u3(2.6232873181840106,-3.064094882964927,0) q[15];
cx q[0],q[15];
cx q[1],q[15];
cx q[2],q[15];
cx q[3],q[15];
cx q[4],q[15];
cx q[5],q[15];
cx q[6],q[15];
cx q[7],q[15];
cx q[8],q[15];
cx q[9],q[15];
cx q[10],q[15];
cx q[11],q[15];
cx q[12],q[15];
cx q[13],q[15];
cx q[14],q[15];
cx q[16],q[31];
u3(2.4782292522231346,1.0899248362305753,-pi) q[16];
cx q[0],q[16];
cx q[1],q[16];
cx q[2],q[16];
cx q[3],q[16];
cx q[4],q[16];
cx q[5],q[16];
cx q[6],q[16];
cx q[7],q[16];
cx q[8],q[16];
cx q[9],q[16];
cx q[10],q[16];
cx q[11],q[16];
cx q[12],q[16];
cx q[13],q[16];
cx q[14],q[16];
cx q[15],q[16];
cx q[17],q[31];
u3(3.0569793381207737,-2.1413489270334916,-pi) q[17];
cx q[0],q[17];
cx q[1],q[17];
cx q[2],q[17];
cx q[3],q[17];
cx q[4],q[17];
cx q[5],q[17];
cx q[6],q[17];
cx q[7],q[17];
cx q[8],q[17];
cx q[9],q[17];
cx q[10],q[17];
cx q[11],q[17];
cx q[12],q[17];
cx q[13],q[17];
cx q[14],q[17];
cx q[15],q[17];
cx q[16],q[17];
cx q[18],q[31];
u3(2.526866864605136,-2.824432098137538,-pi) q[18];
cx q[0],q[18];
cx q[1],q[18];
cx q[2],q[18];
cx q[3],q[18];
cx q[4],q[18];
cx q[5],q[18];
cx q[6],q[18];
cx q[7],q[18];
cx q[8],q[18];
cx q[9],q[18];
cx q[10],q[18];
cx q[11],q[18];
cx q[12],q[18];
cx q[13],q[18];
cx q[14],q[18];
cx q[15],q[18];
cx q[16],q[18];
cx q[17],q[18];
cx q[19],q[31];
u3(1.6475495893366514,2.122559818136633,0) q[19];
cx q[0],q[19];
cx q[1],q[19];
cx q[2],q[19];
cx q[3],q[19];
cx q[4],q[19];
cx q[5],q[19];
cx q[6],q[19];
cx q[7],q[19];
cx q[8],q[19];
cx q[9],q[19];
cx q[10],q[19];
cx q[11],q[19];
cx q[12],q[19];
cx q[13],q[19];
cx q[14],q[19];
cx q[15],q[19];
cx q[16],q[19];
cx q[17],q[19];
cx q[18],q[19];
cx q[20],q[31];
u3(1.8904301876881417,0.6789847093662496,0) q[20];
cx q[0],q[20];
cx q[1],q[20];
cx q[2],q[20];
cx q[3],q[20];
cx q[4],q[20];
cx q[5],q[20];
cx q[6],q[20];
cx q[7],q[20];
cx q[8],q[20];
cx q[9],q[20];
cx q[10],q[20];
cx q[11],q[20];
cx q[12],q[20];
cx q[13],q[20];
cx q[14],q[20];
cx q[15],q[20];
cx q[16],q[20];
cx q[17],q[20];
cx q[18],q[20];
cx q[19],q[20];
cx q[21],q[31];
u3(0.15959153738279022,1.1240794982270375,0) q[21];
cx q[0],q[21];
cx q[1],q[21];
cx q[2],q[21];
cx q[3],q[21];
cx q[4],q[21];
cx q[5],q[21];
cx q[6],q[21];
cx q[7],q[21];
cx q[8],q[21];
cx q[9],q[21];
cx q[10],q[21];
cx q[11],q[21];
cx q[12],q[21];
cx q[13],q[21];
cx q[14],q[21];
cx q[15],q[21];
cx q[16],q[21];
cx q[17],q[21];
cx q[18],q[21];
cx q[19],q[21];
cx q[20],q[21];
cx q[22],q[31];
u3(1.9041982282388041,-0.7173695118370986,0) q[22];
cx q[0],q[22];
cx q[1],q[22];
cx q[2],q[22];
cx q[3],q[22];
cx q[4],q[22];
cx q[5],q[22];
cx q[6],q[22];
cx q[7],q[22];
cx q[8],q[22];
cx q[9],q[22];
cx q[10],q[22];
cx q[11],q[22];
cx q[12],q[22];
cx q[13],q[22];
cx q[14],q[22];
cx q[15],q[22];
cx q[16],q[22];
cx q[17],q[22];
cx q[18],q[22];
cx q[19],q[22];
cx q[20],q[22];
cx q[21],q[22];
cx q[23],q[31];
u3(1.5210075835580792,2.2956558188906246,0) q[23];
cx q[0],q[23];
cx q[1],q[23];
cx q[2],q[23];
cx q[3],q[23];
cx q[4],q[23];
cx q[5],q[23];
cx q[6],q[23];
cx q[7],q[23];
cx q[8],q[23];
cx q[9],q[23];
cx q[10],q[23];
cx q[11],q[23];
cx q[12],q[23];
cx q[13],q[23];
cx q[14],q[23];
cx q[15],q[23];
cx q[16],q[23];
cx q[17],q[23];
cx q[18],q[23];
cx q[19],q[23];
cx q[20],q[23];
cx q[21],q[23];
cx q[22],q[23];
cx q[24],q[31];
u3(2.779818224570653,-1.7670242931636877,-pi) q[24];
cx q[0],q[24];
cx q[1],q[24];
cx q[2],q[24];
cx q[3],q[24];
cx q[4],q[24];
cx q[5],q[24];
cx q[6],q[24];
cx q[7],q[24];
cx q[8],q[24];
cx q[9],q[24];
cx q[10],q[24];
cx q[11],q[24];
cx q[12],q[24];
cx q[13],q[24];
cx q[14],q[24];
cx q[15],q[24];
cx q[16],q[24];
cx q[17],q[24];
cx q[18],q[24];
cx q[19],q[24];
cx q[20],q[24];
cx q[21],q[24];
cx q[22],q[24];
cx q[23],q[24];
cx q[25],q[31];
u3(2.7299999087113385,1.586480226836641,-pi) q[25];
cx q[0],q[25];
cx q[1],q[25];
cx q[2],q[25];
cx q[3],q[25];
cx q[4],q[25];
cx q[5],q[25];
cx q[6],q[25];
cx q[7],q[25];
cx q[8],q[25];
cx q[9],q[25];
cx q[10],q[25];
cx q[11],q[25];
cx q[12],q[25];
cx q[13],q[25];
cx q[14],q[25];
cx q[15],q[25];
cx q[16],q[25];
cx q[17],q[25];
cx q[18],q[25];
cx q[19],q[25];
cx q[20],q[25];
cx q[21],q[25];
cx q[22],q[25];
cx q[23],q[25];
cx q[24],q[25];
cx q[26],q[31];
u3(2.9853439559254618,0.6715442342991342,0) q[26];
cx q[0],q[26];
cx q[1],q[26];
cx q[2],q[26];
cx q[3],q[26];
cx q[4],q[26];
cx q[5],q[26];
cx q[6],q[26];
cx q[7],q[26];
cx q[8],q[26];
cx q[9],q[26];
cx q[10],q[26];
cx q[11],q[26];
cx q[12],q[26];
cx q[13],q[26];
cx q[14],q[26];
cx q[15],q[26];
cx q[16],q[26];
cx q[17],q[26];
cx q[18],q[26];
cx q[19],q[26];
cx q[20],q[26];
cx q[21],q[26];
cx q[22],q[26];
cx q[23],q[26];
cx q[24],q[26];
cx q[25],q[26];
cx q[27],q[31];
u3(1.8397039425941606,-1.6047051650602802,0) q[27];
cx q[0],q[27];
cx q[1],q[27];
cx q[2],q[27];
cx q[3],q[27];
cx q[4],q[27];
cx q[5],q[27];
cx q[6],q[27];
cx q[7],q[27];
cx q[8],q[27];
cx q[9],q[27];
cx q[10],q[27];
cx q[11],q[27];
cx q[12],q[27];
cx q[13],q[27];
cx q[14],q[27];
cx q[15],q[27];
cx q[16],q[27];
cx q[17],q[27];
cx q[18],q[27];
cx q[19],q[27];
cx q[20],q[27];
cx q[21],q[27];
cx q[22],q[27];
cx q[23],q[27];
cx q[24],q[27];
cx q[25],q[27];
cx q[26],q[27];
cx q[28],q[31];
u3(0.4037013205284248,2.9517480532743647,0) q[28];
cx q[0],q[28];
cx q[1],q[28];
cx q[2],q[28];
cx q[3],q[28];
cx q[4],q[28];
cx q[5],q[28];
cx q[6],q[28];
cx q[7],q[28];
cx q[8],q[28];
cx q[9],q[28];
cx q[10],q[28];
cx q[11],q[28];
cx q[12],q[28];
cx q[13],q[28];
cx q[14],q[28];
cx q[15],q[28];
cx q[16],q[28];
cx q[17],q[28];
cx q[18],q[28];
cx q[19],q[28];
cx q[20],q[28];
cx q[21],q[28];
cx q[22],q[28];
cx q[23],q[28];
cx q[24],q[28];
cx q[25],q[28];
cx q[26],q[28];
cx q[27],q[28];
cx q[29],q[31];
u3(0.13308323216909226,0.6173585901279659,-pi) q[29];
cx q[0],q[29];
cx q[1],q[29];
cx q[2],q[29];
cx q[3],q[29];
cx q[4],q[29];
cx q[5],q[29];
cx q[6],q[29];
cx q[7],q[29];
cx q[8],q[29];
cx q[9],q[29];
cx q[10],q[29];
cx q[11],q[29];
cx q[12],q[29];
cx q[13],q[29];
cx q[14],q[29];
cx q[15],q[29];
cx q[16],q[29];
cx q[17],q[29];
cx q[18],q[29];
cx q[19],q[29];
cx q[20],q[29];
cx q[21],q[29];
cx q[22],q[29];
cx q[23],q[29];
cx q[24],q[29];
cx q[25],q[29];
cx q[26],q[29];
cx q[27],q[29];
cx q[28],q[29];
cx q[30],q[31];
u3(2.1344473318790853,0.9275250232100074,0) q[30];
cx q[0],q[30];
cx q[1],q[30];
cx q[2],q[30];
cx q[3],q[30];
cx q[4],q[30];
cx q[5],q[30];
cx q[6],q[30];
cx q[7],q[30];
cx q[8],q[30];
cx q[9],q[30];
cx q[10],q[30];
cx q[11],q[30];
cx q[12],q[30];
cx q[13],q[30];
cx q[14],q[30];
cx q[15],q[30];
cx q[16],q[30];
cx q[17],q[30];
cx q[18],q[30];
cx q[19],q[30];
cx q[20],q[30];
cx q[21],q[30];
cx q[22],q[30];
cx q[23],q[30];
cx q[24],q[30];
cx q[25],q[30];
cx q[26],q[30];
cx q[27],q[30];
cx q[28],q[30];
cx q[29],q[30];
u3(3.1104822839000072,1.1563248901850969,0) q[31];
cx q[0],q[31];
u3(2.2300776000832374,-1.282374482464666,-pi) q[0];
cx q[1],q[31];
u3(0.3055387744716668,0.2359818376485614,0) q[1];
cx q[0],q[1];
cx q[2],q[31];
u3(1.5620784562074315,0.19279853818444703,0) q[2];
cx q[0],q[2];
cx q[1],q[2];
cx q[3],q[31];
u3(2.87513208752671,-0.29464997371580015,-pi) q[3];
cx q[0],q[3];
cx q[1],q[3];
cx q[2],q[3];
cx q[4],q[31];
u3(1.4248589384941148,-1.603066283041036,0) q[4];
cx q[0],q[4];
cx q[1],q[4];
cx q[2],q[4];
cx q[3],q[4];
cx q[5],q[31];
u3(2.3964793521015983,-2.781594998956378,0) q[5];
cx q[0],q[5];
cx q[1],q[5];
cx q[2],q[5];
cx q[3],q[5];
cx q[4],q[5];
cx q[6],q[31];
u3(0.4886258107079427,-0.7218525432048857,-pi) q[6];
cx q[0],q[6];
cx q[1],q[6];
cx q[2],q[6];
cx q[3],q[6];
cx q[4],q[6];
cx q[5],q[6];
cx q[7],q[31];
u3(0.4689965996791233,-2.0855601215962745,-pi) q[7];
cx q[0],q[7];
cx q[1],q[7];
cx q[2],q[7];
cx q[3],q[7];
cx q[4],q[7];
cx q[5],q[7];
cx q[6],q[7];
cx q[8],q[31];
u3(2.722190508244808,2.1253585602326046,-pi) q[8];
cx q[0],q[8];
cx q[1],q[8];
cx q[2],q[8];
cx q[3],q[8];
cx q[4],q[8];
cx q[5],q[8];
cx q[6],q[8];
cx q[7],q[8];
cx q[9],q[31];
u3(2.9312888808085944,0.6223607984597788,-pi) q[9];
cx q[0],q[9];
cx q[1],q[9];
cx q[2],q[9];
cx q[3],q[9];
cx q[4],q[9];
cx q[5],q[9];
cx q[6],q[9];
cx q[7],q[9];
cx q[8],q[9];
cx q[10],q[31];
u3(0.09336828843982556,-1.365243061471043,0) q[10];
cx q[0],q[10];
cx q[1],q[10];
cx q[2],q[10];
cx q[3],q[10];
cx q[4],q[10];
cx q[5],q[10];
cx q[6],q[10];
cx q[7],q[10];
cx q[8],q[10];
cx q[9],q[10];
cx q[11],q[31];
u3(0.13886302347036875,2.189747771098048,-pi) q[11];
cx q[0],q[11];
cx q[1],q[11];
cx q[2],q[11];
cx q[3],q[11];
cx q[4],q[11];
cx q[5],q[11];
cx q[6],q[11];
cx q[7],q[11];
cx q[8],q[11];
cx q[9],q[11];
cx q[10],q[11];
cx q[12],q[31];
u3(2.682738516769052,0.6481920941812591,-pi) q[12];
cx q[0],q[12];
cx q[1],q[12];
cx q[2],q[12];
cx q[3],q[12];
cx q[4],q[12];
cx q[5],q[12];
cx q[6],q[12];
cx q[7],q[12];
cx q[8],q[12];
cx q[9],q[12];
cx q[10],q[12];
cx q[11],q[12];
cx q[13],q[31];
u3(1.3084293813176606,1.7659559409851253,-pi) q[13];
cx q[0],q[13];
cx q[1],q[13];
cx q[2],q[13];
cx q[3],q[13];
cx q[4],q[13];
cx q[5],q[13];
cx q[6],q[13];
cx q[7],q[13];
cx q[8],q[13];
cx q[9],q[13];
cx q[10],q[13];
cx q[11],q[13];
cx q[12],q[13];
cx q[14],q[31];
u3(2.754816351952552,0.7271962389929878,-pi) q[14];
cx q[0],q[14];
cx q[1],q[14];
cx q[2],q[14];
cx q[3],q[14];
cx q[4],q[14];
cx q[5],q[14];
cx q[6],q[14];
cx q[7],q[14];
cx q[8],q[14];
cx q[9],q[14];
cx q[10],q[14];
cx q[11],q[14];
cx q[12],q[14];
cx q[13],q[14];
cx q[15],q[31];
u3(0.7707254079079358,-3.0086078353932617,-pi) q[15];
cx q[0],q[15];
cx q[1],q[15];
cx q[2],q[15];
cx q[3],q[15];
cx q[4],q[15];
cx q[5],q[15];
cx q[6],q[15];
cx q[7],q[15];
cx q[8],q[15];
cx q[9],q[15];
cx q[10],q[15];
cx q[11],q[15];
cx q[12],q[15];
cx q[13],q[15];
cx q[14],q[15];
cx q[16],q[31];
u3(2.612574660840041,1.5737155605834614,-pi) q[16];
cx q[0],q[16];
cx q[1],q[16];
cx q[2],q[16];
cx q[3],q[16];
cx q[4],q[16];
cx q[5],q[16];
cx q[6],q[16];
cx q[7],q[16];
cx q[8],q[16];
cx q[9],q[16];
cx q[10],q[16];
cx q[11],q[16];
cx q[12],q[16];
cx q[13],q[16];
cx q[14],q[16];
cx q[15],q[16];
cx q[17],q[31];
u3(1.829350493141366,-2.035487308297137,-pi) q[17];
cx q[0],q[17];
cx q[1],q[17];
cx q[2],q[17];
cx q[3],q[17];
cx q[4],q[17];
cx q[5],q[17];
cx q[6],q[17];
cx q[7],q[17];
cx q[8],q[17];
cx q[9],q[17];
cx q[10],q[17];
cx q[11],q[17];
cx q[12],q[17];
cx q[13],q[17];
cx q[14],q[17];
cx q[15],q[17];
cx q[16],q[17];
cx q[18],q[31];
u3(0.9332631991875743,2.8809297237631446,0) q[18];
cx q[0],q[18];
cx q[1],q[18];
cx q[2],q[18];
cx q[3],q[18];
cx q[4],q[18];
cx q[5],q[18];
cx q[6],q[18];
cx q[7],q[18];
cx q[8],q[18];
cx q[9],q[18];
cx q[10],q[18];
cx q[11],q[18];
cx q[12],q[18];
cx q[13],q[18];
cx q[14],q[18];
cx q[15],q[18];
cx q[16],q[18];
cx q[17],q[18];
cx q[19],q[31];
u3(2.692035387933323,-3.0591402491761386,0) q[19];
cx q[0],q[19];
cx q[1],q[19];
cx q[2],q[19];
cx q[3],q[19];
cx q[4],q[19];
cx q[5],q[19];
cx q[6],q[19];
cx q[7],q[19];
cx q[8],q[19];
cx q[9],q[19];
cx q[10],q[19];
cx q[11],q[19];
cx q[12],q[19];
cx q[13],q[19];
cx q[14],q[19];
cx q[15],q[19];
cx q[16],q[19];
cx q[17],q[19];
cx q[18],q[19];
cx q[20],q[31];
u3(1.9233454375390766,-0.10039970737162651,-pi) q[20];
cx q[0],q[20];
cx q[1],q[20];
cx q[2],q[20];
cx q[3],q[20];
cx q[4],q[20];
cx q[5],q[20];
cx q[6],q[20];
cx q[7],q[20];
cx q[8],q[20];
cx q[9],q[20];
cx q[10],q[20];
cx q[11],q[20];
cx q[12],q[20];
cx q[13],q[20];
cx q[14],q[20];
cx q[15],q[20];
cx q[16],q[20];
cx q[17],q[20];
cx q[18],q[20];
cx q[19],q[20];
cx q[21],q[31];
u3(0.657345241626873,-0.977752889338797,0) q[21];
cx q[0],q[21];
cx q[1],q[21];
cx q[2],q[21];
cx q[3],q[21];
cx q[4],q[21];
cx q[5],q[21];
cx q[6],q[21];
cx q[7],q[21];
cx q[8],q[21];
cx q[9],q[21];
cx q[10],q[21];
cx q[11],q[21];
cx q[12],q[21];
cx q[13],q[21];
cx q[14],q[21];
cx q[15],q[21];
cx q[16],q[21];
cx q[17],q[21];
cx q[18],q[21];
cx q[19],q[21];
cx q[20],q[21];
cx q[22],q[31];
u3(2.7621211709444955,1.098388095437178,0) q[22];
cx q[0],q[22];
cx q[1],q[22];
cx q[2],q[22];
cx q[3],q[22];
cx q[4],q[22];
cx q[5],q[22];
cx q[6],q[22];
cx q[7],q[22];
cx q[8],q[22];
cx q[9],q[22];
cx q[10],q[22];
cx q[11],q[22];
cx q[12],q[22];
cx q[13],q[22];
cx q[14],q[22];
cx q[15],q[22];
cx q[16],q[22];
cx q[17],q[22];
cx q[18],q[22];
cx q[19],q[22];
cx q[20],q[22];
cx q[21],q[22];
cx q[23],q[31];
u3(1.0442788924788176,0.09195363222114805,0) q[23];
cx q[0],q[23];
cx q[1],q[23];
cx q[2],q[23];
cx q[3],q[23];
cx q[4],q[23];
cx q[5],q[23];
cx q[6],q[23];
cx q[7],q[23];
cx q[8],q[23];
cx q[9],q[23];
cx q[10],q[23];
cx q[11],q[23];
cx q[12],q[23];
cx q[13],q[23];
cx q[14],q[23];
cx q[15],q[23];
cx q[16],q[23];
cx q[17],q[23];
cx q[18],q[23];
cx q[19],q[23];
cx q[20],q[23];
cx q[21],q[23];
cx q[22],q[23];
cx q[24],q[31];
u3(3.097744632733678,2.1913492916764596,-pi) q[24];
cx q[0],q[24];
cx q[1],q[24];
cx q[2],q[24];
cx q[3],q[24];
cx q[4],q[24];
cx q[5],q[24];
cx q[6],q[24];
cx q[7],q[24];
cx q[8],q[24];
cx q[9],q[24];
cx q[10],q[24];
cx q[11],q[24];
cx q[12],q[24];
cx q[13],q[24];
cx q[14],q[24];
cx q[15],q[24];
cx q[16],q[24];
cx q[17],q[24];
cx q[18],q[24];
cx q[19],q[24];
cx q[20],q[24];
cx q[21],q[24];
cx q[22],q[24];
cx q[23],q[24];
cx q[25],q[31];
u3(1.1370311995858002,1.5247693385138215,-pi) q[25];
cx q[0],q[25];
cx q[1],q[25];
cx q[2],q[25];
cx q[3],q[25];
cx q[4],q[25];
cx q[5],q[25];
cx q[6],q[25];
cx q[7],q[25];
cx q[8],q[25];
cx q[9],q[25];
cx q[10],q[25];
cx q[11],q[25];
cx q[12],q[25];
cx q[13],q[25];
cx q[14],q[25];
cx q[15],q[25];
cx q[16],q[25];
cx q[17],q[25];
cx q[18],q[25];
cx q[19],q[25];
cx q[20],q[25];
cx q[21],q[25];
cx q[22],q[25];
cx q[23],q[25];
cx q[24],q[25];
cx q[26],q[31];
u3(0.5661573116985209,2.869515243748836,0) q[26];
cx q[0],q[26];
cx q[1],q[26];
cx q[2],q[26];
cx q[3],q[26];
cx q[4],q[26];
cx q[5],q[26];
cx q[6],q[26];
cx q[7],q[26];
cx q[8],q[26];
cx q[9],q[26];
cx q[10],q[26];
cx q[11],q[26];
cx q[12],q[26];
cx q[13],q[26];
cx q[14],q[26];
cx q[15],q[26];
cx q[16],q[26];
cx q[17],q[26];
cx q[18],q[26];
cx q[19],q[26];
cx q[20],q[26];
cx q[21],q[26];
cx q[22],q[26];
cx q[23],q[26];
cx q[24],q[26];
cx q[25],q[26];
cx q[27],q[31];
u3(1.256205088084606,-0.5221427078305689,-pi) q[27];
cx q[0],q[27];
cx q[1],q[27];
cx q[2],q[27];
cx q[3],q[27];
cx q[4],q[27];
cx q[5],q[27];
cx q[6],q[27];
cx q[7],q[27];
cx q[8],q[27];
cx q[9],q[27];
cx q[10],q[27];
cx q[11],q[27];
cx q[12],q[27];
cx q[13],q[27];
cx q[14],q[27];
cx q[15],q[27];
cx q[16],q[27];
cx q[17],q[27];
cx q[18],q[27];
cx q[19],q[27];
cx q[20],q[27];
cx q[21],q[27];
cx q[22],q[27];
cx q[23],q[27];
cx q[24],q[27];
cx q[25],q[27];
cx q[26],q[27];
cx q[28],q[31];
u3(2.732391703291939,-2.408159505493575,-pi) q[28];
cx q[0],q[28];
cx q[1],q[28];
cx q[2],q[28];
cx q[3],q[28];
cx q[4],q[28];
cx q[5],q[28];
cx q[6],q[28];
cx q[7],q[28];
cx q[8],q[28];
cx q[9],q[28];
cx q[10],q[28];
cx q[11],q[28];
cx q[12],q[28];
cx q[13],q[28];
cx q[14],q[28];
cx q[15],q[28];
cx q[16],q[28];
cx q[17],q[28];
cx q[18],q[28];
cx q[19],q[28];
cx q[20],q[28];
cx q[21],q[28];
cx q[22],q[28];
cx q[23],q[28];
cx q[24],q[28];
cx q[25],q[28];
cx q[26],q[28];
cx q[27],q[28];
cx q[29],q[31];
u3(2.580204424328083,-1.0136089013428533,-pi) q[29];
cx q[0],q[29];
cx q[1],q[29];
cx q[2],q[29];
cx q[3],q[29];
cx q[4],q[29];
cx q[5],q[29];
cx q[6],q[29];
cx q[7],q[29];
cx q[8],q[29];
cx q[9],q[29];
cx q[10],q[29];
cx q[11],q[29];
cx q[12],q[29];
cx q[13],q[29];
cx q[14],q[29];
cx q[15],q[29];
cx q[16],q[29];
cx q[17],q[29];
cx q[18],q[29];
cx q[19],q[29];
cx q[20],q[29];
cx q[21],q[29];
cx q[22],q[29];
cx q[23],q[29];
cx q[24],q[29];
cx q[25],q[29];
cx q[26],q[29];
cx q[27],q[29];
cx q[28],q[29];
cx q[30],q[31];
u3(1.2447031387638805,0.594760293992235,0) q[30];
cx q[0],q[30];
cx q[1],q[30];
cx q[2],q[30];
cx q[3],q[30];
cx q[4],q[30];
cx q[5],q[30];
cx q[6],q[30];
cx q[7],q[30];
cx q[8],q[30];
cx q[9],q[30];
cx q[10],q[30];
cx q[11],q[30];
cx q[12],q[30];
cx q[13],q[30];
cx q[14],q[30];
cx q[15],q[30];
cx q[16],q[30];
cx q[17],q[30];
cx q[18],q[30];
cx q[19],q[30];
cx q[20],q[30];
cx q[21],q[30];
cx q[22],q[30];
cx q[23],q[30];
cx q[24],q[30];
cx q[25],q[30];
cx q[26],q[30];
cx q[27],q[30];
cx q[28],q[30];
cx q[29],q[30];
u3(2.740211814137759,-1.785487285082989,0) q[31];
cx q[0],q[31];
u3(0.48434188042485027,-1.1944858947299792,0) q[0];
cx q[1],q[31];
u3(1.2940236373937675,2.535075773598212,0) q[1];
cx q[2],q[31];
u3(2.67804292011652,-2.988077817616041,-pi) q[2];
cx q[3],q[31];
u3(1.846198110442043,-0.8995570894055263,0) q[3];
cx q[4],q[31];
u3(2.163132671830495,-1.4181474769167721,-pi) q[4];
cx q[5],q[31];
u3(1.2342164713248123,1.3138515211007533,-pi) q[5];
cx q[6],q[31];
u3(2.206739521710109,2.2353835571305005,0) q[6];
cx q[7],q[31];
u3(0.5871032035103994,-1.2923942805515054,0) q[7];
cx q[8],q[31];
u3(1.172969640166347,2.1653041649160034,-pi) q[8];
cx q[9],q[31];
u3(1.3517222748076136,0.23968791919916832,-pi) q[9];
cx q[10],q[31];
u3(2.471925186824747,-2.7703411218724145,0) q[10];
cx q[11],q[31];
u3(0.8515023383206995,-2.371839738239353,-pi) q[11];
cx q[12],q[31];
u3(2.4129364797296606,2.37279415415977,0) q[12];
cx q[13],q[31];
u3(1.6166817203813664,2.6938989188760907,0) q[13];
cx q[14],q[31];
u3(1.0718993507745567,0.07042600165420865,-pi) q[14];
cx q[15],q[31];
u3(1.6563563219599484,2.461516823322869,-pi) q[15];
cx q[16],q[31];
u3(3.0938347397776496,-1.2553137497628928,-pi) q[16];
cx q[17],q[31];
u3(2.2347617865265974,-0.6506748650700436,-pi) q[17];
cx q[18],q[31];
u3(1.3394906952752024,-1.298902584841633,0) q[18];
cx q[19],q[31];
u3(0.6552800011761167,-0.5511856618612718,-pi) q[19];
cx q[20],q[31];
u3(0.21396601218048544,-1.980035579712605,-pi) q[20];
cx q[21],q[31];
u3(1.991779558632702,-1.0037557163359292,0) q[21];
cx q[22],q[31];
u3(0.8447578137430993,0.43524504081089965,-pi) q[22];
cx q[23],q[31];
u3(1.9495700285033721,0.3773065692100239,0) q[23];
cx q[24],q[31];
u3(0.15873805073857997,-0.0696367048895219,0) q[24];
cx q[25],q[31];
u3(0.30910229250827326,1.4374817945168523,0) q[25];
cx q[26],q[31];
u3(1.1600446359222585,-2.4209005358844617,0) q[26];
cx q[27],q[31];
u3(0.43374927775503974,2.312379833675429,0) q[27];
cx q[28],q[31];
u3(1.6177657972952681,-1.2391953389589503,0) q[28];
cx q[29],q[31];
u3(0.542981994467039,0.8014947586766143,-pi) q[29];
cx q[30],q[31];
u3(2.87675332653696,-1.1233300099168826,0) q[30];
u3(0.818144802479752,1.8111478864076522,0) q[31];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21],q[22],q[23],q[24],q[25],q[26],q[27],q[28],q[29],q[30],q[31];
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
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];
measure q[13] -> meas[13];
measure q[14] -> meas[14];
measure q[15] -> meas[15];
measure q[16] -> meas[16];
measure q[17] -> meas[17];
measure q[18] -> meas[18];
measure q[19] -> meas[19];
measure q[20] -> meas[20];
measure q[21] -> meas[21];
measure q[22] -> meas[22];
measure q[23] -> meas[23];
measure q[24] -> meas[24];
measure q[25] -> meas[25];
measure q[26] -> meas[26];
measure q[27] -> meas[27];
measure q[28] -> meas[28];
measure q[29] -> meas[29];
measure q[30] -> meas[30];
measure q[31] -> meas[31];