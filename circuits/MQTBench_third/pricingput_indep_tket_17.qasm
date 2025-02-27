// Benchmark was created by MQT Bench on 2024-03-19
// For more information about MQT Bench, please visit https://www.cda.cit.tum.de/mqtbench/
// MQT Bench version: 1.1.0
// TKET version: 1.25.0

OPENQASM 2.0;
include "qelib1.inc";

qreg q[17];
creg meas[17];
ry(0.5018382346104306*pi) q[0];
ry(0.5036646037002469*pi) q[1];
ry(0.5072361228445761*pi) q[2];
ry(0.5137807993398901*pi) q[3];
ry(0.523252243943782*pi) q[4];
ry(0.5287738171934039*pi) q[5];
ry(0.5238359209035193*pi) q[6];
ry(0.4816849180108283*pi) q[7];
ry(0.6249999999999998*pi) q[8];
x q[10];
x q[11];
x q[12];
x q[13];
x q[15];
x q[16];
cx q[7],q[6];
ry(0.2718707802691928*pi) q[6];
cx q[7],q[6];
cx q[6],q[5];
ry(0.08301997959707234*pi) q[5];
cx q[7],q[5];
ry(0.037299443070614745*pi) q[5];
cx q[6],q[5];
ry(0.16876125426366498*pi) q[5];
cx q[7],q[5];
cx q[5],q[4];
ry(0.025796979283519678*pi) q[4];
cx q[6],q[4];
ry(0.006370017774391742*pi) q[4];
cx q[5],q[4];
ry(0.05140046846694079*pi) q[4];
cx q[7],q[4];
ry(0.026462481958668533*pi) q[4];
cx q[5],q[4];
ry(0.0027921091367269133*pi) q[4];
cx q[6],q[4];
ry(0.013043069892677835*pi) q[4];
cx q[5],q[4];
ry(0.09644574797884084*pi) q[4];
cx q[7],q[4];
cx q[4],q[3];
ry(0.007211277446844773*pi) q[3];
cx q[5],q[3];
ry(0.0011161693330467887*pi) q[3];
cx q[4],q[3];
ry(0.014337358984337403*pi) q[3];
cx q[6],q[3];
ry(0.00435986326797438*pi) q[3];
cx q[4],q[3];
ry(0.0003559561431169955*pi) q[3];
cx q[5],q[3];
ry(0.0021896352496139984*pi) q[3];
cx q[4],q[3];
ry(0.027957006107277315*pi) q[3];
cx q[7],q[3];
ry(0.015195704527591274*pi) q[3];
cx q[4],q[3];
ry(0.0013012543659146059*pi) q[3];
cx q[5],q[3];
ry(0.0002155442047589731*pi) q[3];
cx q[4],q[3];
ry(0.00259624661066335*pi) q[3];
cx q[6],q[3];
ry(0.00781764916160224*pi) q[3];
cx q[4],q[3];
ry(0.0006589772878999121*pi) q[3];
cx q[5],q[3];
ry(0.003933023908459443*pi) q[3];
cx q[4],q[3];
ry(0.050838303716676324*pi) q[3];
cx q[7],q[3];
cx q[3],q[2];
ry(0.0018720695552007888*pi) q[2];
cx q[4],q[2];
ry(0.0001602057822326556*pi) q[2];
cx q[3],q[2];
ry(0.0037358261423802216*pi) q[2];
cx q[5],q[2];
ry(0.0006311423283827137*pi) q[2];
cx q[3],q[2];
ry(3.269021958826103e-05*pi) q[2];
cx q[4],q[2];
ry(0.0003165405121887219*pi) q[2];
cx q[3],q[2];
ry(0.007406496874682785*pi) q[2];
cx q[6],q[2];
ry(0.0023817243848806885*pi) q[2];
cx q[3],q[2];
ry(0.00012167823953010817*pi) q[2];
cx q[4],q[2];
ry(1.449360210693381e-05*pi) q[2];
cx q[3],q[2];
ry(0.00024244934422687711*pi) q[2];
cx q[5],q[2];
ry(0.0012053099664758723*pi) q[2];
cx q[3],q[2];
ry(6.174770395387274e-05*pi) q[2];
cx q[4],q[2];
ry(0.0006044951735795688*pi) q[2];
cx q[3],q[2];
ry(0.014335361779333682*pi) q[2];
cx q[7],q[2];
ry(0.007916923163000519*pi) q[2];
cx q[3],q[2];
ry(0.0003827787743139052*pi) q[2];
cx q[4],q[2];
ry(4.403271679141491e-05*pi) q[2];
cx q[3],q[2];
ry(0.0007627383781894152*pi) q[2];
cx q[5],q[2];
ry(0.00017255133454830159*pi) q[2];
cx q[3],q[2];
ry(1.1111416046247598e-05*pi) q[2];
cx q[4],q[2];
ry(8.663268050688196e-05*pi) q[2];
cx q[3],q[2];
ry(0.0015033205460762364*pi) q[2];
cx q[6],q[2];
ry(0.004128130980636673*pi) q[2];
cx q[3],q[2];
ry(0.00020234885876601618*pi) q[2];
cx q[4],q[2];
ry(2.3455265052266673e-05*pi) q[2];
cx q[3],q[2];
ry(0.0004032141270500664*pi) q[2];
cx q[5],q[2];
ry(0.002087434576116373*pi) q[2];
cx q[3],q[2];
ry(0.00010265659187116162*pi) q[2];
cx q[4],q[2];
ry(0.0010467029273890183*pi) q[2];
cx q[3],q[2];
ry(0.0258246594743274*pi) q[2];
cx q[7],q[2];
cx q[2],q[1];
ry(0.0004729069749796339*pi) q[1];
cx q[3],q[1];
ry(2.086692636431717e-05*pi) q[1];
cx q[2],q[1];
ry(0.000945226677518176*pi) q[1];
cx q[4],q[1];
ry(8.305677234574137e-05*pi) q[1];
cx q[2],q[1];
ry(2.3317752616555935e-06*pi) q[1];
cx q[3],q[1];
ry(4.156954542309931e-05*pi) q[1];
cx q[2],q[1];
ry(0.0018857967269921992*pi) q[1];
cx q[5],q[1];
ry(0.00032595439501380654*pi) q[1];
cx q[2],q[1];
ry(9.065512597097298e-06*pi) q[1];
cx q[3],q[1];
ry(6.32464936968592e-07*pi) q[1];
cx q[2],q[1];
ry(1.810460079737401e-05*pi) q[1];
cx q[4],q[1];
ry(0.00016360841079167046*pi) q[1];
cx q[2],q[1];
ry(4.559116883149639e-06*pi) q[1];
cx q[3],q[1];
ry(8.188404619413285e-05*pi) q[1];
cx q[2],q[1];
ry(0.003735592614293739*pi) q[1];
cx q[6],q[1];
ry(0.0012185974136653863*pi) q[1];
cx q[2],q[1];
ry(3.2846245982091206e-05*pi) q[1];
cx q[3],q[1];
ry(2.2158332260809205e-06*pi) q[1];
cx q[2],q[1];
ry(6.56027595009406e-05*pi) q[1];
cx q[4],q[1];
ry(8.78126195849471e-06*pi) q[1];
cx q[2],q[1];
ry(3.5475222717225384e-07*pi) q[1];
cx q[3],q[1];
ry(4.398855711495066e-06*pi) q[1];
cx q[2],q[1];
ry(0.00013049768473341836*pi) q[1];
cx q[5],q[1];
ry(0.0006180152208461792*pi) q[1];
cx q[2],q[1];
ry(1.6774578674950086e-05*pi) q[1];
cx q[3],q[1];
ry(1.1403780547746916e-06*pi) q[1];
cx q[2],q[1];
ry(3.3502638472064625e-05*pi) q[1];
cx q[4],q[1];
ry(0.00031014582281022485*pi) q[1];
cx q[2],q[1];
ry(8.433698100027057e-06*pi) q[1];
cx q[3],q[1];
ry(0.0001552168129157422*pi) q[1];
cx q[2],q[1];
ry(0.007215553188153931*pi) q[1];
cx q[7],q[1];
ry(0.004001569161993231*pi) q[1];
cx q[2],q[1];
ry(9.981104901971712e-05*pi) q[1];
cx q[3],q[1];
ry(6.2128128938861906e-06*pi) q[1];
cx q[2],q[1];
ry(0.00019938887128959198*pi) q[1];
cx q[4],q[1];
ry(2.4650997874741885e-05*pi) q[1];
cx q[2],q[1];
ry(9.231683021965743e-07*pi) q[1];
cx q[3],q[1];
ry(1.2345564917456334e-05*pi) q[1];
cx q[2],q[1];
ry(0.000396935299328054*pi) q[1];
cx q[5],q[1];
ry(9.558559268031662e-05*pi) q[1];
cx q[2],q[1];
ry(3.546848061619653e-06*pi) q[1];
cx q[3],q[1];
ry(3.050312244426989e-07*pi) q[1];
cx q[2],q[1];
ry(7.078941724953891e-06*pi) q[1];
cx q[4],q[1];
ry(4.809705832397606e-05*pi) q[1];
cx q[2],q[1];
ry(1.7881372080155036e-06*pi) q[1];
cx q[3],q[1];
ry(2.408713909329622e-05*pi) q[1];
cx q[2],q[1];
ry(0.000779828786821441*pi) q[1];
cx q[6],q[1];
ry(0.0020940737336096003*pi) q[1];
cx q[2],q[1];
ry(5.334217504972347e-05*pi) q[1];
cx q[3],q[1];
ry(3.399955367334929e-06*pi) q[1];
cx q[2],q[1];
ry(0.00010655360841091622*pi) q[1];
cx q[4],q[1];
ry(1.348516824192549e-05*pi) q[1];
cx q[2],q[1];
ry(5.173076470033003e-07*pi) q[1];
cx q[3],q[1];
ry(6.75407304182962e-06*pi) q[1];
cx q[2],q[1];
ry(0.00021207486398169576*pi) q[1];
cx q[5],q[1];
ry(0.0010604315259231938*pi) q[1];
cx q[2],q[1];
ry(2.7183930006149277e-05*pi) q[1];
cx q[3],q[1];
ry(1.7453490602914665e-06*pi) q[1];
cx q[2],q[1];
ry(5.4300250615030354e-05*pi) q[1];
cx q[4],q[1];
ry(0.0005319580935341158*pi) q[1];
cx q[2],q[1];
ry(1.3659425167089404e-05*pi) q[1];
cx q[3],q[1];
ry(0.0002661991029138483*pi) q[1];
cx q[2],q[1];
ry(0.012966416187202102*pi) q[1];
cx q[7],q[1];
cx q[1],q[0];
ry(0.0001185427374401634*pi) q[0];
cx q[2],q[0];
ry(2.636786521473843e-06*pi) q[0];
cx q[1],q[0];
ry(0.00023704758504181796*pi) q[0];
cx q[3],q[0];
ry(1.0533186393784485e-05*pi) q[0];
cx q[1],q[0];
ry(1.5124073558394564e-07*pi) q[0];
cx q[2],q[0];
ry(5.267989859402398e-06*pi) q[0];
cx q[1],q[0];
ry(0.00047379281603821926*pi) q[0];
cx q[4],q[0];
ry(4.191268291773478e-05*pi) q[0];
cx q[1],q[0];
ry(5.999679509068654e-07*pi) q[0];
cx q[2],q[0];
ry(2.20629065767894e-08*pi) q[0];
cx q[1],q[0];
ry(1.1994346324368337e-06*pi) q[0];
cx q[3],q[0];
ry(2.097839081177107e-05*pi) q[0];
cx q[1],q[0];
ry(3.004848207077836e-07*pi) q[0];
cx q[2],q[0];
ry(1.049196174214567e-05*pi) q[0];
cx q[1],q[0];
ry(0.0009451907527426354*pi) q[0];
cx q[5],q[0];
ry(0.00016432003018235515*pi) q[0];
cx q[1],q[0];
ry(2.3257613715168222e-06*pi) q[0];
cx q[2],q[0];
ry(8.433391688792679e-08*pi) q[0];
cx q[1],q[0];
ry(4.64963739993661e-06*pi) q[0];
cx q[3],q[0];
ry(3.363388893257797e-07*pi) q[0];
cx q[1],q[0];
ry(7.510778548687418e-09*pi) q[0];
cx q[2],q[0];
ry(1.6826920722429445e-07*pi) q[0];
cx q[1],q[0];
ry(9.284265477062154e-06*pi) q[0];
cx q[4],q[0];
ry(8.24955609249923e-05*pi) q[0];
cx q[1],q[0];
ry(1.1703671561868609e-06*pi) q[0];
cx q[2],q[0];
ry(4.2563906484294006e-08*pi) q[0];
cx q[1],q[0];
ry(2.339779470649174e-06*pi) q[0];
cx q[3],q[0];
ry(4.1290318902356514e-05*pi) q[0];
cx q[1],q[0];
ry(5.861376339669681e-07*pi) q[0];
cx q[2],q[0];
ry(2.0650495859569697e-05*pi) q[0];
cx q[1],q[0];
ry(0.0018719307755155545*pi) q[0];
cx q[6],q[0];
ry(0.0006128536419938124*pi) q[0];
cx q[1],q[0];
ry(8.370540131136477e-06*pi) q[0];
cx q[2],q[0];
ry(2.909768144802186e-07*pi) q[0];
cx q[1],q[0];
ry(1.6734870150325498e-05*pi) q[0];
cx q[3],q[0];
ry(1.1607770261158335e-06*pi) q[0];
cx q[1],q[0];
ry(2.4748880884920917e-08*pi) q[0];
cx q[2],q[0];
ry(5.807017783981226e-07*pi) q[0];
cx q[1],q[0];
ry(3.342027915678728e-05*pi) q[0];
cx q[4],q[0];
ry(4.594164693360165e-06*pi) q[0];
cx q[1],q[0];
ry(9.757202250304558e-08*pi) q[0];
cx q[2],q[0];
ry(4.913954673645903e-09*pi) q[0];
cx q[1],q[0];
ry(1.950009799734806e-07*pi) q[0];
cx q[3],q[0];
ry(2.3019916005739785e-06*pi) q[0];
cx q[1],q[0];
ry(4.892890478100474e-08*pi) q[0];
cx q[2],q[0];
ry(1.1516129834491647e-06*pi) q[0];
cx q[1],q[0];
ry(6.645169270684351e-05*pi) q[0];
cx q[5],q[0];
ry(0.000310982582521803*pi) q[0];
cx q[1],q[0];
ry(4.281730528873173e-06*pi) q[0];
cx q[2],q[0];
ry(1.5032975505467053e-07*pi) q[0];
cx q[1],q[0];
ry(8.560215570674924e-06*pi) q[0];
cx q[3],q[0];
ry(5.996626000837777e-07*pi) q[0];
cx q[1],q[0];
ry(1.293284953390617e-08*pi) q[0];
cx q[2],q[0];
ry(2.999970736148267e-07*pi) q[0];
cx q[1],q[0];
ry(1.709458507702005e-05*pi) q[0];
cx q[4],q[0];
ry(0.0001560896355105359*pi) q[0];
cx q[1],q[0];
ry(2.1537590863917164e-06*pi) q[0];
cx q[2],q[0];
ry(7.582470577540408e-08*pi) q[0];
cx q[1],q[0];
ry(4.305875891263241e-06*pi) q[0];
cx q[3],q[0];
ry(7.812060020038664e-05*pi) q[0];
cx q[1],q[0];
ry(1.078520565752576e-06*pi) q[0];
cx q[2],q[0];
ry(3.906980460669924e-05*pi) q[0];
cx q[1],q[0];
ry(0.003613873567925027*pi) q[0];
cx q[7],q[0];
ry(0.0020062846582143117*pi) q[0];
cx q[1],q[0];
ry(2.5219815411259344e-05*pi) q[0];
cx q[2],q[0];
ry(8.006938057617575e-07*pi) q[0];
cx q[1],q[0];
ry(5.0424045146173906e-05*pi) q[0];
cx q[3],q[0];
ry(3.1955819140116787e-06*pi) q[0];
cx q[1],q[0];
ry(6.214899684815374e-08*pi) q[0];
cx q[2],q[0];
ry(1.5985107632460362e-06*pi) q[0];
cx q[1],q[0];
ry(0.00010072386976594058*pi) q[0];
cx q[4],q[0];
ry(1.266948212929591e-05*pi) q[0];
cx q[1],q[0];
ry(2.455733449865976e-07*pi) q[0];
cx q[2],q[0];
ry(1.1323212378252384e-08*pi) q[0];
cx q[1],q[0];
ry(4.908431063938397e-07*pi) q[0];
cx q[3],q[0];
ry(6.346055018506895e-06*pi) q[0];
cx q[1],q[0];
ry(1.2308993974247095e-07*pi) q[0];
cx q[2],q[0];
ry(3.1744486989067364e-06*pi) q[0];
cx q[1],q[0];
ry(0.0002004684669158058*pi) q[0];
cx q[5],q[0];
ry(4.90002101979712e-05*pi) q[0];
cx q[1],q[0];
ry(9.381996873741213e-07*pi) q[0];
cx q[2],q[0];
ry(4.265958554092967e-08*pi) q[0];
cx q[1],q[0];
ry(1.8752730792550803e-06*pi) q[0];
cx q[3],q[0];
ry(1.6996640909559672e-07*pi) q[0];
cx q[1],q[0];
ry(4.482628392693398e-09*pi) q[0];
cx q[2],q[0];
ry(8.505046455846223e-08*pi) q[0];
cx q[1],q[0];
ry(3.741589920510594e-06*pi) q[0];
cx q[4],q[0];
ry(2.4669537397331147e-05*pi) q[0];
cx q[1],q[0];
ry(4.7356456691719126e-07*pi) q[0];
cx q[2],q[0];
ry(2.1597178815630725e-08*pi) q[0];
cx q[1],q[0];
ry(9.465570201867057e-07*pi) q[0];
cx q[3],q[0];
ry(1.2356348648577995e-05*pi) q[0];
cx q[1],q[0];
ry(2.3735381592202444e-07*pi) q[0];
cx q[2],q[0];
ry(6.180884742424071e-06*pi) q[0];
cx q[1],q[0];
ry(0.00039352373439734183*pi) q[0];
cx q[6],q[0];
ry(0.0010508786439051903*pi) q[0];
cx q[1],q[0];
ry(1.3515395323881766e-05*pi) q[0];
cx q[2],q[0];
ry(4.410845130838678e-07*pi) q[0];
cx q[1],q[0];
ry(2.7021934700510565e-05*pi) q[0];
cx q[3],q[0];
ry(1.7601148143426558e-06*pi) q[0];
cx q[1],q[0];
ry(3.53061652145106e-08*pi) q[0];
cx q[2],q[0];
ry(8.804800293113874e-07*pi) q[0];
cx q[1],q[0];
ry(5.397330410957513e-05*pi) q[0];
cx q[4],q[0];
ry(6.974295346671894e-06*pi) q[0];
cx q[1],q[0];
ry(1.3939225491810518e-07*pi) q[0];
cx q[2],q[0];
ry(6.640608537621067e-09*pi) q[0];
cx q[1],q[0];
ry(2.786004166007188e-07*pi) q[0];
cx q[3],q[0];
ry(3.493782480020299e-06*pi) q[0];
cx q[1],q[0];
ry(6.988001619012357e-08*pi) q[0];
cx q[2],q[0];
ry(1.747724943230988e-06*pi) q[0];
cx q[1],q[0];
ry(0.00010739087039141979*pi) q[0];
cx q[5],q[0];
ry(0.000532361616012503*pi) q[0];
cx q[1],q[0];
ry(6.895656541703368e-06*pi) q[0];
cx q[2],q[0];
ry(2.2709306060763572e-07*pi) q[0];
cx q[1],q[0];
ry(1.3786704162850802e-05*pi) q[0];
cx q[3],q[0];
ry(9.061477341434979e-07*pi) q[0];
cx q[1],q[0];
ry(1.837291138797258e-08*pi) q[0];
cx q[2],q[0];
ry(4.532964792697613e-07*pi) q[0];
cx q[1],q[0];
ry(2.753668760552581e-05*pi) q[0];
cx q[4],q[0];
ry(0.0002670851844595557*pi) q[0];
cx q[1],q[0];
ry(3.4661512638372877e-06*pi) q[0];
cx q[2],q[0];
ry(1.1443297193130953e-07*pi) q[0];
cx q[1],q[0];
ry(6.929973079494927e-06*pi) q[0];
cx q[3],q[0];
ry(0.00013365696854604118*pi) q[0];
cx q[1],q[0];
ry(1.7354034734673353e-06*pi) q[0];
cx q[2],q[0];
ry(6.684282381082032e-05*pi) q[0];
cx q[1],q[0];
ry(0.0064900861195711776*pi) q[0];
cx q[7],q[0];
cry(3.9982850338426212*pi) q[0],q[8];
cry(3.996570067685242*pi) q[1],q[8];
x q[1];
cry(3.993140135370484*pi) q[2],q[8];
ccx q[1],q[10],q[11];
x q[2];
cry(3.9862802707409686*pi) q[3],q[8];
x q[1];
x q[3];
cry(3.9725605414819367*pi) q[4],q[8];
x q[10];
x q[11];
x q[1];
ccx q[2],q[11],q[12];
cry(3.945121082963874*pi) q[5],q[8];
x q[10];
x q[2];
x q[5];
cry(3.8902421659277477*pi) q[6],q[8];
x q[11];
x q[12];
x q[2];
ccx q[3],q[12],q[13];
x q[6];
cry(3.7804843318554955*pi) q[7],q[8];
x q[11];
x q[3];
ccx q[4],q[13],q[14];
u1(0.0*pi) q[8];
x q[12];
x q[3];
x q[12];
x q[14];
ccx q[5],q[14],q[15];
x q[5];
x q[14];
x q[15];
x q[5];
ccx q[6],q[15],q[16];
x q[14];
x q[6];
ccx q[7],q[16],q[9];
x q[15];
x q[6];
u1(0.0*pi) q[9];
x q[15];
x q[16];
ccx q[6],q[15],q[16];
cx q[9],q[8];
x q[6];
u3(0.12499999999999994*pi,0.0*pi,0.0*pi) q[8];
x q[15];
cx q[9],q[8];
x q[15];
ccx q[5],q[14],q[15];
u3(3.875*pi,0.0*pi,0.0*pi) q[8];
u1(0.0*pi) q[9];
x q[5];
u1(0.0*pi) q[8];
x q[14];
ccx q[4],q[13],q[14];
cx q[9],q[8];
u3(3.999571258460655*pi,0.0*pi,0.0*pi) q[8];
x q[13];
ccx q[3],q[12],q[13];
cx q[9],q[8];
x q[3];
u3(0.00042874153934473544*pi,0.0*pi,0.0*pi) q[8];
x q[12];
ccx q[9],q[0],q[8];
x q[12];
ccx q[2],q[11],q[12];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
x q[2];
cx q[9],q[8];
x q[11];
u3(0.00042874153934473544*pi,0.0*pi,0.0*pi) q[8];
x q[11];
ccx q[1],q[10],q[11];
cx q[9],q[8];
x q[1];
u3(3.999571258460655*pi,0.0*pi,0.0*pi) q[8];
x q[10];
ccx q[9],q[0],q[8];
x q[10];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
u3(3.9991425169213106*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(0.0008574830786894709*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[1],q[8];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
u3(0.0008574830786894709*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(3.9991425169213106*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[1],q[8];
x q[1];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
ccx q[1],q[10],q[11];
cx q[9],q[8];
x q[1];
u3(3.9982850338426212*pi,0.0*pi,0.0*pi) q[8];
x q[10];
x q[11];
x q[1];
cx q[9],q[8];
x q[10];
x q[11];
u3(0.0017149661573789418*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[2],q[8];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
u3(0.0017149661573789418*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(3.9982850338426212*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[2],q[8];
x q[2];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
ccx q[2],q[11],q[12];
cx q[9],q[8];
x q[2];
u3(3.996570067685242*pi,0.0*pi,0.0*pi) q[8];
x q[11];
x q[12];
x q[2];
cx q[9],q[8];
x q[11];
x q[12];
u3(0.0034299323147578835*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[3],q[8];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
u3(0.0034299323147578835*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(3.996570067685242*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[3],q[8];
x q[3];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
ccx q[3],q[12],q[13];
cx q[9],q[8];
x q[3];
u3(3.993140135370484*pi,0.0*pi,0.0*pi) q[8];
x q[12];
x q[13];
x q[3];
cx q[9],q[8];
x q[12];
u3(0.006859864629515767*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[4],q[8];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
u3(0.006859864629515767*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(3.993140135370484*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[4],q[8];
ccx q[4],q[13],q[14];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
x q[14];
u3(3.9862802707409686*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(0.013719729259031534*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[5],q[8];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
u3(0.013719729259031534*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(3.9862802707409686*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[5],q[8];
x q[5];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
ccx q[5],q[14],q[15];
cx q[9],q[8];
x q[5];
u3(3.9725605414819367*pi,0.0*pi,0.0*pi) q[8];
x q[14];
x q[15];
x q[5];
cx q[9],q[8];
x q[14];
x q[15];
u3(0.027439458518063068*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[6],q[8];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
u3(0.027439458518063068*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(3.9725605414819367*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[6],q[8];
x q[6];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
ccx q[6],q[15],q[16];
cx q[9],q[8];
x q[6];
u3(3.945121082963874*pi,0.0*pi,0.0*pi) q[8];
x q[15];
x q[16];
x q[6];
cx q[9],q[8];
x q[15];
u3(0.054878917036126254*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[7],q[8];
u1(0.0*pi) q[8];
u1(0.0*pi) q[9];
cx q[9],q[8];
u3(0.054878917036126254*pi,0.0*pi,0.0*pi) q[8];
cx q[9],q[8];
u3(3.945121082963874*pi,0.0*pi,0.0*pi) q[8];
ccx q[9],q[7],q[8];
ccx q[7],q[16],q[9];
ccx q[6],q[15],q[16];
x q[6];
x q[15];
x q[16];
ccx q[5],q[14],q[15];
x q[5];
x q[14];
x q[15];
ccx q[4],q[13],q[14];
ccx q[3],q[12],q[13];
x q[3];
x q[12];
x q[13];
ccx q[2],q[11],q[12];
x q[2];
x q[11];
x q[12];
ccx q[1],q[10],q[11];
x q[1];
x q[10];
x q[11];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16];
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
