import PBA2
import CounterBV
import CircuitData

namespace Stick81.PBGlobalA2Fast
open Circuit Counter

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def localGates : List Gate := [
⟨17134,.eq (16468,false) (16467,true)⟩,
⟨17135,.and [(16468,false),(16467,true)]⟩,
⟨17136,.eq (16473,false) (16472,true)⟩,
⟨17137,.and [(16473,false),(16472,true)]⟩,
⟨17138,.eq (16478,false) (16477,true)⟩,
⟨17139,.and [(16478,false),(16477,true)]⟩,
⟨17140,.eq (16483,false) (16482,true)⟩,
⟨17141,.and [(16483,false),(16482,true)]⟩,
⟨17142,.eq (16489,false) (16488,true)⟩,
⟨17143,.and [(16489,false),(16488,true)]⟩,
⟨17144,.eq (16494,false) (16493,true)⟩,
⟨17145,.and [(16494,false),(16493,true)]⟩,
⟨17146,.eq (16499,false) (16498,true)⟩,
⟨17147,.and [(16499,false),(16498,true)]⟩,
⟨17148,.eq (16503,false) (16502,true)⟩,
⟨17149,.and [(16503,false),(16502,true)]⟩,
⟨17150,.eq (16507,false) (16506,true)⟩,
⟨17151,.and [(16507,false),(16506,true)]⟩,
⟨17152,.eq (16513,false) (16512,true)⟩,
⟨17153,.and [(16513,false),(16512,true)]⟩,
⟨17154,.eq (16518,false) (16517,true)⟩,
⟨17155,.and [(16518,false),(16517,true)]⟩,
⟨17156,.eq (16522,false) (16521,true)⟩,
⟨17157,.and [(16522,false),(16521,true)]⟩,
⟨17158,.eq (16525,false) (16524,true)⟩,
⟨17159,.and [(16525,false),(16524,true)]⟩,
⟨17160,.eq (16539,false) (16538,true)⟩,
⟨17161,.and [(16539,false),(16538,true)]⟩,
⟨17162,.eq (16543,false) (16542,true)⟩,
⟨17163,.and [(16543,false),(16542,true)]⟩,
⟨17164,.eq (16547,false) (16546,true)⟩,
⟨17165,.and [(16547,false),(16546,true)]⟩,
⟨17166,.eq (16553,false) (16552,true)⟩,
⟨17167,.and [(16553,false),(16552,true)]⟩,
⟨17168,.eq (16557,false) (16556,true)⟩,
⟨17169,.and [(16557,false),(16556,true)]⟩,
⟨17170,.eq (16562,false) (16561,true)⟩,
⟨17171,.and [(16562,false),(16561,true)]⟩,
⟨17172,.eq (16567,false) (16566,true)⟩,
⟨17173,.and [(16567,false),(16566,true)]⟩,
⟨17174,.eq (16571,false) (16570,true)⟩,
⟨17175,.and [(16571,false),(16570,true)]⟩,
⟨17176,.eq (16575,false) (16574,true)⟩,
⟨17177,.and [(16575,false),(16574,true)]⟩,
⟨17178,.eq (16580,false) (16579,true)⟩,
⟨17179,.and [(16580,false),(16579,true)]⟩,
⟨17180,.eq (16585,false) (16584,true)⟩,
⟨17181,.and [(16585,false),(16584,true)]⟩,
⟨17182,.eq (16589,false) (16588,true)⟩,
⟨17183,.and [(16589,false),(16588,true)]⟩,
⟨17184,.eq (16593,false) (16592,true)⟩,
⟨17185,.and [(16593,false),(16592,true)]⟩,
⟨17186,.eq (16597,false) (16596,true)⟩,
⟨17187,.and [(16597,false),(16596,true)]⟩,
⟨17188,.eq (16600,false) (16599,true)⟩,
⟨17189,.and [(16600,false),(16599,true)]⟩,
⟨17190,.eq (16608,false) (16607,true)⟩,
⟨17191,.and [(16608,false),(16607,true)]⟩,
⟨17192,.eq (16612,false) (16611,true)⟩,
⟨17193,.and [(16612,false),(16611,true)]⟩,
⟨17194,.eq (16619,false) (16618,true)⟩,
⟨17195,.and [(16619,false),(16618,true)]⟩,
⟨17196,.eq (16623,false) (16622,true)⟩,
⟨17197,.and [(16623,false),(16622,true)]⟩,
⟨17198,.eq (16628,false) (16627,true)⟩,
⟨17199,.and [(16628,false),(16627,true)]⟩,
⟨17200,.eq (16632,false) (16631,true)⟩,
⟨17201,.and [(16632,false),(16631,true)]⟩,
⟨17202,.eq (16636,false) (16635,true)⟩,
⟨17203,.and [(16636,false),(16635,true)]⟩,
⟨17204,.eq (16641,false) (16640,true)⟩,
⟨17205,.and [(16641,false),(16640,true)]⟩,
⟨17206,.eq (16646,false) (16645,true)⟩,
⟨17207,.and [(16646,false),(16645,true)]⟩,
⟨17208,.eq (16650,false) (16649,true)⟩,
⟨17209,.and [(16650,false),(16649,true)]⟩,
⟨17210,.eq (16654,false) (16653,true)⟩,
⟨17211,.and [(16654,false),(16653,true)]⟩,
⟨17212,.eq (16659,false) (16658,true)⟩,
⟨17213,.and [(16659,false),(16658,true)]⟩,
⟨17214,.eq (16663,false) (16662,true)⟩,
⟨17215,.and [(16663,false),(16662,true)]⟩,
⟨17216,.eq (16667,false) (16666,true)⟩,
⟨17217,.and [(16667,false),(16666,true)]⟩,
⟨17218,.eq (16670,false) (16669,true)⟩,
⟨17219,.and [(16670,false),(16669,true)]⟩,
⟨17220,.eq (16675,false) (16674,true)⟩,
⟨17221,.and [(16675,false),(16674,true)]⟩,
⟨17222,.eq (16684,false) (16683,true)⟩,
⟨17223,.and [(16684,false),(16683,true)]⟩,
⟨17224,.eq (16688,false) (16687,true)⟩,
⟨17225,.and [(16688,false),(16687,true)]⟩,
⟨17226,.eq (16692,false) (16691,true)⟩,
⟨17227,.and [(16692,false),(16691,true)]⟩,
⟨17228,.eq (16698,false) (16697,true)⟩,
⟨17229,.and [(16698,false),(16697,true)]⟩,
⟨17230,.eq (16703,false) (16702,true)⟩,
⟨17231,.and [(16703,false),(16702,true)]⟩,
⟨17232,.eq (16707,false) (16706,true)⟩,
⟨17233,.and [(16707,false),(16706,true)]⟩,
⟨17234,.eq (16711,false) (16710,true)⟩,
⟨17235,.and [(16711,false),(16710,true)]⟩,
⟨17236,.eq (16716,false) (16715,true)⟩,
⟨17237,.and [(16716,false),(16715,true)]⟩,
⟨17238,.eq (16720,false) (16719,true)⟩,
⟨17239,.and [(16720,false),(16719,true)]⟩,
⟨17240,.eq (16724,false) (16723,true)⟩,
⟨17241,.and [(16724,false),(16723,true)]⟩,
⟨17242,.eq (16728,false) (16727,true)⟩,
⟨17243,.and [(16728,false),(16727,true)]⟩,
⟨17244,.eq (16731,false) (16730,true)⟩,
⟨17245,.and [(16731,false),(16730,true)]⟩,
⟨17246,.eq (16742,false) (16741,true)⟩,
⟨17247,.and [(16742,false),(16741,true)]⟩,
⟨17248,.eq (16746,false) (16745,true)⟩,
⟨17249,.and [(16746,false),(16745,true)]⟩,
⟨17250,.eq (16754,false) (16753,true)⟩,
⟨17251,.and [(16754,false),(16753,true)]⟩,
⟨17252,.eq (16758,false) (16757,true)⟩,
⟨17253,.and [(16758,false),(16757,true)]⟩,
⟨17254,.eq (16764,false) (16763,true)⟩,
⟨17255,.and [(16764,false),(16763,true)]⟩,
⟨17256,.eq (16768,false) (16767,true)⟩,
⟨17257,.and [(16768,false),(16767,true)]⟩,
⟨17258,.eq (16772,false) (16771,true)⟩,
⟨17259,.and [(16772,false),(16771,true)]⟩,
⟨17260,.eq (16776,false) (16775,true)⟩,
⟨17261,.and [(16776,false),(16775,true)]⟩,
⟨17262,.eq (16780,false) (16779,true)⟩,
⟨17263,.and [(16780,false),(16779,true)]⟩,
⟨17264,.eq (16784,false) (16783,true)⟩,
⟨17265,.and [(16784,false),(16783,true)]⟩,
⟨17266,.eq (16788,false) (16787,true)⟩,
⟨17267,.and [(16788,false),(16787,true)]⟩,
⟨17268,.eq (16792,false) (16791,true)⟩,
⟨17269,.and [(16792,false),(16791,true)]⟩,
⟨17270,.eq (16797,false) (16796,true)⟩,
⟨17271,.and [(16797,false),(16796,true)]⟩,
⟨17272,.eq (16802,false) (16801,true)⟩,
⟨17273,.and [(16802,false),(16801,true)]⟩,
⟨17274,.eq (16806,false) (16805,true)⟩,
⟨17275,.and [(16806,false),(16805,true)]⟩,
⟨17276,.eq (16810,false) (16809,true)⟩,
⟨17277,.and [(16810,false),(16809,true)]⟩,
⟨17278,.eq (16814,false) (16813,true)⟩,
⟨17279,.and [(16814,false),(16813,true)]⟩,
⟨17280,.eq (16819,false) (16818,true)⟩,
⟨17281,.and [(16819,false),(16818,true)]⟩,
⟨17282,.eq (16823,false) (16822,true)⟩,
⟨17283,.and [(16823,false),(16822,true)]⟩,
⟨17284,.eq (16827,false) (16826,true)⟩,
⟨17285,.and [(16827,false),(16826,true)]⟩,
⟨17286,.eq (16835,false) (16834,true)⟩,
⟨17287,.and [(16835,false),(16834,true)]⟩,
⟨17288,.eq (16839,false) (16838,true)⟩,
⟨17289,.and [(16839,false),(16838,true)]⟩,
⟨17290,.eq (16843,false) (16842,true)⟩,
⟨17291,.and [(16843,false),(16842,true)]⟩,
⟨17292,.eq (16849,false) (16848,true)⟩,
⟨17293,.and [(16849,false),(16848,true)]⟩,
⟨17294,.eq (16853,false) (16852,true)⟩,
⟨17295,.and [(16853,false),(16852,true)]⟩,
⟨17296,.eq (16858,false) (16857,true)⟩,
⟨17297,.and [(16858,false),(16857,true)]⟩,
⟨17298,.eq (16862,false) (16861,true)⟩,
⟨17299,.and [(16862,false),(16861,true)]⟩,
⟨17300,.eq (16866,false) (16865,true)⟩,
⟨17301,.and [(16866,false),(16865,true)]⟩,
⟨17302,.eq (16871,false) (16870,true)⟩,
⟨17303,.and [(16871,false),(16870,true)]⟩,
⟨17304,.eq (16875,false) (16874,true)⟩,
⟨17305,.and [(16875,false),(16874,true)]⟩,
⟨17306,.eq (16879,false) (16878,true)⟩,
⟨17307,.and [(16879,false),(16878,true)]⟩,
⟨17308,.eq (16883,false) (16882,true)⟩,
⟨17309,.and [(16883,false),(16882,true)]⟩,
⟨17310,.eq (16888,false) (16887,true)⟩,
⟨17311,.and [(16888,false),(16887,true)]⟩,
⟨17312,.eq (16892,false) (16891,true)⟩,
⟨17313,.and [(16892,false),(16891,true)]⟩,
⟨17314,.eq (16899,false) (16898,true)⟩,
⟨17315,.and [(16899,false),(16898,true)]⟩,
⟨17316,.eq (16903,false) (16902,true)⟩,
⟨17317,.and [(16903,false),(16902,true)]⟩,
⟨17318,.eq (16907,false) (16906,true)⟩,
⟨17319,.and [(16907,false),(16906,true)]⟩,
⟨17320,.eq (16911,false) (16910,true)⟩,
⟨17321,.and [(16911,false),(16910,true)]⟩,
⟨17322,.eq (16916,false) (16915,true)⟩,
⟨17323,.and [(16916,false),(16915,true)]⟩,
⟨17324,.eq (16920,false) (16919,true)⟩,
⟨17325,.and [(16920,false),(16919,true)]⟩,
⟨17326,.eq (16924,false) (16923,true)⟩,
⟨17327,.and [(16924,false),(16923,true)]⟩,
⟨17328,.eq (16928,false) (16927,true)⟩,
⟨17329,.and [(16928,false),(16927,true)]⟩,
⟨17330,.eq (16932,false) (16931,true)⟩,
⟨17331,.and [(16932,false),(16931,true)]⟩,
⟨17332,.eq (16936,false) (16935,true)⟩,
⟨17333,.and [(16936,false),(16935,true)]⟩,
⟨17334,.eq (16945,false) (16944,true)⟩,
⟨17335,.and [(16945,false),(16944,true)]⟩,
⟨17336,.eq (16949,false) (16948,true)⟩,
⟨17337,.and [(16949,false),(16948,true)]⟩,
⟨17338,.eq (16955,false) (16954,true)⟩,
⟨17339,.and [(16955,false),(16954,true)]⟩,
⟨17340,.eq (16959,false) (16958,true)⟩,
⟨17341,.and [(16959,false),(16958,true)]⟩,
⟨17342,.eq (16963,false) (16962,true)⟩,
⟨17343,.and [(16963,false),(16962,true)]⟩,
⟨17344,.eq (16967,false) (16966,true)⟩,
⟨17345,.and [(16967,false),(16966,true)]⟩,
⟨17346,.eq (16971,false) (16970,true)⟩,
⟨17347,.and [(16971,false),(16970,true)]⟩,
⟨17348,.eq (16983,false) (16982,true)⟩,
⟨17349,.and [(16983,false),(16982,true)]⟩,
⟨17350,.eq (16987,false) (16986,true)⟩,
⟨17351,.and [(16987,false),(16986,true)]⟩,
⟨17352,.eq (16991,false) (16990,true)⟩,
⟨17353,.and [(16991,false),(16990,true)]⟩,
⟨17354,.eq (16996,false) (16995,true)⟩,
⟨17355,.and [(16996,false),(16995,true)]⟩,
⟨17356,.eq (17000,false) (16999,true)⟩,
⟨17357,.and [(17000,false),(16999,true)]⟩,
⟨17358,.eq (17004,false) (17003,true)⟩,
⟨17359,.and [(17004,false),(17003,true)]⟩,
⟨17360,.eq (17009,false) (17008,true)⟩,
⟨17361,.and [(17009,false),(17008,true)]⟩,
⟨17362,.eq (17013,false) (17012,true)⟩,
⟨17363,.and [(17013,false),(17012,true)]⟩,
⟨17364,.eq (17018,false) (17017,true)⟩,
⟨17365,.and [(17018,false),(17017,true)]⟩,
⟨17366,.eq (17022,false) (17021,true)⟩,
⟨17367,.and [(17022,false),(17021,true)]⟩,
⟨17368,.eq (17028,false) (17027,true)⟩,
⟨17369,.and [(17028,false),(17027,true)]⟩,
⟨17370,.eq (17032,false) (17031,true)⟩,
⟨17371,.and [(17032,false),(17031,true)]⟩,
⟨17372,.eq (17036,false) (17035,true)⟩,
⟨17373,.and [(17036,false),(17035,true)]⟩,
⟨17374,.eq (17040,false) (17039,true)⟩,
⟨17375,.and [(17040,false),(17039,true)]⟩,
⟨17376,.eq (17044,false) (17043,true)⟩,
⟨17377,.and [(17044,false),(17043,true)]⟩,
⟨17378,.eq (17048,false) (17047,true)⟩,
⟨17379,.and [(17048,false),(17047,true)]⟩,
⟨17380,.eq (17052,false) (17051,true)⟩,
⟨17381,.and [(17052,false),(17051,true)]⟩,
⟨17382,.eq (17059,false) (17058,true)⟩,
⟨17383,.and [(17059,false),(17058,true)]⟩,
⟨17384,.eq (17063,false) (17062,true)⟩,
⟨17385,.and [(17063,false),(17062,true)]⟩,
⟨17386,.eq (17067,false) (17066,true)⟩,
⟨17387,.and [(17067,false),(17066,true)]⟩,
⟨17388,.eq (17071,false) (17070,true)⟩,
⟨17389,.and [(17071,false),(17070,true)]⟩,
⟨17390,.eq (17075,false) (17074,true)⟩,
⟨17391,.and [(17075,false),(17074,true)]⟩,
⟨17392,.eq (17084,false) (17083,true)⟩,
⟨17393,.and [(17084,false),(17083,true)]⟩,
⟨17394,.eq (17088,false) (17087,true)⟩,
⟨17395,.and [(17088,false),(17087,true)]⟩,
⟨17396,.eq (17093,false) (17092,true)⟩,
⟨17397,.and [(17093,false),(17092,true)]⟩,
⟨17398,.eq (17097,false) (17096,true)⟩,
⟨17399,.and [(17097,false),(17096,true)]⟩,
⟨17400,.eq (17102,false) (17101,true)⟩,
⟨17401,.and [(17102,false),(17101,true)]⟩,
⟨17402,.eq (17106,false) (17105,true)⟩,
⟨17403,.and [(17106,false),(17105,true)]⟩,
⟨17404,.eq (17112,false) (17111,true)⟩,
⟨17405,.and [(17112,false),(17111,true)]⟩,
⟨17406,.eq (17116,false) (17115,true)⟩,
⟨17407,.and [(17116,false),(17115,true)]⟩,
⟨17408,.eq (17120,false) (17119,true)⟩,
⟨17409,.and [(17120,false),(17119,true)]⟩,
⟨17410,.eq (17127,false) (17126,true)⟩,
⟨17411,.and [(17127,false),(17126,true)]⟩,
⟨17412,.eq (17131,false) (17130,true)⟩,
⟨17413,.and [(17131,false),(17130,true)]⟩,
⟨17414,.eq (17136,false) (17134,false)⟩,
⟨17415,.and [(17136,false),(17134,false)]⟩,
⟨17416,.eq (17137,false) (17135,false)⟩,
⟨17417,.eq (17416,false) (17415,true)⟩,
⟨17418,.majority (17135,true) (17137,true) (17415,true)⟩,
⟨17419,.eq (17140,false) (17138,false)⟩,
⟨17420,.and [(17140,false),(17138,false)]⟩,
⟨17421,.eq (17141,false) (17139,false)⟩,
⟨17422,.eq (17421,false) (17420,true)⟩,
⟨17423,.majority (17139,true) (17141,true) (17420,true)⟩,
⟨17424,.eq (17144,false) (17142,false)⟩,
⟨17425,.and [(17144,false),(17142,false)]⟩,
⟨17426,.eq (17145,false) (17143,false)⟩,
⟨17427,.eq (17426,false) (17425,true)⟩,
⟨17428,.majority (17143,true) (17145,true) (17425,true)⟩,
⟨17429,.eq (17148,false) (17146,false)⟩,
⟨17430,.and [(17148,false),(17146,false)]⟩,
⟨17431,.eq (17149,false) (17147,false)⟩,
⟨17432,.eq (17431,false) (17430,true)⟩,
⟨17433,.majority (17147,true) (17149,true) (17430,true)⟩,
⟨17434,.eq (17152,false) (17150,false)⟩,
⟨17435,.and [(17152,false),(17150,false)]⟩,
⟨17436,.eq (17153,false) (17151,false)⟩,
⟨17437,.eq (17436,false) (17435,true)⟩,
⟨17438,.majority (17151,true) (17153,true) (17435,true)⟩,
⟨17439,.eq (17156,false) (17154,false)⟩,
⟨17440,.and [(17156,false),(17154,false)]⟩,
⟨17441,.eq (17157,false) (17155,false)⟩,
⟨17442,.eq (17441,false) (17440,true)⟩,
⟨17443,.majority (17155,true) (17157,true) (17440,true)⟩,
⟨17444,.eq (17160,false) (17158,false)⟩,
⟨17445,.and [(17160,false),(17158,false)]⟩,
⟨17446,.eq (17161,false) (17159,false)⟩,
⟨17447,.eq (17446,false) (17445,true)⟩,
⟨17448,.majority (17159,true) (17161,true) (17445,true)⟩,
⟨17449,.eq (17164,false) (17162,false)⟩,
⟨17450,.and [(17164,false),(17162,false)]⟩,
⟨17451,.eq (17165,false) (17163,false)⟩,
⟨17452,.eq (17451,false) (17450,true)⟩,
⟨17453,.majority (17163,true) (17165,true) (17450,true)⟩,
⟨17454,.eq (17168,false) (17166,false)⟩,
⟨17455,.and [(17168,false),(17166,false)]⟩,
⟨17456,.eq (17169,false) (17167,false)⟩,
⟨17457,.eq (17456,false) (17455,true)⟩,
⟨17458,.majority (17167,true) (17169,true) (17455,true)⟩,
⟨17459,.eq (17172,false) (17170,false)⟩,
⟨17460,.and [(17172,false),(17170,false)]⟩,
⟨17461,.eq (17173,false) (17171,false)⟩,
⟨17462,.eq (17461,false) (17460,true)⟩,
⟨17463,.majority (17171,true) (17173,true) (17460,true)⟩,
⟨17464,.eq (17176,false) (17174,false)⟩,
⟨17465,.and [(17176,false),(17174,false)]⟩,
⟨17466,.eq (17177,false) (17175,false)⟩,
⟨17467,.eq (17466,false) (17465,true)⟩,
⟨17468,.majority (17175,true) (17177,true) (17465,true)⟩,
⟨17469,.eq (17180,false) (17178,false)⟩,
⟨17470,.and [(17180,false),(17178,false)]⟩,
⟨17471,.eq (17181,false) (17179,false)⟩,
⟨17472,.eq (17471,false) (17470,true)⟩,
⟨17473,.majority (17179,true) (17181,true) (17470,true)⟩,
⟨17474,.eq (17184,false) (17182,false)⟩,
⟨17475,.and [(17184,false),(17182,false)]⟩,
⟨17476,.eq (17185,false) (17183,false)⟩,
⟨17477,.eq (17476,false) (17475,true)⟩,
⟨17478,.majority (17183,true) (17185,true) (17475,true)⟩,
⟨17479,.eq (17188,false) (17186,false)⟩,
⟨17480,.and [(17188,false),(17186,false)]⟩,
⟨17481,.eq (17189,false) (17187,false)⟩,
⟨17482,.eq (17481,false) (17480,true)⟩,
⟨17483,.majority (17187,true) (17189,true) (17480,true)⟩,
⟨17484,.eq (17192,false) (17190,false)⟩,
⟨17485,.and [(17192,false),(17190,false)]⟩,
⟨17486,.eq (17193,false) (17191,false)⟩,
⟨17487,.eq (17486,false) (17485,true)⟩,
⟨17488,.majority (17191,true) (17193,true) (17485,true)⟩,
⟨17489,.eq (17196,false) (17194,false)⟩,
⟨17490,.and [(17196,false),(17194,false)]⟩,
⟨17491,.eq (17197,false) (17195,false)⟩,
⟨17492,.eq (17491,false) (17490,true)⟩,
⟨17493,.majority (17195,true) (17197,true) (17490,true)⟩,
⟨17494,.eq (17200,false) (17198,false)⟩,
⟨17495,.and [(17200,false),(17198,false)]⟩,
⟨17496,.eq (17201,false) (17199,false)⟩,
⟨17497,.eq (17496,false) (17495,true)⟩,
⟨17498,.majority (17199,true) (17201,true) (17495,true)⟩,
⟨17499,.eq (17204,false) (17202,false)⟩,
⟨17500,.and [(17204,false),(17202,false)]⟩,
⟨17501,.eq (17205,false) (17203,false)⟩,
⟨17502,.eq (17501,false) (17500,true)⟩,
⟨17503,.majority (17203,true) (17205,true) (17500,true)⟩,
⟨17504,.eq (17208,false) (17206,false)⟩,
⟨17505,.and [(17208,false),(17206,false)]⟩,
⟨17506,.eq (17209,false) (17207,false)⟩,
⟨17507,.eq (17506,false) (17505,true)⟩,
⟨17508,.majority (17207,true) (17209,true) (17505,true)⟩,
⟨17509,.eq (17212,false) (17210,false)⟩,
⟨17510,.and [(17212,false),(17210,false)]⟩,
⟨17511,.eq (17213,false) (17211,false)⟩,
⟨17512,.eq (17511,false) (17510,true)⟩,
⟨17513,.majority (17211,true) (17213,true) (17510,true)⟩,
⟨17514,.eq (17216,false) (17214,false)⟩,
⟨17515,.and [(17216,false),(17214,false)]⟩,
⟨17516,.eq (17217,false) (17215,false)⟩,
⟨17517,.eq (17516,false) (17515,true)⟩,
⟨17518,.majority (17215,true) (17217,true) (17515,true)⟩,
⟨17519,.eq (17220,false) (17218,false)⟩,
⟨17520,.and [(17220,false),(17218,false)]⟩,
⟨17521,.eq (17221,false) (17219,false)⟩,
⟨17522,.eq (17521,false) (17520,true)⟩,
⟨17523,.majority (17219,true) (17221,true) (17520,true)⟩,
⟨17524,.eq (17224,false) (17222,false)⟩,
⟨17525,.and [(17224,false),(17222,false)]⟩,
⟨17526,.eq (17225,false) (17223,false)⟩,
⟨17527,.eq (17526,false) (17525,true)⟩,
⟨17528,.majority (17223,true) (17225,true) (17525,true)⟩,
⟨17529,.eq (17228,false) (17226,false)⟩,
⟨17530,.and [(17228,false),(17226,false)]⟩,
⟨17531,.eq (17229,false) (17227,false)⟩,
⟨17532,.eq (17531,false) (17530,true)⟩,
⟨17533,.majority (17227,true) (17229,true) (17530,true)⟩,
⟨17534,.eq (17232,false) (17230,false)⟩,
⟨17535,.and [(17232,false),(17230,false)]⟩,
⟨17536,.eq (17233,false) (17231,false)⟩,
⟨17537,.eq (17536,false) (17535,true)⟩,
⟨17538,.majority (17231,true) (17233,true) (17535,true)⟩,
⟨17539,.eq (17236,false) (17234,false)⟩,
⟨17540,.and [(17236,false),(17234,false)]⟩,
⟨17541,.eq (17237,false) (17235,false)⟩,
⟨17542,.eq (17541,false) (17540,true)⟩,
⟨17543,.majority (17235,true) (17237,true) (17540,true)⟩,
⟨17544,.eq (17240,false) (17238,false)⟩,
⟨17545,.and [(17240,false),(17238,false)]⟩,
⟨17546,.eq (17241,false) (17239,false)⟩,
⟨17547,.eq (17546,false) (17545,true)⟩,
⟨17548,.majority (17239,true) (17241,true) (17545,true)⟩,
⟨17549,.eq (17244,false) (17242,false)⟩,
⟨17550,.and [(17244,false),(17242,false)]⟩,
⟨17551,.eq (17245,false) (17243,false)⟩,
⟨17552,.eq (17551,false) (17550,true)⟩,
⟨17553,.majority (17243,true) (17245,true) (17550,true)⟩,
⟨17554,.eq (17248,false) (17246,false)⟩,
⟨17555,.and [(17248,false),(17246,false)]⟩,
⟨17556,.eq (17249,false) (17247,false)⟩,
⟨17557,.eq (17556,false) (17555,true)⟩,
⟨17558,.majority (17247,true) (17249,true) (17555,true)⟩,
⟨17559,.eq (17252,false) (17250,false)⟩,
⟨17560,.and [(17252,false),(17250,false)]⟩,
⟨17561,.eq (17253,false) (17251,false)⟩,
⟨17562,.eq (17561,false) (17560,true)⟩,
⟨17563,.majority (17251,true) (17253,true) (17560,true)⟩,
⟨17564,.eq (17256,false) (17254,false)⟩,
⟨17565,.and [(17256,false),(17254,false)]⟩,
⟨17566,.eq (17257,false) (17255,false)⟩,
⟨17567,.eq (17566,false) (17565,true)⟩,
⟨17568,.majority (17255,true) (17257,true) (17565,true)⟩,
⟨17569,.eq (17260,false) (17258,false)⟩,
⟨17570,.and [(17260,false),(17258,false)]⟩,
⟨17571,.eq (17261,false) (17259,false)⟩,
⟨17572,.eq (17571,false) (17570,true)⟩,
⟨17573,.majority (17259,true) (17261,true) (17570,true)⟩,
⟨17574,.eq (17264,false) (17262,false)⟩,
⟨17575,.and [(17264,false),(17262,false)]⟩,
⟨17576,.eq (17265,false) (17263,false)⟩,
⟨17577,.eq (17576,false) (17575,true)⟩,
⟨17578,.majority (17263,true) (17265,true) (17575,true)⟩,
⟨17579,.eq (17268,false) (17266,false)⟩,
⟨17580,.and [(17268,false),(17266,false)]⟩,
⟨17581,.eq (17269,false) (17267,false)⟩,
⟨17582,.eq (17581,false) (17580,true)⟩,
⟨17583,.majority (17267,true) (17269,true) (17580,true)⟩,
⟨17584,.eq (17272,false) (17270,false)⟩,
⟨17585,.and [(17272,false),(17270,false)]⟩,
⟨17586,.eq (17273,false) (17271,false)⟩,
⟨17587,.eq (17586,false) (17585,true)⟩,
⟨17588,.majority (17271,true) (17273,true) (17585,true)⟩,
⟨17589,.eq (17276,false) (17274,false)⟩,
⟨17590,.and [(17276,false),(17274,false)]⟩,
⟨17591,.eq (17277,false) (17275,false)⟩,
⟨17592,.eq (17591,false) (17590,true)⟩,
⟨17593,.majority (17275,true) (17277,true) (17590,true)⟩,
⟨17594,.eq (17280,false) (17278,false)⟩,
⟨17595,.and [(17280,false),(17278,false)]⟩,
⟨17596,.eq (17281,false) (17279,false)⟩,
⟨17597,.eq (17596,false) (17595,true)⟩,
⟨17598,.majority (17279,true) (17281,true) (17595,true)⟩,
⟨17599,.eq (17284,false) (17282,false)⟩,
⟨17600,.and [(17284,false),(17282,false)]⟩,
⟨17601,.eq (17285,false) (17283,false)⟩,
⟨17602,.eq (17601,false) (17600,true)⟩,
⟨17603,.majority (17283,true) (17285,true) (17600,true)⟩,
⟨17604,.eq (17288,false) (17286,false)⟩,
⟨17605,.and [(17288,false),(17286,false)]⟩,
⟨17606,.eq (17289,false) (17287,false)⟩,
⟨17607,.eq (17606,false) (17605,true)⟩,
⟨17608,.majority (17287,true) (17289,true) (17605,true)⟩,
⟨17609,.eq (17292,false) (17290,false)⟩,
⟨17610,.and [(17292,false),(17290,false)]⟩,
⟨17611,.eq (17293,false) (17291,false)⟩,
⟨17612,.eq (17611,false) (17610,true)⟩,
⟨17613,.majority (17291,true) (17293,true) (17610,true)⟩,
⟨17614,.eq (17296,false) (17294,false)⟩,
⟨17615,.and [(17296,false),(17294,false)]⟩,
⟨17616,.eq (17297,false) (17295,false)⟩,
⟨17617,.eq (17616,false) (17615,true)⟩,
⟨17618,.majority (17295,true) (17297,true) (17615,true)⟩,
⟨17619,.eq (17300,false) (17298,false)⟩,
⟨17620,.and [(17300,false),(17298,false)]⟩,
⟨17621,.eq (17301,false) (17299,false)⟩,
⟨17622,.eq (17621,false) (17620,true)⟩,
⟨17623,.majority (17299,true) (17301,true) (17620,true)⟩,
⟨17624,.eq (17304,false) (17302,false)⟩,
⟨17625,.and [(17304,false),(17302,false)]⟩,
⟨17626,.eq (17305,false) (17303,false)⟩,
⟨17627,.eq (17626,false) (17625,true)⟩,
⟨17628,.majority (17303,true) (17305,true) (17625,true)⟩,
⟨17629,.eq (17308,false) (17306,false)⟩,
⟨17630,.and [(17308,false),(17306,false)]⟩,
⟨17631,.eq (17309,false) (17307,false)⟩,
⟨17632,.eq (17631,false) (17630,true)⟩,
⟨17633,.majority (17307,true) (17309,true) (17630,true)⟩,
⟨17634,.eq (17312,false) (17310,false)⟩,
⟨17635,.and [(17312,false),(17310,false)]⟩,
⟨17636,.eq (17313,false) (17311,false)⟩,
⟨17637,.eq (17636,false) (17635,true)⟩,
⟨17638,.majority (17311,true) (17313,true) (17635,true)⟩,
⟨17639,.eq (17316,false) (17314,false)⟩,
⟨17640,.and [(17316,false),(17314,false)]⟩,
⟨17641,.eq (17317,false) (17315,false)⟩,
⟨17642,.eq (17641,false) (17640,true)⟩,
⟨17643,.majority (17315,true) (17317,true) (17640,true)⟩,
⟨17644,.eq (17320,false) (17318,false)⟩,
⟨17645,.and [(17320,false),(17318,false)]⟩,
⟨17646,.eq (17321,false) (17319,false)⟩,
⟨17647,.eq (17646,false) (17645,true)⟩,
⟨17648,.majority (17319,true) (17321,true) (17645,true)⟩,
⟨17649,.eq (17324,false) (17322,false)⟩,
⟨17650,.and [(17324,false),(17322,false)]⟩,
⟨17651,.eq (17325,false) (17323,false)⟩,
⟨17652,.eq (17651,false) (17650,true)⟩,
⟨17653,.majority (17323,true) (17325,true) (17650,true)⟩,
⟨17654,.eq (17328,false) (17326,false)⟩,
⟨17655,.and [(17328,false),(17326,false)]⟩,
⟨17656,.eq (17329,false) (17327,false)⟩,
⟨17657,.eq (17656,false) (17655,true)⟩,
⟨17658,.majority (17327,true) (17329,true) (17655,true)⟩,
⟨17659,.eq (17332,false) (17330,false)⟩,
⟨17660,.and [(17332,false),(17330,false)]⟩,
⟨17661,.eq (17333,false) (17331,false)⟩,
⟨17662,.eq (17661,false) (17660,true)⟩,
⟨17663,.majority (17331,true) (17333,true) (17660,true)⟩,
⟨17664,.eq (17336,false) (17334,false)⟩,
⟨17665,.and [(17336,false),(17334,false)]⟩,
⟨17666,.eq (17337,false) (17335,false)⟩,
⟨17667,.eq (17666,false) (17665,true)⟩,
⟨17668,.majority (17335,true) (17337,true) (17665,true)⟩,
⟨17669,.eq (17340,false) (17338,false)⟩,
⟨17670,.and [(17340,false),(17338,false)]⟩,
⟨17671,.eq (17341,false) (17339,false)⟩,
⟨17672,.eq (17671,false) (17670,true)⟩,
⟨17673,.majority (17339,true) (17341,true) (17670,true)⟩,
⟨17674,.eq (17344,false) (17342,false)⟩,
⟨17675,.and [(17344,false),(17342,false)]⟩,
⟨17676,.eq (17345,false) (17343,false)⟩,
⟨17677,.eq (17676,false) (17675,true)⟩,
⟨17678,.majority (17343,true) (17345,true) (17675,true)⟩,
⟨17679,.eq (17348,false) (17346,false)⟩,
⟨17680,.and [(17348,false),(17346,false)]⟩,
⟨17681,.eq (17349,false) (17347,false)⟩,
⟨17682,.eq (17681,false) (17680,true)⟩,
⟨17683,.majority (17347,true) (17349,true) (17680,true)⟩,
⟨17684,.eq (17352,false) (17350,false)⟩,
⟨17685,.and [(17352,false),(17350,false)]⟩,
⟨17686,.eq (17353,false) (17351,false)⟩,
⟨17687,.eq (17686,false) (17685,true)⟩,
⟨17688,.majority (17351,true) (17353,true) (17685,true)⟩,
⟨17689,.eq (17356,false) (17354,false)⟩,
⟨17690,.and [(17356,false),(17354,false)]⟩,
⟨17691,.eq (17357,false) (17355,false)⟩,
⟨17692,.eq (17691,false) (17690,true)⟩,
⟨17693,.majority (17355,true) (17357,true) (17690,true)⟩,
⟨17694,.eq (17360,false) (17358,false)⟩,
⟨17695,.and [(17360,false),(17358,false)]⟩,
⟨17696,.eq (17361,false) (17359,false)⟩,
⟨17697,.eq (17696,false) (17695,true)⟩,
⟨17698,.majority (17359,true) (17361,true) (17695,true)⟩,
⟨17699,.eq (17364,false) (17362,false)⟩,
⟨17700,.and [(17364,false),(17362,false)]⟩,
⟨17701,.eq (17365,false) (17363,false)⟩,
⟨17702,.eq (17701,false) (17700,true)⟩,
⟨17703,.majority (17363,true) (17365,true) (17700,true)⟩,
⟨17704,.eq (17368,false) (17366,false)⟩,
⟨17705,.and [(17368,false),(17366,false)]⟩,
⟨17706,.eq (17369,false) (17367,false)⟩,
⟨17707,.eq (17706,false) (17705,true)⟩,
⟨17708,.majority (17367,true) (17369,true) (17705,true)⟩,
⟨17709,.eq (17372,false) (17370,false)⟩,
⟨17710,.and [(17372,false),(17370,false)]⟩,
⟨17711,.eq (17373,false) (17371,false)⟩,
⟨17712,.eq (17711,false) (17710,true)⟩,
⟨17713,.majority (17371,true) (17373,true) (17710,true)⟩,
⟨17714,.eq (17376,false) (17374,false)⟩,
⟨17715,.and [(17376,false),(17374,false)]⟩,
⟨17716,.eq (17377,false) (17375,false)⟩,
⟨17717,.eq (17716,false) (17715,true)⟩,
⟨17718,.majority (17375,true) (17377,true) (17715,true)⟩,
⟨17719,.eq (17380,false) (17378,false)⟩,
⟨17720,.and [(17380,false),(17378,false)]⟩,
⟨17721,.eq (17381,false) (17379,false)⟩,
⟨17722,.eq (17721,false) (17720,true)⟩,
⟨17723,.majority (17379,true) (17381,true) (17720,true)⟩,
⟨17724,.eq (17384,false) (17382,false)⟩,
⟨17725,.and [(17384,false),(17382,false)]⟩,
⟨17726,.eq (17385,false) (17383,false)⟩,
⟨17727,.eq (17726,false) (17725,true)⟩,
⟨17728,.majority (17383,true) (17385,true) (17725,true)⟩,
⟨17729,.eq (17388,false) (17386,false)⟩,
⟨17730,.and [(17388,false),(17386,false)]⟩,
⟨17731,.eq (17389,false) (17387,false)⟩,
⟨17732,.eq (17731,false) (17730,true)⟩,
⟨17733,.majority (17387,true) (17389,true) (17730,true)⟩,
⟨17734,.eq (17392,false) (17390,false)⟩,
⟨17735,.and [(17392,false),(17390,false)]⟩,
⟨17736,.eq (17393,false) (17391,false)⟩,
⟨17737,.eq (17736,false) (17735,true)⟩,
⟨17738,.majority (17391,true) (17393,true) (17735,true)⟩,
⟨17739,.eq (17396,false) (17394,false)⟩,
⟨17740,.and [(17396,false),(17394,false)]⟩,
⟨17741,.eq (17397,false) (17395,false)⟩,
⟨17742,.eq (17741,false) (17740,true)⟩,
⟨17743,.majority (17395,true) (17397,true) (17740,true)⟩,
⟨17744,.eq (17400,false) (17398,false)⟩,
⟨17745,.and [(17400,false),(17398,false)]⟩,
⟨17746,.eq (17401,false) (17399,false)⟩,
⟨17747,.eq (17746,false) (17745,true)⟩,
⟨17748,.majority (17399,true) (17401,true) (17745,true)⟩,
⟨17749,.eq (17404,false) (17402,false)⟩,
⟨17750,.and [(17404,false),(17402,false)]⟩,
⟨17751,.eq (17405,false) (17403,false)⟩,
⟨17752,.eq (17751,false) (17750,true)⟩,
⟨17753,.majority (17403,true) (17405,true) (17750,true)⟩,
⟨17754,.eq (17408,false) (17406,false)⟩,
⟨17755,.and [(17408,false),(17406,false)]⟩,
⟨17756,.eq (17409,false) (17407,false)⟩,
⟨17757,.eq (17756,false) (17755,true)⟩,
⟨17758,.majority (17407,true) (17409,true) (17755,true)⟩,
⟨17759,.eq (17412,false) (17410,false)⟩,
⟨17760,.and [(17412,false),(17410,false)]⟩,
⟨17761,.eq (17413,false) (17411,false)⟩,
⟨17762,.eq (17761,false) (17760,true)⟩,
⟨17763,.majority (17411,true) (17413,true) (17760,true)⟩,
⟨17764,.eq (17419,false) (17414,false)⟩,
⟨17765,.and [(17419,false),(17414,false)]⟩,
⟨17766,.eq (17422,false) (17417,false)⟩,
⟨17767,.eq (17766,false) (17765,true)⟩,
⟨17768,.majority (17422,false) (17417,false) (17765,true)⟩,
⟨17769,.eq (17423,false) (17418,false)⟩,
⟨17770,.eq (17769,false) (17768,true)⟩,
⟨17771,.majority (17418,true) (17423,true) (17768,true)⟩,
⟨17772,.eq (17429,false) (17424,false)⟩,
⟨17773,.and [(17429,false),(17424,false)]⟩,
⟨17774,.eq (17432,false) (17427,false)⟩,
⟨17775,.eq (17774,false) (17773,true)⟩,
⟨17776,.majority (17432,false) (17427,false) (17773,true)⟩,
⟨17777,.eq (17433,false) (17428,false)⟩,
⟨17778,.eq (17777,false) (17776,true)⟩,
⟨17779,.majority (17428,true) (17433,true) (17776,true)⟩,
⟨17780,.eq (17439,false) (17434,false)⟩,
⟨17781,.and [(17439,false),(17434,false)]⟩,
⟨17782,.eq (17442,false) (17437,false)⟩,
⟨17783,.eq (17782,false) (17781,true)⟩,
⟨17784,.majority (17442,false) (17437,false) (17781,true)⟩,
⟨17785,.eq (17443,false) (17438,false)⟩,
⟨17786,.eq (17785,false) (17784,true)⟩,
⟨17787,.majority (17438,true) (17443,true) (17784,true)⟩,
⟨17788,.eq (17449,false) (17444,false)⟩,
⟨17789,.and [(17449,false),(17444,false)]⟩,
⟨17790,.eq (17452,false) (17447,false)⟩,
⟨17791,.eq (17790,false) (17789,true)⟩,
⟨17792,.majority (17452,false) (17447,false) (17789,true)⟩,
⟨17793,.eq (17453,false) (17448,false)⟩,
⟨17794,.eq (17793,false) (17792,true)⟩,
⟨17795,.majority (17448,true) (17453,true) (17792,true)⟩,
⟨17796,.eq (17459,false) (17454,false)⟩,
⟨17797,.and [(17459,false),(17454,false)]⟩,
⟨17798,.eq (17462,false) (17457,false)⟩,
⟨17799,.eq (17798,false) (17797,true)⟩,
⟨17800,.majority (17462,false) (17457,false) (17797,true)⟩,
⟨17801,.eq (17463,false) (17458,false)⟩,
⟨17802,.eq (17801,false) (17800,true)⟩,
⟨17803,.majority (17458,true) (17463,true) (17800,true)⟩,
⟨17804,.eq (17469,false) (17464,false)⟩,
⟨17805,.and [(17469,false),(17464,false)]⟩,
⟨17806,.eq (17472,false) (17467,false)⟩,
⟨17807,.eq (17806,false) (17805,true)⟩,
⟨17808,.majority (17472,false) (17467,false) (17805,true)⟩,
⟨17809,.eq (17473,false) (17468,false)⟩,
⟨17810,.eq (17809,false) (17808,true)⟩,
⟨17811,.majority (17468,true) (17473,true) (17808,true)⟩,
⟨17812,.eq (17479,false) (17474,false)⟩,
⟨17813,.and [(17479,false),(17474,false)]⟩,
⟨17814,.eq (17482,false) (17477,false)⟩,
⟨17815,.eq (17814,false) (17813,true)⟩,
⟨17816,.majority (17482,false) (17477,false) (17813,true)⟩,
⟨17817,.eq (17483,false) (17478,false)⟩,
⟨17818,.eq (17817,false) (17816,true)⟩,
⟨17819,.majority (17478,true) (17483,true) (17816,true)⟩,
⟨17820,.eq (17489,false) (17484,false)⟩,
⟨17821,.and [(17489,false),(17484,false)]⟩,
⟨17822,.eq (17492,false) (17487,false)⟩,
⟨17823,.eq (17822,false) (17821,true)⟩,
⟨17824,.majority (17492,false) (17487,false) (17821,true)⟩,
⟨17825,.eq (17493,false) (17488,false)⟩,
⟨17826,.eq (17825,false) (17824,true)⟩,
⟨17827,.majority (17488,true) (17493,true) (17824,true)⟩,
⟨17828,.eq (17499,false) (17494,false)⟩,
⟨17829,.and [(17499,false),(17494,false)]⟩,
⟨17830,.eq (17502,false) (17497,false)⟩,
⟨17831,.eq (17830,false) (17829,true)⟩,
⟨17832,.majority (17502,false) (17497,false) (17829,true)⟩,
⟨17833,.eq (17503,false) (17498,false)⟩,
⟨17834,.eq (17833,false) (17832,true)⟩,
⟨17835,.majority (17498,true) (17503,true) (17832,true)⟩,
⟨17836,.eq (17509,false) (17504,false)⟩,
⟨17837,.and [(17509,false),(17504,false)]⟩,
⟨17838,.eq (17512,false) (17507,false)⟩,
⟨17839,.eq (17838,false) (17837,true)⟩,
⟨17840,.majority (17512,false) (17507,false) (17837,true)⟩,
⟨17841,.eq (17513,false) (17508,false)⟩,
⟨17842,.eq (17841,false) (17840,true)⟩,
⟨17843,.majority (17508,true) (17513,true) (17840,true)⟩,
⟨17844,.eq (17519,false) (17514,false)⟩,
⟨17845,.and [(17519,false),(17514,false)]⟩,
⟨17846,.eq (17522,false) (17517,false)⟩,
⟨17847,.eq (17846,false) (17845,true)⟩,
⟨17848,.majority (17522,false) (17517,false) (17845,true)⟩,
⟨17849,.eq (17523,false) (17518,false)⟩,
⟨17850,.eq (17849,false) (17848,true)⟩,
⟨17851,.majority (17518,true) (17523,true) (17848,true)⟩,
⟨17852,.eq (17529,false) (17524,false)⟩,
⟨17853,.and [(17529,false),(17524,false)]⟩,
⟨17854,.eq (17532,false) (17527,false)⟩,
⟨17855,.eq (17854,false) (17853,true)⟩,
⟨17856,.majority (17532,false) (17527,false) (17853,true)⟩,
⟨17857,.eq (17533,false) (17528,false)⟩,
⟨17858,.eq (17857,false) (17856,true)⟩,
⟨17859,.majority (17528,true) (17533,true) (17856,true)⟩,
⟨17860,.eq (17539,false) (17534,false)⟩,
⟨17861,.and [(17539,false),(17534,false)]⟩,
⟨17862,.eq (17542,false) (17537,false)⟩,
⟨17863,.eq (17862,false) (17861,true)⟩,
⟨17864,.majority (17542,false) (17537,false) (17861,true)⟩,
⟨17865,.eq (17543,false) (17538,false)⟩,
⟨17866,.eq (17865,false) (17864,true)⟩,
⟨17867,.majority (17538,true) (17543,true) (17864,true)⟩,
⟨17868,.eq (17549,false) (17544,false)⟩,
⟨17869,.and [(17549,false),(17544,false)]⟩,
⟨17870,.eq (17552,false) (17547,false)⟩,
⟨17871,.eq (17870,false) (17869,true)⟩,
⟨17872,.majority (17552,false) (17547,false) (17869,true)⟩,
⟨17873,.eq (17553,false) (17548,false)⟩,
⟨17874,.eq (17873,false) (17872,true)⟩,
⟨17875,.majority (17548,true) (17553,true) (17872,true)⟩,
⟨17876,.eq (17559,false) (17554,false)⟩,
⟨17877,.and [(17559,false),(17554,false)]⟩,
⟨17878,.eq (17562,false) (17557,false)⟩,
⟨17879,.eq (17878,false) (17877,true)⟩,
⟨17880,.majority (17562,false) (17557,false) (17877,true)⟩,
⟨17881,.eq (17563,false) (17558,false)⟩,
⟨17882,.eq (17881,false) (17880,true)⟩,
⟨17883,.majority (17558,true) (17563,true) (17880,true)⟩,
⟨17884,.eq (17569,false) (17564,false)⟩,
⟨17885,.and [(17569,false),(17564,false)]⟩,
⟨17886,.eq (17572,false) (17567,false)⟩,
⟨17887,.eq (17886,false) (17885,true)⟩,
⟨17888,.majority (17572,false) (17567,false) (17885,true)⟩,
⟨17889,.eq (17573,false) (17568,false)⟩,
⟨17890,.eq (17889,false) (17888,true)⟩,
⟨17891,.majority (17568,true) (17573,true) (17888,true)⟩,
⟨17892,.eq (17579,false) (17574,false)⟩,
⟨17893,.and [(17579,false),(17574,false)]⟩,
⟨17894,.eq (17582,false) (17577,false)⟩,
⟨17895,.eq (17894,false) (17893,true)⟩,
⟨17896,.majority (17582,false) (17577,false) (17893,true)⟩,
⟨17897,.eq (17583,false) (17578,false)⟩,
⟨17898,.eq (17897,false) (17896,true)⟩,
⟨17899,.majority (17578,true) (17583,true) (17896,true)⟩,
⟨17900,.eq (17589,false) (17584,false)⟩,
⟨17901,.and [(17589,false),(17584,false)]⟩,
⟨17902,.eq (17592,false) (17587,false)⟩,
⟨17903,.eq (17902,false) (17901,true)⟩,
⟨17904,.majority (17592,false) (17587,false) (17901,true)⟩,
⟨17905,.eq (17593,false) (17588,false)⟩,
⟨17906,.eq (17905,false) (17904,true)⟩,
⟨17907,.majority (17588,true) (17593,true) (17904,true)⟩,
⟨17908,.eq (17599,false) (17594,false)⟩,
⟨17909,.and [(17599,false),(17594,false)]⟩,
⟨17910,.eq (17602,false) (17597,false)⟩,
⟨17911,.eq (17910,false) (17909,true)⟩,
⟨17912,.majority (17602,false) (17597,false) (17909,true)⟩,
⟨17913,.eq (17603,false) (17598,false)⟩,
⟨17914,.eq (17913,false) (17912,true)⟩,
⟨17915,.majority (17598,true) (17603,true) (17912,true)⟩,
⟨17916,.eq (17609,false) (17604,false)⟩,
⟨17917,.and [(17609,false),(17604,false)]⟩,
⟨17918,.eq (17612,false) (17607,false)⟩,
⟨17919,.eq (17918,false) (17917,true)⟩,
⟨17920,.majority (17612,false) (17607,false) (17917,true)⟩,
⟨17921,.eq (17613,false) (17608,false)⟩,
⟨17922,.eq (17921,false) (17920,true)⟩,
⟨17923,.majority (17608,true) (17613,true) (17920,true)⟩,
⟨17924,.eq (17619,false) (17614,false)⟩,
⟨17925,.and [(17619,false),(17614,false)]⟩,
⟨17926,.eq (17622,false) (17617,false)⟩,
⟨17927,.eq (17926,false) (17925,true)⟩,
⟨17928,.majority (17622,false) (17617,false) (17925,true)⟩,
⟨17929,.eq (17623,false) (17618,false)⟩,
⟨17930,.eq (17929,false) (17928,true)⟩,
⟨17931,.majority (17618,true) (17623,true) (17928,true)⟩,
⟨17932,.eq (17629,false) (17624,false)⟩,
⟨17933,.and [(17629,false),(17624,false)]⟩,
⟨17934,.eq (17632,false) (17627,false)⟩,
⟨17935,.eq (17934,false) (17933,true)⟩,
⟨17936,.majority (17632,false) (17627,false) (17933,true)⟩,
⟨17937,.eq (17633,false) (17628,false)⟩,
⟨17938,.eq (17937,false) (17936,true)⟩,
⟨17939,.majority (17628,true) (17633,true) (17936,true)⟩,
⟨17940,.eq (17639,false) (17634,false)⟩,
⟨17941,.and [(17639,false),(17634,false)]⟩,
⟨17942,.eq (17642,false) (17637,false)⟩,
⟨17943,.eq (17942,false) (17941,true)⟩,
⟨17944,.majority (17642,false) (17637,false) (17941,true)⟩,
⟨17945,.eq (17643,false) (17638,false)⟩,
⟨17946,.eq (17945,false) (17944,true)⟩,
⟨17947,.majority (17638,true) (17643,true) (17944,true)⟩,
⟨17948,.eq (17649,false) (17644,false)⟩,
⟨17949,.and [(17649,false),(17644,false)]⟩,
⟨17950,.eq (17652,false) (17647,false)⟩,
⟨17951,.eq (17950,false) (17949,true)⟩,
⟨17952,.majority (17652,false) (17647,false) (17949,true)⟩,
⟨17953,.eq (17653,false) (17648,false)⟩,
⟨17954,.eq (17953,false) (17952,true)⟩,
⟨17955,.majority (17648,true) (17653,true) (17952,true)⟩,
⟨17956,.eq (17659,false) (17654,false)⟩,
⟨17957,.and [(17659,false),(17654,false)]⟩,
⟨17958,.eq (17662,false) (17657,false)⟩,
⟨17959,.eq (17958,false) (17957,true)⟩,
⟨17960,.majority (17662,false) (17657,false) (17957,true)⟩,
⟨17961,.eq (17663,false) (17658,false)⟩,
⟨17962,.eq (17961,false) (17960,true)⟩,
⟨17963,.majority (17658,true) (17663,true) (17960,true)⟩,
⟨17964,.eq (17669,false) (17664,false)⟩,
⟨17965,.and [(17669,false),(17664,false)]⟩,
⟨17966,.eq (17672,false) (17667,false)⟩,
⟨17967,.eq (17966,false) (17965,true)⟩,
⟨17968,.majority (17672,false) (17667,false) (17965,true)⟩,
⟨17969,.eq (17673,false) (17668,false)⟩,
⟨17970,.eq (17969,false) (17968,true)⟩,
⟨17971,.majority (17668,true) (17673,true) (17968,true)⟩,
⟨17972,.eq (17679,false) (17674,false)⟩,
⟨17973,.and [(17679,false),(17674,false)]⟩,
⟨17974,.eq (17682,false) (17677,false)⟩,
⟨17975,.eq (17974,false) (17973,true)⟩,
⟨17976,.majority (17682,false) (17677,false) (17973,true)⟩,
⟨17977,.eq (17683,false) (17678,false)⟩,
⟨17978,.eq (17977,false) (17976,true)⟩,
⟨17979,.majority (17678,true) (17683,true) (17976,true)⟩,
⟨17980,.eq (17689,false) (17684,false)⟩,
⟨17981,.and [(17689,false),(17684,false)]⟩,
⟨17982,.eq (17692,false) (17687,false)⟩,
⟨17983,.eq (17982,false) (17981,true)⟩,
⟨17984,.majority (17692,false) (17687,false) (17981,true)⟩,
⟨17985,.eq (17693,false) (17688,false)⟩,
⟨17986,.eq (17985,false) (17984,true)⟩,
⟨17987,.majority (17688,true) (17693,true) (17984,true)⟩,
⟨17988,.eq (17699,false) (17694,false)⟩,
⟨17989,.and [(17699,false),(17694,false)]⟩,
⟨17990,.eq (17702,false) (17697,false)⟩,
⟨17991,.eq (17990,false) (17989,true)⟩,
⟨17992,.majority (17702,false) (17697,false) (17989,true)⟩,
⟨17993,.eq (17703,false) (17698,false)⟩,
⟨17994,.eq (17993,false) (17992,true)⟩,
⟨17995,.majority (17698,true) (17703,true) (17992,true)⟩,
⟨17996,.eq (17709,false) (17704,false)⟩,
⟨17997,.and [(17709,false),(17704,false)]⟩,
⟨17998,.eq (17712,false) (17707,false)⟩,
⟨17999,.eq (17998,false) (17997,true)⟩,
⟨18000,.majority (17712,false) (17707,false) (17997,true)⟩,
⟨18001,.eq (17713,false) (17708,false)⟩,
⟨18002,.eq (18001,false) (18000,true)⟩,
⟨18003,.majority (17708,true) (17713,true) (18000,true)⟩,
⟨18004,.eq (17719,false) (17714,false)⟩,
⟨18005,.and [(17719,false),(17714,false)]⟩,
⟨18006,.eq (17722,false) (17717,false)⟩,
⟨18007,.eq (18006,false) (18005,true)⟩,
⟨18008,.majority (17722,false) (17717,false) (18005,true)⟩,
⟨18009,.eq (17723,false) (17718,false)⟩,
⟨18010,.eq (18009,false) (18008,true)⟩,
⟨18011,.majority (17718,true) (17723,true) (18008,true)⟩,
⟨18012,.eq (17729,false) (17724,false)⟩,
⟨18013,.and [(17729,false),(17724,false)]⟩,
⟨18014,.eq (17732,false) (17727,false)⟩,
⟨18015,.eq (18014,false) (18013,true)⟩,
⟨18016,.majority (17732,false) (17727,false) (18013,true)⟩,
⟨18017,.eq (17733,false) (17728,false)⟩,
⟨18018,.eq (18017,false) (18016,true)⟩,
⟨18019,.majority (17728,true) (17733,true) (18016,true)⟩,
⟨18020,.eq (17739,false) (17734,false)⟩,
⟨18021,.and [(17739,false),(17734,false)]⟩,
⟨18022,.eq (17742,false) (17737,false)⟩,
⟨18023,.eq (18022,false) (18021,true)⟩,
⟨18024,.majority (17742,false) (17737,false) (18021,true)⟩,
⟨18025,.eq (17743,false) (17738,false)⟩,
⟨18026,.eq (18025,false) (18024,true)⟩,
⟨18027,.majority (17738,true) (17743,true) (18024,true)⟩,
⟨18028,.eq (17749,false) (17744,false)⟩,
⟨18029,.and [(17749,false),(17744,false)]⟩,
⟨18030,.eq (17752,false) (17747,false)⟩,
⟨18031,.eq (18030,false) (18029,true)⟩,
⟨18032,.majority (17752,false) (17747,false) (18029,true)⟩,
⟨18033,.eq (17753,false) (17748,false)⟩,
⟨18034,.eq (18033,false) (18032,true)⟩,
⟨18035,.majority (17748,true) (17753,true) (18032,true)⟩,
⟨18036,.eq (17759,false) (17754,false)⟩,
⟨18037,.and [(17759,false),(17754,false)]⟩,
⟨18038,.eq (17762,false) (17757,false)⟩,
⟨18039,.eq (18038,false) (18037,true)⟩,
⟨18040,.majority (17762,false) (17757,false) (18037,true)⟩,
⟨18041,.eq (17763,false) (17758,false)⟩,
⟨18042,.eq (18041,false) (18040,true)⟩,
⟨18043,.majority (17758,true) (17763,true) (18040,true)⟩,
⟨18044,.eq (17772,false) (17764,false)⟩,
⟨18045,.and [(17772,false),(17764,false)]⟩,
⟨18046,.eq (17775,false) (17767,false)⟩,
⟨18047,.eq (18046,false) (18045,true)⟩,
⟨18048,.majority (17775,false) (17767,false) (18045,true)⟩,
⟨18049,.eq (17778,false) (17770,false)⟩,
⟨18050,.eq (18049,false) (18048,true)⟩,
⟨18051,.majority (17778,false) (17770,false) (18048,true)⟩,
⟨18052,.eq (17779,false) (17771,false)⟩,
⟨18053,.eq (18052,false) (18051,true)⟩,
⟨18054,.majority (17771,true) (17779,true) (18051,true)⟩,
⟨18055,.eq (17788,false) (17780,false)⟩,
⟨18056,.and [(17788,false),(17780,false)]⟩,
⟨18057,.eq (17791,false) (17783,false)⟩,
⟨18058,.eq (18057,false) (18056,true)⟩,
⟨18059,.majority (17791,false) (17783,false) (18056,true)⟩,
⟨18060,.eq (17794,false) (17786,false)⟩,
⟨18061,.eq (18060,false) (18059,true)⟩,
⟨18062,.majority (17794,false) (17786,false) (18059,true)⟩,
⟨18063,.eq (17795,false) (17787,false)⟩,
⟨18064,.eq (18063,false) (18062,true)⟩,
⟨18065,.majority (17787,true) (17795,true) (18062,true)⟩,
⟨18066,.eq (17804,false) (17796,false)⟩,
⟨18067,.and [(17804,false),(17796,false)]⟩,
⟨18068,.eq (17807,false) (17799,false)⟩,
⟨18069,.eq (18068,false) (18067,true)⟩,
⟨18070,.majority (17807,false) (17799,false) (18067,true)⟩,
⟨18071,.eq (17810,false) (17802,false)⟩,
⟨18072,.eq (18071,false) (18070,true)⟩,
⟨18073,.majority (17810,false) (17802,false) (18070,true)⟩,
⟨18074,.eq (17811,false) (17803,false)⟩,
⟨18075,.eq (18074,false) (18073,true)⟩,
⟨18076,.majority (17803,true) (17811,true) (18073,true)⟩,
⟨18077,.eq (17820,false) (17812,false)⟩,
⟨18078,.and [(17820,false),(17812,false)]⟩,
⟨18079,.eq (17823,false) (17815,false)⟩,
⟨18080,.eq (18079,false) (18078,true)⟩,
⟨18081,.majority (17823,false) (17815,false) (18078,true)⟩,
⟨18082,.eq (17826,false) (17818,false)⟩,
⟨18083,.eq (18082,false) (18081,true)⟩,
⟨18084,.majority (17826,false) (17818,false) (18081,true)⟩,
⟨18085,.eq (17827,false) (17819,false)⟩,
⟨18086,.eq (18085,false) (18084,true)⟩,
⟨18087,.majority (17819,true) (17827,true) (18084,true)⟩,
⟨18088,.eq (17836,false) (17828,false)⟩,
⟨18089,.and [(17836,false),(17828,false)]⟩,
⟨18090,.eq (17839,false) (17831,false)⟩,
⟨18091,.eq (18090,false) (18089,true)⟩,
⟨18092,.majority (17839,false) (17831,false) (18089,true)⟩,
⟨18093,.eq (17842,false) (17834,false)⟩,
⟨18094,.eq (18093,false) (18092,true)⟩,
⟨18095,.majority (17842,false) (17834,false) (18092,true)⟩,
⟨18096,.eq (17843,false) (17835,false)⟩,
⟨18097,.eq (18096,false) (18095,true)⟩,
⟨18098,.majority (17835,true) (17843,true) (18095,true)⟩,
⟨18099,.eq (17852,false) (17844,false)⟩,
⟨18100,.and [(17852,false),(17844,false)]⟩,
⟨18101,.eq (17855,false) (17847,false)⟩,
⟨18102,.eq (18101,false) (18100,true)⟩,
⟨18103,.majority (17855,false) (17847,false) (18100,true)⟩,
⟨18104,.eq (17858,false) (17850,false)⟩,
⟨18105,.eq (18104,false) (18103,true)⟩,
⟨18106,.majority (17858,false) (17850,false) (18103,true)⟩,
⟨18107,.eq (17859,false) (17851,false)⟩,
⟨18108,.eq (18107,false) (18106,true)⟩,
⟨18109,.majority (17851,true) (17859,true) (18106,true)⟩,
⟨18110,.eq (17868,false) (17860,false)⟩,
⟨18111,.and [(17868,false),(17860,false)]⟩,
⟨18112,.eq (17871,false) (17863,false)⟩,
⟨18113,.eq (18112,false) (18111,true)⟩,
⟨18114,.majority (17871,false) (17863,false) (18111,true)⟩,
⟨18115,.eq (17874,false) (17866,false)⟩,
⟨18116,.eq (18115,false) (18114,true)⟩,
⟨18117,.majority (17874,false) (17866,false) (18114,true)⟩,
⟨18118,.eq (17875,false) (17867,false)⟩,
⟨18119,.eq (18118,false) (18117,true)⟩,
⟨18120,.majority (17867,true) (17875,true) (18117,true)⟩,
⟨18121,.eq (17884,false) (17876,false)⟩,
⟨18122,.and [(17884,false),(17876,false)]⟩,
⟨18123,.eq (17887,false) (17879,false)⟩,
⟨18124,.eq (18123,false) (18122,true)⟩,
⟨18125,.majority (17887,false) (17879,false) (18122,true)⟩,
⟨18126,.eq (17890,false) (17882,false)⟩,
⟨18127,.eq (18126,false) (18125,true)⟩,
⟨18128,.majority (17890,false) (17882,false) (18125,true)⟩,
⟨18129,.eq (17891,false) (17883,false)⟩,
⟨18130,.eq (18129,false) (18128,true)⟩,
⟨18131,.majority (17883,true) (17891,true) (18128,true)⟩,
⟨18132,.eq (17900,false) (17892,false)⟩,
⟨18133,.and [(17900,false),(17892,false)]⟩,
⟨18134,.eq (17903,false) (17895,false)⟩,
⟨18135,.eq (18134,false) (18133,true)⟩,
⟨18136,.majority (17903,false) (17895,false) (18133,true)⟩,
⟨18137,.eq (17906,false) (17898,false)⟩,
⟨18138,.eq (18137,false) (18136,true)⟩,
⟨18139,.majority (17906,false) (17898,false) (18136,true)⟩,
⟨18140,.eq (17907,false) (17899,false)⟩,
⟨18141,.eq (18140,false) (18139,true)⟩,
⟨18142,.majority (17899,true) (17907,true) (18139,true)⟩,
⟨18143,.eq (17916,false) (17908,false)⟩,
⟨18144,.and [(17916,false),(17908,false)]⟩,
⟨18145,.eq (17919,false) (17911,false)⟩,
⟨18146,.eq (18145,false) (18144,true)⟩,
⟨18147,.majority (17919,false) (17911,false) (18144,true)⟩,
⟨18148,.eq (17922,false) (17914,false)⟩,
⟨18149,.eq (18148,false) (18147,true)⟩,
⟨18150,.majority (17922,false) (17914,false) (18147,true)⟩,
⟨18151,.eq (17923,false) (17915,false)⟩,
⟨18152,.eq (18151,false) (18150,true)⟩,
⟨18153,.majority (17915,true) (17923,true) (18150,true)⟩,
⟨18154,.eq (17932,false) (17924,false)⟩,
⟨18155,.and [(17932,false),(17924,false)]⟩,
⟨18156,.eq (17935,false) (17927,false)⟩,
⟨18157,.eq (18156,false) (18155,true)⟩,
⟨18158,.majority (17935,false) (17927,false) (18155,true)⟩,
⟨18159,.eq (17938,false) (17930,false)⟩,
⟨18160,.eq (18159,false) (18158,true)⟩,
⟨18161,.majority (17938,false) (17930,false) (18158,true)⟩,
⟨18162,.eq (17939,false) (17931,false)⟩,
⟨18163,.eq (18162,false) (18161,true)⟩,
⟨18164,.majority (17931,true) (17939,true) (18161,true)⟩,
⟨18165,.eq (17948,false) (17940,false)⟩,
⟨18166,.and [(17948,false),(17940,false)]⟩,
⟨18167,.eq (17951,false) (17943,false)⟩,
⟨18168,.eq (18167,false) (18166,true)⟩,
⟨18169,.majority (17951,false) (17943,false) (18166,true)⟩,
⟨18170,.eq (17954,false) (17946,false)⟩,
⟨18171,.eq (18170,false) (18169,true)⟩,
⟨18172,.majority (17954,false) (17946,false) (18169,true)⟩,
⟨18173,.eq (17955,false) (17947,false)⟩,
⟨18174,.eq (18173,false) (18172,true)⟩,
⟨18175,.majority (17947,true) (17955,true) (18172,true)⟩,
⟨18176,.eq (17964,false) (17956,false)⟩,
⟨18177,.and [(17964,false),(17956,false)]⟩,
⟨18178,.eq (17967,false) (17959,false)⟩,
⟨18179,.eq (18178,false) (18177,true)⟩,
⟨18180,.majority (17967,false) (17959,false) (18177,true)⟩,
⟨18181,.eq (17970,false) (17962,false)⟩,
⟨18182,.eq (18181,false) (18180,true)⟩,
⟨18183,.majority (17970,false) (17962,false) (18180,true)⟩,
⟨18184,.eq (17971,false) (17963,false)⟩,
⟨18185,.eq (18184,false) (18183,true)⟩,
⟨18186,.majority (17963,true) (17971,true) (18183,true)⟩,
⟨18187,.eq (17980,false) (17972,false)⟩,
⟨18188,.and [(17980,false),(17972,false)]⟩,
⟨18189,.eq (17983,false) (17975,false)⟩,
⟨18190,.eq (18189,false) (18188,true)⟩,
⟨18191,.majority (17983,false) (17975,false) (18188,true)⟩,
⟨18192,.eq (17986,false) (17978,false)⟩,
⟨18193,.eq (18192,false) (18191,true)⟩,
⟨18194,.majority (17986,false) (17978,false) (18191,true)⟩,
⟨18195,.eq (17987,false) (17979,false)⟩,
⟨18196,.eq (18195,false) (18194,true)⟩,
⟨18197,.majority (17979,true) (17987,true) (18194,true)⟩,
⟨18198,.eq (17996,false) (17988,false)⟩,
⟨18199,.and [(17996,false),(17988,false)]⟩,
⟨18200,.eq (17999,false) (17991,false)⟩,
⟨18201,.eq (18200,false) (18199,true)⟩,
⟨18202,.majority (17999,false) (17991,false) (18199,true)⟩,
⟨18203,.eq (18002,false) (17994,false)⟩,
⟨18204,.eq (18203,false) (18202,true)⟩,
⟨18205,.majority (18002,false) (17994,false) (18202,true)⟩,
⟨18206,.eq (18003,false) (17995,false)⟩,
⟨18207,.eq (18206,false) (18205,true)⟩,
⟨18208,.majority (17995,true) (18003,true) (18205,true)⟩,
⟨18209,.eq (18012,false) (18004,false)⟩,
⟨18210,.and [(18012,false),(18004,false)]⟩,
⟨18211,.eq (18015,false) (18007,false)⟩,
⟨18212,.eq (18211,false) (18210,true)⟩,
⟨18213,.majority (18015,false) (18007,false) (18210,true)⟩,
⟨18214,.eq (18018,false) (18010,false)⟩,
⟨18215,.eq (18214,false) (18213,true)⟩,
⟨18216,.majority (18018,false) (18010,false) (18213,true)⟩,
⟨18217,.eq (18019,false) (18011,false)⟩,
⟨18218,.eq (18217,false) (18216,true)⟩,
⟨18219,.majority (18011,true) (18019,true) (18216,true)⟩,
⟨18220,.eq (18028,false) (18020,false)⟩,
⟨18221,.and [(18028,false),(18020,false)]⟩,
⟨18222,.eq (18031,false) (18023,false)⟩,
⟨18223,.eq (18222,false) (18221,true)⟩,
⟨18224,.majority (18031,false) (18023,false) (18221,true)⟩,
⟨18225,.eq (18034,false) (18026,false)⟩,
⟨18226,.eq (18225,false) (18224,true)⟩,
⟨18227,.majority (18034,false) (18026,false) (18224,true)⟩,
⟨18228,.eq (18035,false) (18027,false)⟩,
⟨18229,.eq (18228,false) (18227,true)⟩,
⟨18230,.majority (18027,true) (18035,true) (18227,true)⟩,
⟨18231,.eq (18055,false) (18044,false)⟩,
⟨18232,.and [(18055,false),(18044,false)]⟩,
⟨18233,.eq (18058,false) (18047,false)⟩,
⟨18234,.eq (18233,false) (18232,true)⟩,
⟨18235,.majority (18058,false) (18047,false) (18232,true)⟩,
⟨18236,.eq (18061,false) (18050,false)⟩,
⟨18237,.eq (18236,false) (18235,true)⟩,
⟨18238,.majority (18061,false) (18050,false) (18235,true)⟩,
⟨18239,.eq (18064,false) (18053,false)⟩,
⟨18240,.eq (18239,false) (18238,true)⟩,
⟨18241,.majority (18064,false) (18053,false) (18238,true)⟩,
⟨18242,.eq (18065,false) (18054,false)⟩,
⟨18243,.eq (18242,false) (18241,true)⟩,
⟨18244,.majority (18054,true) (18065,true) (18241,true)⟩,
⟨18245,.eq (18077,false) (18066,false)⟩,
⟨18246,.and [(18077,false),(18066,false)]⟩,
⟨18247,.eq (18080,false) (18069,false)⟩,
⟨18248,.eq (18247,false) (18246,true)⟩,
⟨18249,.majority (18080,false) (18069,false) (18246,true)⟩,
⟨18250,.eq (18083,false) (18072,false)⟩,
⟨18251,.eq (18250,false) (18249,true)⟩,
⟨18252,.majority (18083,false) (18072,false) (18249,true)⟩,
⟨18253,.eq (18086,false) (18075,false)⟩,
⟨18254,.eq (18253,false) (18252,true)⟩,
⟨18255,.majority (18086,false) (18075,false) (18252,true)⟩,
⟨18256,.eq (18087,false) (18076,false)⟩,
⟨18257,.eq (18256,false) (18255,true)⟩,
⟨18258,.majority (18076,true) (18087,true) (18255,true)⟩,
⟨18259,.eq (18099,false) (18088,false)⟩,
⟨18260,.and [(18099,false),(18088,false)]⟩,
⟨18261,.eq (18102,false) (18091,false)⟩,
⟨18262,.eq (18261,false) (18260,true)⟩,
⟨18263,.majority (18102,false) (18091,false) (18260,true)⟩,
⟨18264,.eq (18105,false) (18094,false)⟩,
⟨18265,.eq (18264,false) (18263,true)⟩,
⟨18266,.majority (18105,false) (18094,false) (18263,true)⟩,
⟨18267,.eq (18108,false) (18097,false)⟩,
⟨18268,.eq (18267,false) (18266,true)⟩,
⟨18269,.majority (18108,false) (18097,false) (18266,true)⟩,
⟨18270,.eq (18109,false) (18098,false)⟩,
⟨18271,.eq (18270,false) (18269,true)⟩,
⟨18272,.majority (18098,true) (18109,true) (18269,true)⟩,
⟨18273,.eq (18121,false) (18110,false)⟩,
⟨18274,.and [(18121,false),(18110,false)]⟩,
⟨18275,.eq (18124,false) (18113,false)⟩,
⟨18276,.eq (18275,false) (18274,true)⟩,
⟨18277,.majority (18124,false) (18113,false) (18274,true)⟩,
⟨18278,.eq (18127,false) (18116,false)⟩,
⟨18279,.eq (18278,false) (18277,true)⟩,
⟨18280,.majority (18127,false) (18116,false) (18277,true)⟩,
⟨18281,.eq (18130,false) (18119,false)⟩,
⟨18282,.eq (18281,false) (18280,true)⟩,
⟨18283,.majority (18130,false) (18119,false) (18280,true)⟩,
⟨18284,.eq (18131,false) (18120,false)⟩,
⟨18285,.eq (18284,false) (18283,true)⟩,
⟨18286,.majority (18120,true) (18131,true) (18283,true)⟩,
⟨18287,.eq (18143,false) (18132,false)⟩,
⟨18288,.and [(18143,false),(18132,false)]⟩,
⟨18289,.eq (18146,false) (18135,false)⟩,
⟨18290,.eq (18289,false) (18288,true)⟩,
⟨18291,.majority (18146,false) (18135,false) (18288,true)⟩,
⟨18292,.eq (18149,false) (18138,false)⟩,
⟨18293,.eq (18292,false) (18291,true)⟩,
⟨18294,.majority (18149,false) (18138,false) (18291,true)⟩,
⟨18295,.eq (18152,false) (18141,false)⟩,
⟨18296,.eq (18295,false) (18294,true)⟩,
⟨18297,.majority (18152,false) (18141,false) (18294,true)⟩,
⟨18298,.eq (18153,false) (18142,false)⟩,
⟨18299,.eq (18298,false) (18297,true)⟩,
⟨18300,.majority (18142,true) (18153,true) (18297,true)⟩,
⟨18301,.eq (18165,false) (18154,false)⟩,
⟨18302,.and [(18165,false),(18154,false)]⟩,
⟨18303,.eq (18168,false) (18157,false)⟩,
⟨18304,.eq (18303,false) (18302,true)⟩,
⟨18305,.majority (18168,false) (18157,false) (18302,true)⟩,
⟨18306,.eq (18171,false) (18160,false)⟩,
⟨18307,.eq (18306,false) (18305,true)⟩,
⟨18308,.majority (18171,false) (18160,false) (18305,true)⟩,
⟨18309,.eq (18174,false) (18163,false)⟩,
⟨18310,.eq (18309,false) (18308,true)⟩,
⟨18311,.majority (18174,false) (18163,false) (18308,true)⟩,
⟨18312,.eq (18175,false) (18164,false)⟩,
⟨18313,.eq (18312,false) (18311,true)⟩,
⟨18314,.majority (18164,true) (18175,true) (18311,true)⟩,
⟨18315,.eq (18187,false) (18176,false)⟩,
⟨18316,.and [(18187,false),(18176,false)]⟩,
⟨18317,.eq (18190,false) (18179,false)⟩,
⟨18318,.eq (18317,false) (18316,true)⟩,
⟨18319,.majority (18190,false) (18179,false) (18316,true)⟩,
⟨18320,.eq (18193,false) (18182,false)⟩,
⟨18321,.eq (18320,false) (18319,true)⟩,
⟨18322,.majority (18193,false) (18182,false) (18319,true)⟩,
⟨18323,.eq (18196,false) (18185,false)⟩,
⟨18324,.eq (18323,false) (18322,true)⟩,
⟨18325,.majority (18196,false) (18185,false) (18322,true)⟩,
⟨18326,.eq (18197,false) (18186,false)⟩,
⟨18327,.eq (18326,false) (18325,true)⟩,
⟨18328,.majority (18186,true) (18197,true) (18325,true)⟩,
⟨18329,.eq (18209,false) (18198,false)⟩,
⟨18330,.and [(18209,false),(18198,false)]⟩,
⟨18331,.eq (18212,false) (18201,false)⟩,
⟨18332,.eq (18331,false) (18330,true)⟩,
⟨18333,.majority (18212,false) (18201,false) (18330,true)⟩,
⟨18334,.eq (18215,false) (18204,false)⟩,
⟨18335,.eq (18334,false) (18333,true)⟩,
⟨18336,.majority (18215,false) (18204,false) (18333,true)⟩,
⟨18337,.eq (18218,false) (18207,false)⟩,
⟨18338,.eq (18337,false) (18336,true)⟩,
⟨18339,.majority (18218,false) (18207,false) (18336,true)⟩,
⟨18340,.eq (18219,false) (18208,false)⟩,
⟨18341,.eq (18340,false) (18339,true)⟩,
⟨18342,.majority (18208,true) (18219,true) (18339,true)⟩,
⟨18343,.eq (18220,false) (18036,false)⟩,
⟨18344,.and [(18220,false),(18036,false)]⟩,
⟨18345,.eq (18223,false) (18039,false)⟩,
⟨18346,.eq (18345,false) (18344,true)⟩,
⟨18347,.majority (18223,false) (18039,false) (18344,true)⟩,
⟨18348,.eq (18226,false) (18042,false)⟩,
⟨18349,.eq (18348,false) (18347,true)⟩,
⟨18350,.majority (18226,false) (18042,false) (18347,true)⟩,
⟨18351,.eq (18229,false) (18043,true)⟩,
⟨18352,.eq (18351,false) (18350,true)⟩,
⟨18353,.majority (18229,false) (18043,true) (18350,true)⟩,
⟨18354,.eq (18353,false) (18230,false)⟩,
⟨18355,.and [(18230,true),(18353,true)]⟩,
⟨18356,.eq (18245,false) (18231,false)⟩,
⟨18357,.and [(18245,false),(18231,false)]⟩,
⟨18358,.eq (18248,false) (18234,false)⟩,
⟨18359,.eq (18358,false) (18357,true)⟩,
⟨18360,.majority (18248,false) (18234,false) (18357,true)⟩,
⟨18361,.eq (18251,false) (18237,false)⟩,
⟨18362,.eq (18361,false) (18360,true)⟩,
⟨18363,.majority (18251,false) (18237,false) (18360,true)⟩,
⟨18364,.eq (18254,false) (18240,false)⟩,
⟨18365,.eq (18364,false) (18363,true)⟩,
⟨18366,.majority (18254,false) (18240,false) (18363,true)⟩,
⟨18367,.eq (18257,false) (18243,false)⟩,
⟨18368,.eq (18367,false) (18366,true)⟩,
⟨18369,.majority (18257,false) (18243,false) (18366,true)⟩,
⟨18370,.eq (18258,false) (18244,false)⟩,
⟨18371,.eq (18370,false) (18369,true)⟩,
⟨18372,.majority (18244,true) (18258,true) (18369,true)⟩,
⟨18373,.eq (18273,false) (18259,false)⟩,
⟨18374,.and [(18273,false),(18259,false)]⟩,
⟨18375,.eq (18276,false) (18262,false)⟩,
⟨18376,.eq (18375,false) (18374,true)⟩,
⟨18377,.majority (18276,false) (18262,false) (18374,true)⟩,
⟨18378,.eq (18279,false) (18265,false)⟩,
⟨18379,.eq (18378,false) (18377,true)⟩,
⟨18380,.majority (18279,false) (18265,false) (18377,true)⟩,
⟨18381,.eq (18282,false) (18268,false)⟩,
⟨18382,.eq (18381,false) (18380,true)⟩,
⟨18383,.majority (18282,false) (18268,false) (18380,true)⟩,
⟨18384,.eq (18285,false) (18271,false)⟩,
⟨18385,.eq (18384,false) (18383,true)⟩,
⟨18386,.majority (18285,false) (18271,false) (18383,true)⟩,
⟨18387,.eq (18286,false) (18272,false)⟩,
⟨18388,.eq (18387,false) (18386,true)⟩,
⟨18389,.majority (18272,true) (18286,true) (18386,true)⟩,
⟨18390,.eq (18301,false) (18287,false)⟩,
⟨18391,.and [(18301,false),(18287,false)]⟩,
⟨18392,.eq (18304,false) (18290,false)⟩,
⟨18393,.eq (18392,false) (18391,true)⟩,
⟨18394,.majority (18304,false) (18290,false) (18391,true)⟩,
⟨18395,.eq (18307,false) (18293,false)⟩,
⟨18396,.eq (18395,false) (18394,true)⟩,
⟨18397,.majority (18307,false) (18293,false) (18394,true)⟩,
⟨18398,.eq (18310,false) (18296,false)⟩,
⟨18399,.eq (18398,false) (18397,true)⟩,
⟨18400,.majority (18310,false) (18296,false) (18397,true)⟩,
⟨18401,.eq (18313,false) (18299,false)⟩,
⟨18402,.eq (18401,false) (18400,true)⟩,
⟨18403,.majority (18313,false) (18299,false) (18400,true)⟩,
⟨18404,.eq (18314,false) (18300,false)⟩,
⟨18405,.eq (18404,false) (18403,true)⟩,
⟨18406,.majority (18300,true) (18314,true) (18403,true)⟩,
⟨18407,.eq (18329,false) (18315,false)⟩,
⟨18408,.and [(18329,false),(18315,false)]⟩,
⟨18409,.eq (18332,false) (18318,false)⟩,
⟨18410,.eq (18409,false) (18408,true)⟩,
⟨18411,.majority (18332,false) (18318,false) (18408,true)⟩,
⟨18412,.eq (18335,false) (18321,false)⟩,
⟨18413,.eq (18412,false) (18411,true)⟩,
⟨18414,.majority (18335,false) (18321,false) (18411,true)⟩,
⟨18415,.eq (18338,false) (18324,false)⟩,
⟨18416,.eq (18415,false) (18414,true)⟩,
⟨18417,.majority (18338,false) (18324,false) (18414,true)⟩,
⟨18418,.eq (18341,false) (18327,false)⟩,
⟨18419,.eq (18418,false) (18417,true)⟩,
⟨18420,.majority (18341,false) (18327,false) (18417,true)⟩,
⟨18421,.eq (18342,false) (18328,false)⟩,
⟨18422,.eq (18421,false) (18420,true)⟩,
⟨18423,.majority (18328,true) (18342,true) (18420,true)⟩,
⟨18424,.eq (18373,false) (18356,false)⟩,
⟨18425,.and [(18373,false),(18356,false)]⟩,
⟨18426,.eq (18376,false) (18359,false)⟩,
⟨18427,.eq (18426,false) (18425,true)⟩,
⟨18428,.majority (18376,false) (18359,false) (18425,true)⟩,
⟨18429,.eq (18379,false) (18362,false)⟩,
⟨18430,.eq (18429,false) (18428,true)⟩,
⟨18431,.majority (18379,false) (18362,false) (18428,true)⟩,
⟨18432,.eq (18382,false) (18365,false)⟩,
⟨18433,.eq (18432,false) (18431,true)⟩,
⟨18434,.majority (18382,false) (18365,false) (18431,true)⟩,
⟨18435,.eq (18385,false) (18368,false)⟩,
⟨18436,.eq (18435,false) (18434,true)⟩,
⟨18437,.majority (18385,false) (18368,false) (18434,true)⟩,
⟨18438,.eq (18388,false) (18371,false)⟩,
⟨18439,.eq (18438,false) (18437,true)⟩,
⟨18440,.majority (18388,false) (18371,false) (18437,true)⟩,
⟨18441,.eq (18389,false) (18372,false)⟩,
⟨18442,.eq (18441,false) (18440,true)⟩,
⟨18443,.majority (18372,true) (18389,true) (18440,true)⟩,
⟨18444,.eq (18407,false) (18390,false)⟩,
⟨18445,.and [(18407,false),(18390,false)]⟩,
⟨18446,.eq (18410,false) (18393,false)⟩,
⟨18447,.eq (18446,false) (18445,true)⟩,
⟨18448,.majority (18410,false) (18393,false) (18445,true)⟩,
⟨18449,.eq (18413,false) (18396,false)⟩,
⟨18450,.eq (18449,false) (18448,true)⟩,
⟨18451,.majority (18413,false) (18396,false) (18448,true)⟩,
⟨18452,.eq (18416,false) (18399,false)⟩,
⟨18453,.eq (18452,false) (18451,true)⟩,
⟨18454,.majority (18416,false) (18399,false) (18451,true)⟩,
⟨18455,.eq (18419,false) (18402,false)⟩,
⟨18456,.eq (18455,false) (18454,true)⟩,
⟨18457,.majority (18419,false) (18402,false) (18454,true)⟩,
⟨18458,.eq (18422,false) (18405,false)⟩,
⟨18459,.eq (18458,false) (18457,true)⟩,
⟨18460,.majority (18422,false) (18405,false) (18457,true)⟩,
⟨18461,.eq (18423,false) (18406,false)⟩,
⟨18462,.eq (18461,false) (18460,true)⟩,
⟨18463,.majority (18406,true) (18423,true) (18460,true)⟩,
⟨18464,.eq (18444,false) (18424,false)⟩,
⟨18465,.and [(18444,false),(18424,false)]⟩,
⟨18466,.eq (18447,false) (18427,false)⟩,
⟨18467,.eq (18466,false) (18465,true)⟩,
⟨18468,.majority (18447,false) (18427,false) (18465,true)⟩,
⟨18469,.eq (18450,false) (18430,false)⟩,
⟨18470,.eq (18469,false) (18468,true)⟩,
⟨18471,.majority (18450,false) (18430,false) (18468,true)⟩,
⟨18472,.eq (18453,false) (18433,false)⟩,
⟨18473,.eq (18472,false) (18471,true)⟩,
⟨18474,.majority (18453,false) (18433,false) (18471,true)⟩,
⟨18475,.eq (18456,false) (18436,false)⟩,
⟨18476,.eq (18475,false) (18474,true)⟩,
⟨18477,.majority (18456,false) (18436,false) (18474,true)⟩,
⟨18478,.eq (18459,false) (18439,false)⟩,
⟨18479,.eq (18478,false) (18477,true)⟩,
⟨18480,.majority (18459,false) (18439,false) (18477,true)⟩,
⟨18481,.eq (18462,false) (18442,false)⟩,
⟨18482,.eq (18481,false) (18480,true)⟩,
⟨18483,.majority (18462,false) (18442,false) (18480,true)⟩,
⟨18484,.eq (18463,false) (18443,false)⟩,
⟨18485,.eq (18484,false) (18483,true)⟩,
⟨18486,.majority (18443,true) (18463,true) (18483,true)⟩,
⟨18487,.eq (18464,false) (18343,false)⟩,
⟨18488,.and [(18464,false),(18343,false)]⟩,
⟨18489,.eq (18467,false) (18346,false)⟩,
⟨18490,.eq (18489,false) (18488,true)⟩,
⟨18491,.majority (18467,false) (18346,false) (18488,true)⟩,
⟨18492,.eq (18470,false) (18349,false)⟩,
⟨18493,.eq (18492,false) (18491,true)⟩,
⟨18494,.majority (18470,false) (18349,false) (18491,true)⟩,
⟨18495,.eq (18473,false) (18352,false)⟩,
⟨18496,.eq (18495,false) (18494,true)⟩,
⟨18497,.majority (18473,false) (18352,false) (18494,true)⟩,
⟨18498,.eq (18476,false) (18354,false)⟩,
⟨18499,.eq (18498,false) (18497,true)⟩,
⟨18500,.majority (18476,false) (18354,false) (18497,true)⟩,
⟨18501,.eq (18479,false) (18355,true)⟩,
⟨18502,.eq (18501,false) (18500,true)⟩,
⟨18503,.majority (18479,false) (18355,true) (18500,true)⟩,
⟨18504,.eq (18503,false) (18482,true)⟩,
⟨18505,.and [(18482,false),(18503,true)]⟩,
⟨18506,.eq (18505,false) (18485,true)⟩,
⟨18507,.and [(18485,false),(18505,true)]⟩,
⟨18508,.eq (18507,false) (18486,false)⟩,
⟨18509,.and [(18486,true),(18507,true)]⟩,
⟨18510,.and [(18509,false),(18506,false),(18493,false),(18490,false),(18487,true),(18496,true),(18499,true),(18502,true),(18504,true),(18508,true)]⟩
]

theorem gates_sublist : localGates.Sublist roofGates := by native_decide

def terms : List (Lit × Int) := [
((16467,true),(1 : Int)),
((16468,true),(-1 : Int)),
((16472,true),(1 : Int)),
((16473,true),(-1 : Int)),
((16477,true),(1 : Int)),
((16478,true),(-1 : Int)),
((16482,true),(1 : Int)),
((16483,true),(-1 : Int)),
((16488,true),(1 : Int)),
((16489,true),(-1 : Int)),
((16493,true),(1 : Int)),
((16494,true),(-1 : Int)),
((16498,true),(1 : Int)),
((16499,true),(-1 : Int)),
((16502,true),(1 : Int)),
((16503,true),(-1 : Int)),
((16506,true),(1 : Int)),
((16507,true),(-1 : Int)),
((16512,true),(1 : Int)),
((16513,true),(-1 : Int)),
((16517,true),(1 : Int)),
((16518,true),(-1 : Int)),
((16521,true),(1 : Int)),
((16522,true),(-1 : Int)),
((16524,true),(1 : Int)),
((16525,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16538,true),(1 : Int)),
((16539,true),(-1 : Int)),
((16542,true),(1 : Int)),
((16543,true),(-1 : Int)),
((16546,true),(1 : Int)),
((16547,true),(-1 : Int)),
((16552,true),(1 : Int)),
((16553,true),(-1 : Int)),
((16556,true),(1 : Int)),
((16557,true),(-1 : Int)),
((16561,true),(1 : Int)),
((16562,true),(-1 : Int)),
((16566,true),(1 : Int)),
((16567,true),(-1 : Int)),
((16570,true),(1 : Int)),
((16571,true),(-1 : Int)),
((16574,true),(1 : Int)),
((16575,true),(-1 : Int)),
((16579,true),(1 : Int)),
((16580,true),(-1 : Int)),
((16584,true),(1 : Int)),
((16585,true),(-1 : Int)),
((16588,true),(1 : Int)),
((16589,true),(-1 : Int)),
((16592,true),(1 : Int)),
((16593,true),(-1 : Int)),
((16596,true),(1 : Int)),
((16597,true),(-1 : Int)),
((16599,true),(1 : Int)),
((16600,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16607,true),(1 : Int)),
((16608,true),(-1 : Int)),
((16611,true),(1 : Int)),
((16612,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16618,true),(1 : Int)),
((16619,true),(-1 : Int)),
((16622,true),(1 : Int)),
((16623,true),(-1 : Int)),
((16627,true),(1 : Int)),
((16628,true),(-1 : Int)),
((16631,true),(1 : Int)),
((16632,true),(-1 : Int)),
((16635,true),(1 : Int)),
((16636,true),(-1 : Int)),
((16640,true),(1 : Int)),
((16641,true),(-1 : Int)),
((16645,true),(1 : Int)),
((16646,true),(-1 : Int)),
((16649,true),(1 : Int)),
((16650,true),(-1 : Int)),
((16653,true),(1 : Int)),
((16654,true),(-1 : Int)),
((16658,true),(1 : Int)),
((16659,true),(-1 : Int)),
((16662,true),(1 : Int)),
((16663,true),(-1 : Int)),
((16666,true),(1 : Int)),
((16667,true),(-1 : Int)),
((16669,true),(1 : Int)),
((16670,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16674,true),(1 : Int)),
((16675,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16683,true),(1 : Int)),
((16684,true),(-1 : Int)),
((16687,true),(1 : Int)),
((16688,true),(-1 : Int)),
((16691,true),(1 : Int)),
((16692,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16697,true),(1 : Int)),
((16698,true),(-1 : Int)),
((16702,true),(1 : Int)),
((16703,true),(-1 : Int)),
((16706,true),(1 : Int)),
((16707,true),(-1 : Int)),
((16710,true),(1 : Int)),
((16711,true),(-1 : Int)),
((16715,true),(1 : Int)),
((16716,true),(-1 : Int)),
((16719,true),(1 : Int)),
((16720,true),(-1 : Int)),
((16723,true),(1 : Int)),
((16724,true),(-1 : Int)),
((16727,true),(1 : Int)),
((16728,true),(-1 : Int)),
((16730,true),(1 : Int)),
((16731,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16741,true),(1 : Int)),
((16742,true),(-1 : Int)),
((16745,true),(1 : Int)),
((16746,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16753,true),(1 : Int)),
((16754,true),(-1 : Int)),
((16757,true),(1 : Int)),
((16758,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16763,true),(1 : Int)),
((16764,true),(-1 : Int)),
((16767,true),(1 : Int)),
((16768,true),(-1 : Int)),
((16771,true),(1 : Int)),
((16772,true),(-1 : Int)),
((16775,true),(1 : Int)),
((16776,true),(-1 : Int)),
((16779,true),(1 : Int)),
((16780,true),(-1 : Int)),
((16783,true),(1 : Int)),
((16784,true),(-1 : Int)),
((16787,true),(1 : Int)),
((16788,true),(-1 : Int)),
((16791,true),(1 : Int)),
((16792,true),(-1 : Int)),
((16796,true),(1 : Int)),
((16797,true),(-1 : Int)),
((16801,true),(1 : Int)),
((16802,true),(-1 : Int)),
((16805,true),(1 : Int)),
((16806,true),(-1 : Int)),
((16809,true),(1 : Int)),
((16810,true),(-1 : Int)),
((16813,true),(1 : Int)),
((16814,true),(-1 : Int)),
((16818,true),(1 : Int)),
((16819,true),(-1 : Int)),
((16822,true),(1 : Int)),
((16823,true),(-1 : Int)),
((16826,true),(1 : Int)),
((16827,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16834,true),(1 : Int)),
((16835,true),(-1 : Int)),
((16838,true),(1 : Int)),
((16839,true),(-1 : Int)),
((16842,true),(1 : Int)),
((16843,true),(-1 : Int)),
((16848,true),(1 : Int)),
((16849,true),(-1 : Int)),
((16852,true),(1 : Int)),
((16853,true),(-1 : Int)),
((16857,true),(1 : Int)),
((16858,true),(-1 : Int)),
((16861,true),(1 : Int)),
((16862,true),(-1 : Int)),
((16865,true),(1 : Int)),
((16866,true),(-1 : Int)),
((16870,true),(1 : Int)),
((16871,true),(-1 : Int)),
((16874,true),(1 : Int)),
((16875,true),(-1 : Int)),
((16878,true),(1 : Int)),
((16879,true),(-1 : Int)),
((16882,true),(1 : Int)),
((16883,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16887,true),(1 : Int)),
((16888,true),(-1 : Int)),
((16891,true),(1 : Int)),
((16892,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16898,true),(1 : Int)),
((16899,true),(-1 : Int)),
((16902,true),(1 : Int)),
((16903,true),(-1 : Int)),
((16906,true),(1 : Int)),
((16907,true),(-1 : Int)),
((16910,true),(1 : Int)),
((16911,true),(-1 : Int)),
((16915,true),(1 : Int)),
((16916,true),(-1 : Int)),
((16919,true),(1 : Int)),
((16920,true),(-1 : Int)),
((16923,true),(1 : Int)),
((16924,true),(-1 : Int)),
((16927,true),(1 : Int)),
((16928,true),(-1 : Int)),
((16931,true),(1 : Int)),
((16932,true),(-1 : Int)),
((16935,true),(1 : Int)),
((16936,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16944,true),(1 : Int)),
((16945,true),(-1 : Int)),
((16948,true),(1 : Int)),
((16949,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16954,true),(1 : Int)),
((16955,true),(-1 : Int)),
((16958,true),(1 : Int)),
((16959,true),(-1 : Int)),
((16962,true),(1 : Int)),
((16963,true),(-1 : Int)),
((16966,true),(1 : Int)),
((16967,true),(-1 : Int)),
((16970,true),(1 : Int)),
((16971,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((16982,true),(1 : Int)),
((16983,true),(-1 : Int)),
((16986,true),(1 : Int)),
((16987,true),(-1 : Int)),
((16990,true),(1 : Int)),
((16991,true),(-1 : Int)),
((16995,true),(1 : Int)),
((16996,true),(-1 : Int)),
((16999,true),(1 : Int)),
((17000,true),(-1 : Int)),
((17003,true),(1 : Int)),
((17004,true),(-1 : Int)),
((17008,true),(1 : Int)),
((17009,true),(-1 : Int)),
((17012,true),(1 : Int)),
((17013,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((17017,true),(1 : Int)),
((17018,true),(-1 : Int)),
((17021,true),(1 : Int)),
((17022,true),(-1 : Int)),
((17027,true),(1 : Int)),
((17028,true),(-1 : Int)),
((17031,true),(1 : Int)),
((17032,true),(-1 : Int)),
((17035,true),(1 : Int)),
((17036,true),(-1 : Int)),
((17039,true),(1 : Int)),
((17040,true),(-1 : Int)),
((17043,true),(1 : Int)),
((17044,true),(-1 : Int)),
((17047,true),(1 : Int)),
((17048,true),(-1 : Int)),
((17051,true),(1 : Int)),
((17052,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((17058,true),(1 : Int)),
((17059,true),(-1 : Int)),
((17062,true),(1 : Int)),
((17063,true),(-1 : Int)),
((17066,true),(1 : Int)),
((17067,true),(-1 : Int)),
((17070,true),(1 : Int)),
((17071,true),(-1 : Int)),
((17074,true),(1 : Int)),
((17075,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((17083,true),(1 : Int)),
((17084,true),(-1 : Int)),
((17087,true),(1 : Int)),
((17088,true),(-1 : Int)),
((17092,true),(1 : Int)),
((17093,true),(-1 : Int)),
((17096,true),(1 : Int)),
((17097,true),(-1 : Int)),
((17101,true),(1 : Int)),
((17102,true),(-1 : Int)),
((17105,true),(1 : Int)),
((17106,true),(-1 : Int)),
((17111,true),(1 : Int)),
((17112,true),(-1 : Int)),
((17115,true),(1 : Int)),
((17116,true),(-1 : Int)),
((17119,true),(1 : Int)),
((17120,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int)),
((17126,true),(1 : Int)),
((17127,true),(-1 : Int)),
((17130,true),(1 : Int)),
((17131,true),(-1 : Int)),
((0,false),(1 : Int)),
((0,false),(-1 : Int))
]

def sumTree : SumTree Lit := (.fork (.fork (.fork (.fork (.fork (.fork (.fork (.fork (.fork (.leaf (16467,true)) (.leaf (16468,false))) (.fork (.leaf (16472,true)) (.leaf (16473,false)))) (.fork (.fork (.leaf (16477,true)) (.leaf (16478,false))) (.fork (.leaf (16482,true)) (.leaf (16483,false))))) (.fork (.fork (.fork (.leaf (16488,true)) (.leaf (16489,false))) (.fork (.leaf (16493,true)) (.leaf (16494,false)))) (.fork (.fork (.leaf (16498,true)) (.leaf (16499,false))) (.fork (.leaf (16502,true)) (.leaf (16503,false)))))) (.fork (.fork (.fork (.fork (.leaf (16506,true)) (.leaf (16507,false))) (.fork (.leaf (16512,true)) (.leaf (16513,false)))) (.fork (.fork (.leaf (16517,true)) (.leaf (16518,false))) (.fork (.leaf (16521,true)) (.leaf (16522,false))))) (.fork (.fork (.fork (.leaf (16524,true)) (.leaf (16525,false))) (.fork (.leaf (16538,true)) (.leaf (16539,false)))) (.fork (.fork (.leaf (16542,true)) (.leaf (16543,false))) (.fork (.leaf (16546,true)) (.leaf (16547,false))))))) (.fork (.fork (.fork (.fork (.fork (.leaf (16552,true)) (.leaf (16553,false))) (.fork (.leaf (16556,true)) (.leaf (16557,false)))) (.fork (.fork (.leaf (16561,true)) (.leaf (16562,false))) (.fork (.leaf (16566,true)) (.leaf (16567,false))))) (.fork (.fork (.fork (.leaf (16570,true)) (.leaf (16571,false))) (.fork (.leaf (16574,true)) (.leaf (16575,false)))) (.fork (.fork (.leaf (16579,true)) (.leaf (16580,false))) (.fork (.leaf (16584,true)) (.leaf (16585,false)))))) (.fork (.fork (.fork (.fork (.leaf (16588,true)) (.leaf (16589,false))) (.fork (.leaf (16592,true)) (.leaf (16593,false)))) (.fork (.fork (.leaf (16596,true)) (.leaf (16597,false))) (.fork (.leaf (16599,true)) (.leaf (16600,false))))) (.fork (.fork (.fork (.leaf (16607,true)) (.leaf (16608,false))) (.fork (.leaf (16611,true)) (.leaf (16612,false)))) (.fork (.fork (.leaf (16618,true)) (.leaf (16619,false))) (.fork (.leaf (16622,true)) (.leaf (16623,false)))))))) (.fork (.fork (.fork (.fork (.fork (.fork (.leaf (16627,true)) (.leaf (16628,false))) (.fork (.leaf (16631,true)) (.leaf (16632,false)))) (.fork (.fork (.leaf (16635,true)) (.leaf (16636,false))) (.fork (.leaf (16640,true)) (.leaf (16641,false))))) (.fork (.fork (.fork (.leaf (16645,true)) (.leaf (16646,false))) (.fork (.leaf (16649,true)) (.leaf (16650,false)))) (.fork (.fork (.leaf (16653,true)) (.leaf (16654,false))) (.fork (.leaf (16658,true)) (.leaf (16659,false)))))) (.fork (.fork (.fork (.fork (.leaf (16662,true)) (.leaf (16663,false))) (.fork (.leaf (16666,true)) (.leaf (16667,false)))) (.fork (.fork (.leaf (16669,true)) (.leaf (16670,false))) (.fork (.leaf (16674,true)) (.leaf (16675,false))))) (.fork (.fork (.fork (.leaf (16683,true)) (.leaf (16684,false))) (.fork (.leaf (16687,true)) (.leaf (16688,false)))) (.fork (.fork (.leaf (16691,true)) (.leaf (16692,false))) (.fork (.leaf (16697,true)) (.leaf (16698,false))))))) (.fork (.fork (.fork (.fork (.fork (.leaf (16702,true)) (.leaf (16703,false))) (.fork (.leaf (16706,true)) (.leaf (16707,false)))) (.fork (.fork (.leaf (16710,true)) (.leaf (16711,false))) (.fork (.leaf (16715,true)) (.leaf (16716,false))))) (.fork (.fork (.fork (.leaf (16719,true)) (.leaf (16720,false))) (.fork (.leaf (16723,true)) (.leaf (16724,false)))) (.fork (.fork (.leaf (16727,true)) (.leaf (16728,false))) (.fork (.leaf (16730,true)) (.leaf (16731,false)))))) (.fork (.fork (.fork (.fork (.leaf (16741,true)) (.leaf (16742,false))) (.fork (.leaf (16745,true)) (.leaf (16746,false)))) (.fork (.fork (.leaf (16753,true)) (.leaf (16754,false))) (.fork (.leaf (16757,true)) (.leaf (16758,false))))) (.fork (.fork (.fork (.leaf (16763,true)) (.leaf (16764,false))) (.fork (.leaf (16767,true)) (.leaf (16768,false)))) (.fork (.fork (.leaf (16771,true)) (.leaf (16772,false))) (.fork (.leaf (16775,true)) (.leaf (16776,false))))))))) (.fork (.fork (.fork (.fork (.fork (.fork (.fork (.leaf (16779,true)) (.leaf (16780,false))) (.fork (.leaf (16783,true)) (.leaf (16784,false)))) (.fork (.fork (.leaf (16787,true)) (.leaf (16788,false))) (.fork (.leaf (16791,true)) (.leaf (16792,false))))) (.fork (.fork (.fork (.leaf (16796,true)) (.leaf (16797,false))) (.fork (.leaf (16801,true)) (.leaf (16802,false)))) (.fork (.fork (.leaf (16805,true)) (.leaf (16806,false))) (.fork (.leaf (16809,true)) (.leaf (16810,false)))))) (.fork (.fork (.fork (.fork (.leaf (16813,true)) (.leaf (16814,false))) (.fork (.leaf (16818,true)) (.leaf (16819,false)))) (.fork (.fork (.leaf (16822,true)) (.leaf (16823,false))) (.fork (.leaf (16826,true)) (.leaf (16827,false))))) (.fork (.fork (.fork (.leaf (16834,true)) (.leaf (16835,false))) (.fork (.leaf (16838,true)) (.leaf (16839,false)))) (.fork (.fork (.leaf (16842,true)) (.leaf (16843,false))) (.fork (.leaf (16848,true)) (.leaf (16849,false))))))) (.fork (.fork (.fork (.fork (.fork (.leaf (16852,true)) (.leaf (16853,false))) (.fork (.leaf (16857,true)) (.leaf (16858,false)))) (.fork (.fork (.leaf (16861,true)) (.leaf (16862,false))) (.fork (.leaf (16865,true)) (.leaf (16866,false))))) (.fork (.fork (.fork (.leaf (16870,true)) (.leaf (16871,false))) (.fork (.leaf (16874,true)) (.leaf (16875,false)))) (.fork (.fork (.leaf (16878,true)) (.leaf (16879,false))) (.fork (.leaf (16882,true)) (.leaf (16883,false)))))) (.fork (.fork (.fork (.fork (.leaf (16887,true)) (.leaf (16888,false))) (.fork (.leaf (16891,true)) (.leaf (16892,false)))) (.fork (.fork (.leaf (16898,true)) (.leaf (16899,false))) (.fork (.leaf (16902,true)) (.leaf (16903,false))))) (.fork (.fork (.fork (.leaf (16906,true)) (.leaf (16907,false))) (.fork (.leaf (16910,true)) (.leaf (16911,false)))) (.fork (.fork (.leaf (16915,true)) (.leaf (16916,false))) (.fork (.leaf (16919,true)) (.leaf (16920,false)))))))) (.fork (.fork (.fork (.fork (.fork (.fork (.leaf (16923,true)) (.leaf (16924,false))) (.fork (.leaf (16927,true)) (.leaf (16928,false)))) (.fork (.fork (.leaf (16931,true)) (.leaf (16932,false))) (.fork (.leaf (16935,true)) (.leaf (16936,false))))) (.fork (.fork (.fork (.leaf (16944,true)) (.leaf (16945,false))) (.fork (.leaf (16948,true)) (.leaf (16949,false)))) (.fork (.fork (.leaf (16954,true)) (.leaf (16955,false))) (.fork (.leaf (16958,true)) (.leaf (16959,false)))))) (.fork (.fork (.fork (.fork (.leaf (16962,true)) (.leaf (16963,false))) (.fork (.leaf (16966,true)) (.leaf (16967,false)))) (.fork (.fork (.leaf (16970,true)) (.leaf (16971,false))) (.fork (.leaf (16982,true)) (.leaf (16983,false))))) (.fork (.fork (.fork (.leaf (16986,true)) (.leaf (16987,false))) (.fork (.leaf (16990,true)) (.leaf (16991,false)))) (.fork (.fork (.leaf (16995,true)) (.leaf (16996,false))) (.fork (.leaf (16999,true)) (.leaf (17000,false))))))) (.fork (.fork (.fork (.fork (.fork (.leaf (17003,true)) (.leaf (17004,false))) (.fork (.leaf (17008,true)) (.leaf (17009,false)))) (.fork (.fork (.leaf (17012,true)) (.leaf (17013,false))) (.fork (.leaf (17017,true)) (.leaf (17018,false))))) (.fork (.fork (.fork (.leaf (17021,true)) (.leaf (17022,false))) (.fork (.leaf (17027,true)) (.leaf (17028,false)))) (.fork (.fork (.leaf (17031,true)) (.leaf (17032,false))) (.fork (.leaf (17035,true)) (.leaf (17036,false)))))) (.fork (.fork (.fork (.fork (.leaf (17039,true)) (.leaf (17040,false))) (.fork (.leaf (17043,true)) (.leaf (17044,false)))) (.fork (.fork (.leaf (17047,true)) (.leaf (17048,false))) (.fork (.leaf (17051,true)) (.leaf (17052,false))))) (.fork (.fork (.fork (.leaf (17058,true)) (.leaf (17059,false))) (.fork (.leaf (17062,true)) (.leaf (17063,false)))) (.fork (.fork (.leaf (17066,true)) (.leaf (17067,false))) (.fork (.leaf (17070,true)) (.leaf (17071,false)))))))))) (.fork (.fork (.fork (.fork (.fork (.leaf (17074,true)) (.leaf (17075,false))) (.fork (.leaf (17083,true)) (.leaf (17084,false)))) (.fork (.fork (.leaf (17087,true)) (.leaf (17088,false))) (.fork (.leaf (17092,true)) (.leaf (17093,false))))) (.fork (.fork (.fork (.leaf (17096,true)) (.leaf (17097,false))) (.fork (.leaf (17101,true)) (.leaf (17102,false)))) (.fork (.fork (.leaf (17105,true)) (.leaf (17106,false))) (.fork (.leaf (17111,true)) (.leaf (17112,false)))))) (.fork (.fork (.fork (.leaf (17115,true)) (.leaf (17116,false))) (.fork (.leaf (17119,true)) (.leaf (17120,false)))) (.fork (.fork (.leaf (17126,true)) (.leaf (17127,false))) (.fork (.leaf (17130,true)) (.leaf (17131,false)))))))

theorem leaves_normalized : sumTree.leaves =
    (expandLiteralWeights terms).filter (fun a => a.1 != 0) := by native_decide
theorem negative_offset : literalNegativeOffset terms = 190 := by native_decide
theorem true_constants : (expandLiteralWeights terms).count (0,true) = 50 := by native_decide

theorem global_equivalence (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    val σ (18510,true) = (sumTree.evalBV 9 (val σ) == (134 : BitVec 9)) := by
  have hp := PBA2.local_equivalence
    (σ 16467)
    (σ 16468)
    (σ 16472)
    (σ 16473)
    (σ 16477)
    (σ 16478)
    (σ 16482)
    (σ 16483)
    (σ 16488)
    (σ 16489)
    (σ 16493)
    (σ 16494)
    (σ 16498)
    (σ 16499)
    (σ 16502)
    (σ 16503)
    (σ 16506)
    (σ 16507)
    (σ 16512)
    (σ 16513)
    (σ 16517)
    (σ 16518)
    (σ 16521)
    (σ 16522)
    (σ 16524)
    (σ 16525)
    (σ 16538)
    (σ 16539)
    (σ 16542)
    (σ 16543)
    (σ 16546)
    (σ 16547)
    (σ 16552)
    (σ 16553)
    (σ 16556)
    (σ 16557)
    (σ 16561)
    (σ 16562)
    (σ 16566)
    (σ 16567)
    (σ 16570)
    (σ 16571)
    (σ 16574)
    (σ 16575)
    (σ 16579)
    (σ 16580)
    (σ 16584)
    (σ 16585)
    (σ 16588)
    (σ 16589)
    (σ 16592)
    (σ 16593)
    (σ 16596)
    (σ 16597)
    (σ 16599)
    (σ 16600)
    (σ 16607)
    (σ 16608)
    (σ 16611)
    (σ 16612)
    (σ 16618)
    (σ 16619)
    (σ 16622)
    (σ 16623)
    (σ 16627)
    (σ 16628)
    (σ 16631)
    (σ 16632)
    (σ 16635)
    (σ 16636)
    (σ 16640)
    (σ 16641)
    (σ 16645)
    (σ 16646)
    (σ 16649)
    (σ 16650)
    (σ 16653)
    (σ 16654)
    (σ 16658)
    (σ 16659)
    (σ 16662)
    (σ 16663)
    (σ 16666)
    (σ 16667)
    (σ 16669)
    (σ 16670)
    (σ 16674)
    (σ 16675)
    (σ 16683)
    (σ 16684)
    (σ 16687)
    (σ 16688)
    (σ 16691)
    (σ 16692)
    (σ 16697)
    (σ 16698)
    (σ 16702)
    (σ 16703)
    (σ 16706)
    (σ 16707)
    (σ 16710)
    (σ 16711)
    (σ 16715)
    (σ 16716)
    (σ 16719)
    (σ 16720)
    (σ 16723)
    (σ 16724)
    (σ 16727)
    (σ 16728)
    (σ 16730)
    (σ 16731)
    (σ 16741)
    (σ 16742)
    (σ 16745)
    (σ 16746)
    (σ 16753)
    (σ 16754)
    (σ 16757)
    (σ 16758)
    (σ 16763)
    (σ 16764)
    (σ 16767)
    (σ 16768)
    (σ 16771)
    (σ 16772)
    (σ 16775)
    (σ 16776)
    (σ 16779)
    (σ 16780)
    (σ 16783)
    (σ 16784)
    (σ 16787)
    (σ 16788)
    (σ 16791)
    (σ 16792)
    (σ 16796)
    (σ 16797)
    (σ 16801)
    (σ 16802)
    (σ 16805)
    (σ 16806)
    (σ 16809)
    (σ 16810)
    (σ 16813)
    (σ 16814)
    (σ 16818)
    (σ 16819)
    (σ 16822)
    (σ 16823)
    (σ 16826)
    (σ 16827)
    (σ 16834)
    (σ 16835)
    (σ 16838)
    (σ 16839)
    (σ 16842)
    (σ 16843)
    (σ 16848)
    (σ 16849)
    (σ 16852)
    (σ 16853)
    (σ 16857)
    (σ 16858)
    (σ 16861)
    (σ 16862)
    (σ 16865)
    (σ 16866)
    (σ 16870)
    (σ 16871)
    (σ 16874)
    (σ 16875)
    (σ 16878)
    (σ 16879)
    (σ 16882)
    (σ 16883)
    (σ 16887)
    (σ 16888)
    (σ 16891)
    (σ 16892)
    (σ 16898)
    (σ 16899)
    (σ 16902)
    (σ 16903)
    (σ 16906)
    (σ 16907)
    (σ 16910)
    (σ 16911)
    (σ 16915)
    (σ 16916)
    (σ 16919)
    (σ 16920)
    (σ 16923)
    (σ 16924)
    (σ 16927)
    (σ 16928)
    (σ 16931)
    (σ 16932)
    (σ 16935)
    (σ 16936)
    (σ 16944)
    (σ 16945)
    (σ 16948)
    (σ 16949)
    (σ 16954)
    (σ 16955)
    (σ 16958)
    (σ 16959)
    (σ 16962)
    (σ 16963)
    (σ 16966)
    (σ 16967)
    (σ 16970)
    (σ 16971)
    (σ 16982)
    (σ 16983)
    (σ 16986)
    (σ 16987)
    (σ 16990)
    (σ 16991)
    (σ 16995)
    (σ 16996)
    (σ 16999)
    (σ 17000)
    (σ 17003)
    (σ 17004)
    (σ 17008)
    (σ 17009)
    (σ 17012)
    (σ 17013)
    (σ 17017)
    (σ 17018)
    (σ 17021)
    (σ 17022)
    (σ 17027)
    (σ 17028)
    (σ 17031)
    (σ 17032)
    (σ 17035)
    (σ 17036)
    (σ 17039)
    (σ 17040)
    (σ 17043)
    (σ 17044)
    (σ 17047)
    (σ 17048)
    (σ 17051)
    (σ 17052)
    (σ 17058)
    (σ 17059)
    (σ 17062)
    (σ 17063)
    (σ 17066)
    (σ 17067)
    (σ 17070)
    (σ 17071)
    (σ 17074)
    (σ 17075)
    (σ 17083)
    (σ 17084)
    (σ 17087)
    (σ 17088)
    (σ 17092)
    (σ 17093)
    (σ 17096)
    (σ 17097)
    (σ 17101)
    (σ 17102)
    (σ 17105)
    (σ 17106)
    (σ 17111)
    (σ 17112)
    (σ 17115)
    (σ 17116)
    (σ 17119)
    (σ 17120)
    (σ 17126)
    (σ 17127)
    (σ 17130)
    (σ 17131)
    (σ 17134)
    (σ 17135)
    (σ 17136)
    (σ 17137)
    (σ 17138)
    (σ 17139)
    (σ 17140)
    (σ 17141)
    (σ 17142)
    (σ 17143)
    (σ 17144)
    (σ 17145)
    (σ 17146)
    (σ 17147)
    (σ 17148)
    (σ 17149)
    (σ 17150)
    (σ 17151)
    (σ 17152)
    (σ 17153)
    (σ 17154)
    (σ 17155)
    (σ 17156)
    (σ 17157)
    (σ 17158)
    (σ 17159)
    (σ 17160)
    (σ 17161)
    (σ 17162)
    (σ 17163)
    (σ 17164)
    (σ 17165)
    (σ 17166)
    (σ 17167)
    (σ 17168)
    (σ 17169)
    (σ 17170)
    (σ 17171)
    (σ 17172)
    (σ 17173)
    (σ 17174)
    (σ 17175)
    (σ 17176)
    (σ 17177)
    (σ 17178)
    (σ 17179)
    (σ 17180)
    (σ 17181)
    (σ 17182)
    (σ 17183)
    (σ 17184)
    (σ 17185)
    (σ 17186)
    (σ 17187)
    (σ 17188)
    (σ 17189)
    (σ 17190)
    (σ 17191)
    (σ 17192)
    (σ 17193)
    (σ 17194)
    (σ 17195)
    (σ 17196)
    (σ 17197)
    (σ 17198)
    (σ 17199)
    (σ 17200)
    (σ 17201)
    (σ 17202)
    (σ 17203)
    (σ 17204)
    (σ 17205)
    (σ 17206)
    (σ 17207)
    (σ 17208)
    (σ 17209)
    (σ 17210)
    (σ 17211)
    (σ 17212)
    (σ 17213)
    (σ 17214)
    (σ 17215)
    (σ 17216)
    (σ 17217)
    (σ 17218)
    (σ 17219)
    (σ 17220)
    (σ 17221)
    (σ 17222)
    (σ 17223)
    (σ 17224)
    (σ 17225)
    (σ 17226)
    (σ 17227)
    (σ 17228)
    (σ 17229)
    (σ 17230)
    (σ 17231)
    (σ 17232)
    (σ 17233)
    (σ 17234)
    (σ 17235)
    (σ 17236)
    (σ 17237)
    (σ 17238)
    (σ 17239)
    (σ 17240)
    (σ 17241)
    (σ 17242)
    (σ 17243)
    (σ 17244)
    (σ 17245)
    (σ 17246)
    (σ 17247)
    (σ 17248)
    (σ 17249)
    (σ 17250)
    (σ 17251)
    (σ 17252)
    (σ 17253)
    (σ 17254)
    (σ 17255)
    (σ 17256)
    (σ 17257)
    (σ 17258)
    (σ 17259)
    (σ 17260)
    (σ 17261)
    (σ 17262)
    (σ 17263)
    (σ 17264)
    (σ 17265)
    (σ 17266)
    (σ 17267)
    (σ 17268)
    (σ 17269)
    (σ 17270)
    (σ 17271)
    (σ 17272)
    (σ 17273)
    (σ 17274)
    (σ 17275)
    (σ 17276)
    (σ 17277)
    (σ 17278)
    (σ 17279)
    (σ 17280)
    (σ 17281)
    (σ 17282)
    (σ 17283)
    (σ 17284)
    (σ 17285)
    (σ 17286)
    (σ 17287)
    (σ 17288)
    (σ 17289)
    (σ 17290)
    (σ 17291)
    (σ 17292)
    (σ 17293)
    (σ 17294)
    (σ 17295)
    (σ 17296)
    (σ 17297)
    (σ 17298)
    (σ 17299)
    (σ 17300)
    (σ 17301)
    (σ 17302)
    (σ 17303)
    (σ 17304)
    (σ 17305)
    (σ 17306)
    (σ 17307)
    (σ 17308)
    (σ 17309)
    (σ 17310)
    (σ 17311)
    (σ 17312)
    (σ 17313)
    (σ 17314)
    (σ 17315)
    (σ 17316)
    (σ 17317)
    (σ 17318)
    (σ 17319)
    (σ 17320)
    (σ 17321)
    (σ 17322)
    (σ 17323)
    (σ 17324)
    (σ 17325)
    (σ 17326)
    (σ 17327)
    (σ 17328)
    (σ 17329)
    (σ 17330)
    (σ 17331)
    (σ 17332)
    (σ 17333)
    (σ 17334)
    (σ 17335)
    (σ 17336)
    (σ 17337)
    (σ 17338)
    (σ 17339)
    (σ 17340)
    (σ 17341)
    (σ 17342)
    (σ 17343)
    (σ 17344)
    (σ 17345)
    (σ 17346)
    (σ 17347)
    (σ 17348)
    (σ 17349)
    (σ 17350)
    (σ 17351)
    (σ 17352)
    (σ 17353)
    (σ 17354)
    (σ 17355)
    (σ 17356)
    (σ 17357)
    (σ 17358)
    (σ 17359)
    (σ 17360)
    (σ 17361)
    (σ 17362)
    (σ 17363)
    (σ 17364)
    (σ 17365)
    (σ 17366)
    (σ 17367)
    (σ 17368)
    (σ 17369)
    (σ 17370)
    (σ 17371)
    (σ 17372)
    (σ 17373)
    (σ 17374)
    (σ 17375)
    (σ 17376)
    (σ 17377)
    (σ 17378)
    (σ 17379)
    (σ 17380)
    (σ 17381)
    (σ 17382)
    (σ 17383)
    (σ 17384)
    (σ 17385)
    (σ 17386)
    (σ 17387)
    (σ 17388)
    (σ 17389)
    (σ 17390)
    (σ 17391)
    (σ 17392)
    (σ 17393)
    (σ 17394)
    (σ 17395)
    (σ 17396)
    (σ 17397)
    (σ 17398)
    (σ 17399)
    (σ 17400)
    (σ 17401)
    (σ 17402)
    (σ 17403)
    (σ 17404)
    (σ 17405)
    (σ 17406)
    (σ 17407)
    (σ 17408)
    (σ 17409)
    (σ 17410)
    (σ 17411)
    (σ 17412)
    (σ 17413)
    (σ 17414)
    (σ 17415)
    (σ 17416)
    (σ 17417)
    (σ 17418)
    (σ 17419)
    (σ 17420)
    (σ 17421)
    (σ 17422)
    (σ 17423)
    (σ 17424)
    (σ 17425)
    (σ 17426)
    (σ 17427)
    (σ 17428)
    (σ 17429)
    (σ 17430)
    (σ 17431)
    (σ 17432)
    (σ 17433)
    (σ 17434)
    (σ 17435)
    (σ 17436)
    (σ 17437)
    (σ 17438)
    (σ 17439)
    (σ 17440)
    (σ 17441)
    (σ 17442)
    (σ 17443)
    (σ 17444)
    (σ 17445)
    (σ 17446)
    (σ 17447)
    (σ 17448)
    (σ 17449)
    (σ 17450)
    (σ 17451)
    (σ 17452)
    (σ 17453)
    (σ 17454)
    (σ 17455)
    (σ 17456)
    (σ 17457)
    (σ 17458)
    (σ 17459)
    (σ 17460)
    (σ 17461)
    (σ 17462)
    (σ 17463)
    (σ 17464)
    (σ 17465)
    (σ 17466)
    (σ 17467)
    (σ 17468)
    (σ 17469)
    (σ 17470)
    (σ 17471)
    (σ 17472)
    (σ 17473)
    (σ 17474)
    (σ 17475)
    (σ 17476)
    (σ 17477)
    (σ 17478)
    (σ 17479)
    (σ 17480)
    (σ 17481)
    (σ 17482)
    (σ 17483)
    (σ 17484)
    (σ 17485)
    (σ 17486)
    (σ 17487)
    (σ 17488)
    (σ 17489)
    (σ 17490)
    (σ 17491)
    (σ 17492)
    (σ 17493)
    (σ 17494)
    (σ 17495)
    (σ 17496)
    (σ 17497)
    (σ 17498)
    (σ 17499)
    (σ 17500)
    (σ 17501)
    (σ 17502)
    (σ 17503)
    (σ 17504)
    (σ 17505)
    (σ 17506)
    (σ 17507)
    (σ 17508)
    (σ 17509)
    (σ 17510)
    (σ 17511)
    (σ 17512)
    (σ 17513)
    (σ 17514)
    (σ 17515)
    (σ 17516)
    (σ 17517)
    (σ 17518)
    (σ 17519)
    (σ 17520)
    (σ 17521)
    (σ 17522)
    (σ 17523)
    (σ 17524)
    (σ 17525)
    (σ 17526)
    (σ 17527)
    (σ 17528)
    (σ 17529)
    (σ 17530)
    (σ 17531)
    (σ 17532)
    (σ 17533)
    (σ 17534)
    (σ 17535)
    (σ 17536)
    (σ 17537)
    (σ 17538)
    (σ 17539)
    (σ 17540)
    (σ 17541)
    (σ 17542)
    (σ 17543)
    (σ 17544)
    (σ 17545)
    (σ 17546)
    (σ 17547)
    (σ 17548)
    (σ 17549)
    (σ 17550)
    (σ 17551)
    (σ 17552)
    (σ 17553)
    (σ 17554)
    (σ 17555)
    (σ 17556)
    (σ 17557)
    (σ 17558)
    (σ 17559)
    (σ 17560)
    (σ 17561)
    (σ 17562)
    (σ 17563)
    (σ 17564)
    (σ 17565)
    (σ 17566)
    (σ 17567)
    (σ 17568)
    (σ 17569)
    (σ 17570)
    (σ 17571)
    (σ 17572)
    (σ 17573)
    (σ 17574)
    (σ 17575)
    (σ 17576)
    (σ 17577)
    (σ 17578)
    (σ 17579)
    (σ 17580)
    (σ 17581)
    (σ 17582)
    (σ 17583)
    (σ 17584)
    (σ 17585)
    (σ 17586)
    (σ 17587)
    (σ 17588)
    (σ 17589)
    (σ 17590)
    (σ 17591)
    (σ 17592)
    (σ 17593)
    (σ 17594)
    (σ 17595)
    (σ 17596)
    (σ 17597)
    (σ 17598)
    (σ 17599)
    (σ 17600)
    (σ 17601)
    (σ 17602)
    (σ 17603)
    (σ 17604)
    (σ 17605)
    (σ 17606)
    (σ 17607)
    (σ 17608)
    (σ 17609)
    (σ 17610)
    (σ 17611)
    (σ 17612)
    (σ 17613)
    (σ 17614)
    (σ 17615)
    (σ 17616)
    (σ 17617)
    (σ 17618)
    (σ 17619)
    (σ 17620)
    (σ 17621)
    (σ 17622)
    (σ 17623)
    (σ 17624)
    (σ 17625)
    (σ 17626)
    (σ 17627)
    (σ 17628)
    (σ 17629)
    (σ 17630)
    (σ 17631)
    (σ 17632)
    (σ 17633)
    (σ 17634)
    (σ 17635)
    (σ 17636)
    (σ 17637)
    (σ 17638)
    (σ 17639)
    (σ 17640)
    (σ 17641)
    (σ 17642)
    (σ 17643)
    (σ 17644)
    (σ 17645)
    (σ 17646)
    (σ 17647)
    (σ 17648)
    (σ 17649)
    (σ 17650)
    (σ 17651)
    (σ 17652)
    (σ 17653)
    (σ 17654)
    (σ 17655)
    (σ 17656)
    (σ 17657)
    (σ 17658)
    (σ 17659)
    (σ 17660)
    (σ 17661)
    (σ 17662)
    (σ 17663)
    (σ 17664)
    (σ 17665)
    (σ 17666)
    (σ 17667)
    (σ 17668)
    (σ 17669)
    (σ 17670)
    (σ 17671)
    (σ 17672)
    (σ 17673)
    (σ 17674)
    (σ 17675)
    (σ 17676)
    (σ 17677)
    (σ 17678)
    (σ 17679)
    (σ 17680)
    (σ 17681)
    (σ 17682)
    (σ 17683)
    (σ 17684)
    (σ 17685)
    (σ 17686)
    (σ 17687)
    (σ 17688)
    (σ 17689)
    (σ 17690)
    (σ 17691)
    (σ 17692)
    (σ 17693)
    (σ 17694)
    (σ 17695)
    (σ 17696)
    (σ 17697)
    (σ 17698)
    (σ 17699)
    (σ 17700)
    (σ 17701)
    (σ 17702)
    (σ 17703)
    (σ 17704)
    (σ 17705)
    (σ 17706)
    (σ 17707)
    (σ 17708)
    (σ 17709)
    (σ 17710)
    (σ 17711)
    (σ 17712)
    (σ 17713)
    (σ 17714)
    (σ 17715)
    (σ 17716)
    (σ 17717)
    (σ 17718)
    (σ 17719)
    (σ 17720)
    (σ 17721)
    (σ 17722)
    (σ 17723)
    (σ 17724)
    (σ 17725)
    (σ 17726)
    (σ 17727)
    (σ 17728)
    (σ 17729)
    (σ 17730)
    (σ 17731)
    (σ 17732)
    (σ 17733)
    (σ 17734)
    (σ 17735)
    (σ 17736)
    (σ 17737)
    (σ 17738)
    (σ 17739)
    (σ 17740)
    (σ 17741)
    (σ 17742)
    (σ 17743)
    (σ 17744)
    (σ 17745)
    (σ 17746)
    (σ 17747)
    (σ 17748)
    (σ 17749)
    (σ 17750)
    (σ 17751)
    (σ 17752)
    (σ 17753)
    (σ 17754)
    (σ 17755)
    (σ 17756)
    (σ 17757)
    (σ 17758)
    (σ 17759)
    (σ 17760)
    (σ 17761)
    (σ 17762)
    (σ 17763)
    (σ 17764)
    (σ 17765)
    (σ 17766)
    (σ 17767)
    (σ 17768)
    (σ 17769)
    (σ 17770)
    (σ 17771)
    (σ 17772)
    (σ 17773)
    (σ 17774)
    (σ 17775)
    (σ 17776)
    (σ 17777)
    (σ 17778)
    (σ 17779)
    (σ 17780)
    (σ 17781)
    (σ 17782)
    (σ 17783)
    (σ 17784)
    (σ 17785)
    (σ 17786)
    (σ 17787)
    (σ 17788)
    (σ 17789)
    (σ 17790)
    (σ 17791)
    (σ 17792)
    (σ 17793)
    (σ 17794)
    (σ 17795)
    (σ 17796)
    (σ 17797)
    (σ 17798)
    (σ 17799)
    (σ 17800)
    (σ 17801)
    (σ 17802)
    (σ 17803)
    (σ 17804)
    (σ 17805)
    (σ 17806)
    (σ 17807)
    (σ 17808)
    (σ 17809)
    (σ 17810)
    (σ 17811)
    (σ 17812)
    (σ 17813)
    (σ 17814)
    (σ 17815)
    (σ 17816)
    (σ 17817)
    (σ 17818)
    (σ 17819)
    (σ 17820)
    (σ 17821)
    (σ 17822)
    (σ 17823)
    (σ 17824)
    (σ 17825)
    (σ 17826)
    (σ 17827)
    (σ 17828)
    (σ 17829)
    (σ 17830)
    (σ 17831)
    (σ 17832)
    (σ 17833)
    (σ 17834)
    (σ 17835)
    (σ 17836)
    (σ 17837)
    (σ 17838)
    (σ 17839)
    (σ 17840)
    (σ 17841)
    (σ 17842)
    (σ 17843)
    (σ 17844)
    (σ 17845)
    (σ 17846)
    (σ 17847)
    (σ 17848)
    (σ 17849)
    (σ 17850)
    (σ 17851)
    (σ 17852)
    (σ 17853)
    (σ 17854)
    (σ 17855)
    (σ 17856)
    (σ 17857)
    (σ 17858)
    (σ 17859)
    (σ 17860)
    (σ 17861)
    (σ 17862)
    (σ 17863)
    (σ 17864)
    (σ 17865)
    (σ 17866)
    (σ 17867)
    (σ 17868)
    (σ 17869)
    (σ 17870)
    (σ 17871)
    (σ 17872)
    (σ 17873)
    (σ 17874)
    (σ 17875)
    (σ 17876)
    (σ 17877)
    (σ 17878)
    (σ 17879)
    (σ 17880)
    (σ 17881)
    (σ 17882)
    (σ 17883)
    (σ 17884)
    (σ 17885)
    (σ 17886)
    (σ 17887)
    (σ 17888)
    (σ 17889)
    (σ 17890)
    (σ 17891)
    (σ 17892)
    (σ 17893)
    (σ 17894)
    (σ 17895)
    (σ 17896)
    (σ 17897)
    (σ 17898)
    (σ 17899)
    (σ 17900)
    (σ 17901)
    (σ 17902)
    (σ 17903)
    (σ 17904)
    (σ 17905)
    (σ 17906)
    (σ 17907)
    (σ 17908)
    (σ 17909)
    (σ 17910)
    (σ 17911)
    (σ 17912)
    (σ 17913)
    (σ 17914)
    (σ 17915)
    (σ 17916)
    (σ 17917)
    (σ 17918)
    (σ 17919)
    (σ 17920)
    (σ 17921)
    (σ 17922)
    (σ 17923)
    (σ 17924)
    (σ 17925)
    (σ 17926)
    (σ 17927)
    (σ 17928)
    (σ 17929)
    (σ 17930)
    (σ 17931)
    (σ 17932)
    (σ 17933)
    (σ 17934)
    (σ 17935)
    (σ 17936)
    (σ 17937)
    (σ 17938)
    (σ 17939)
    (σ 17940)
    (σ 17941)
    (σ 17942)
    (σ 17943)
    (σ 17944)
    (σ 17945)
    (σ 17946)
    (σ 17947)
    (σ 17948)
    (σ 17949)
    (σ 17950)
    (σ 17951)
    (σ 17952)
    (σ 17953)
    (σ 17954)
    (σ 17955)
    (σ 17956)
    (σ 17957)
    (σ 17958)
    (σ 17959)
    (σ 17960)
    (σ 17961)
    (σ 17962)
    (σ 17963)
    (σ 17964)
    (σ 17965)
    (σ 17966)
    (σ 17967)
    (σ 17968)
    (σ 17969)
    (σ 17970)
    (σ 17971)
    (σ 17972)
    (σ 17973)
    (σ 17974)
    (σ 17975)
    (σ 17976)
    (σ 17977)
    (σ 17978)
    (σ 17979)
    (σ 17980)
    (σ 17981)
    (σ 17982)
    (σ 17983)
    (σ 17984)
    (σ 17985)
    (σ 17986)
    (σ 17987)
    (σ 17988)
    (σ 17989)
    (σ 17990)
    (σ 17991)
    (σ 17992)
    (σ 17993)
    (σ 17994)
    (σ 17995)
    (σ 17996)
    (σ 17997)
    (σ 17998)
    (σ 17999)
    (σ 18000)
    (σ 18001)
    (σ 18002)
    (σ 18003)
    (σ 18004)
    (σ 18005)
    (σ 18006)
    (σ 18007)
    (σ 18008)
    (σ 18009)
    (σ 18010)
    (σ 18011)
    (σ 18012)
    (σ 18013)
    (σ 18014)
    (σ 18015)
    (σ 18016)
    (σ 18017)
    (σ 18018)
    (σ 18019)
    (σ 18020)
    (σ 18021)
    (σ 18022)
    (σ 18023)
    (σ 18024)
    (σ 18025)
    (σ 18026)
    (σ 18027)
    (σ 18028)
    (σ 18029)
    (σ 18030)
    (σ 18031)
    (σ 18032)
    (σ 18033)
    (σ 18034)
    (σ 18035)
    (σ 18036)
    (σ 18037)
    (σ 18038)
    (σ 18039)
    (σ 18040)
    (σ 18041)
    (σ 18042)
    (σ 18043)
    (σ 18044)
    (σ 18045)
    (σ 18046)
    (σ 18047)
    (σ 18048)
    (σ 18049)
    (σ 18050)
    (σ 18051)
    (σ 18052)
    (σ 18053)
    (σ 18054)
    (σ 18055)
    (σ 18056)
    (σ 18057)
    (σ 18058)
    (σ 18059)
    (σ 18060)
    (σ 18061)
    (σ 18062)
    (σ 18063)
    (σ 18064)
    (σ 18065)
    (σ 18066)
    (σ 18067)
    (σ 18068)
    (σ 18069)
    (σ 18070)
    (σ 18071)
    (σ 18072)
    (σ 18073)
    (σ 18074)
    (σ 18075)
    (σ 18076)
    (σ 18077)
    (σ 18078)
    (σ 18079)
    (σ 18080)
    (σ 18081)
    (σ 18082)
    (σ 18083)
    (σ 18084)
    (σ 18085)
    (σ 18086)
    (σ 18087)
    (σ 18088)
    (σ 18089)
    (σ 18090)
    (σ 18091)
    (σ 18092)
    (σ 18093)
    (σ 18094)
    (σ 18095)
    (σ 18096)
    (σ 18097)
    (σ 18098)
    (σ 18099)
    (σ 18100)
    (σ 18101)
    (σ 18102)
    (σ 18103)
    (σ 18104)
    (σ 18105)
    (σ 18106)
    (σ 18107)
    (σ 18108)
    (σ 18109)
    (σ 18110)
    (σ 18111)
    (σ 18112)
    (σ 18113)
    (σ 18114)
    (σ 18115)
    (σ 18116)
    (σ 18117)
    (σ 18118)
    (σ 18119)
    (σ 18120)
    (σ 18121)
    (σ 18122)
    (σ 18123)
    (σ 18124)
    (σ 18125)
    (σ 18126)
    (σ 18127)
    (σ 18128)
    (σ 18129)
    (σ 18130)
    (σ 18131)
    (σ 18132)
    (σ 18133)
    (σ 18134)
    (σ 18135)
    (σ 18136)
    (σ 18137)
    (σ 18138)
    (σ 18139)
    (σ 18140)
    (σ 18141)
    (σ 18142)
    (σ 18143)
    (σ 18144)
    (σ 18145)
    (σ 18146)
    (σ 18147)
    (σ 18148)
    (σ 18149)
    (σ 18150)
    (σ 18151)
    (σ 18152)
    (σ 18153)
    (σ 18154)
    (σ 18155)
    (σ 18156)
    (σ 18157)
    (σ 18158)
    (σ 18159)
    (σ 18160)
    (σ 18161)
    (σ 18162)
    (σ 18163)
    (σ 18164)
    (σ 18165)
    (σ 18166)
    (σ 18167)
    (σ 18168)
    (σ 18169)
    (σ 18170)
    (σ 18171)
    (σ 18172)
    (σ 18173)
    (σ 18174)
    (σ 18175)
    (σ 18176)
    (σ 18177)
    (σ 18178)
    (σ 18179)
    (σ 18180)
    (σ 18181)
    (σ 18182)
    (σ 18183)
    (σ 18184)
    (σ 18185)
    (σ 18186)
    (σ 18187)
    (σ 18188)
    (σ 18189)
    (σ 18190)
    (σ 18191)
    (σ 18192)
    (σ 18193)
    (σ 18194)
    (σ 18195)
    (σ 18196)
    (σ 18197)
    (σ 18198)
    (σ 18199)
    (σ 18200)
    (σ 18201)
    (σ 18202)
    (σ 18203)
    (σ 18204)
    (σ 18205)
    (σ 18206)
    (σ 18207)
    (σ 18208)
    (σ 18209)
    (σ 18210)
    (σ 18211)
    (σ 18212)
    (σ 18213)
    (σ 18214)
    (σ 18215)
    (σ 18216)
    (σ 18217)
    (σ 18218)
    (σ 18219)
    (σ 18220)
    (σ 18221)
    (σ 18222)
    (σ 18223)
    (σ 18224)
    (σ 18225)
    (σ 18226)
    (σ 18227)
    (σ 18228)
    (σ 18229)
    (σ 18230)
    (σ 18231)
    (σ 18232)
    (σ 18233)
    (σ 18234)
    (σ 18235)
    (σ 18236)
    (σ 18237)
    (σ 18238)
    (σ 18239)
    (σ 18240)
    (σ 18241)
    (σ 18242)
    (σ 18243)
    (σ 18244)
    (σ 18245)
    (σ 18246)
    (σ 18247)
    (σ 18248)
    (σ 18249)
    (σ 18250)
    (σ 18251)
    (σ 18252)
    (σ 18253)
    (σ 18254)
    (σ 18255)
    (σ 18256)
    (σ 18257)
    (σ 18258)
    (σ 18259)
    (σ 18260)
    (σ 18261)
    (σ 18262)
    (σ 18263)
    (σ 18264)
    (σ 18265)
    (σ 18266)
    (σ 18267)
    (σ 18268)
    (σ 18269)
    (σ 18270)
    (σ 18271)
    (σ 18272)
    (σ 18273)
    (σ 18274)
    (σ 18275)
    (σ 18276)
    (σ 18277)
    (σ 18278)
    (σ 18279)
    (σ 18280)
    (σ 18281)
    (σ 18282)
    (σ 18283)
    (σ 18284)
    (σ 18285)
    (σ 18286)
    (σ 18287)
    (σ 18288)
    (σ 18289)
    (σ 18290)
    (σ 18291)
    (σ 18292)
    (σ 18293)
    (σ 18294)
    (σ 18295)
    (σ 18296)
    (σ 18297)
    (σ 18298)
    (σ 18299)
    (σ 18300)
    (σ 18301)
    (σ 18302)
    (σ 18303)
    (σ 18304)
    (σ 18305)
    (σ 18306)
    (σ 18307)
    (σ 18308)
    (σ 18309)
    (σ 18310)
    (σ 18311)
    (σ 18312)
    (σ 18313)
    (σ 18314)
    (σ 18315)
    (σ 18316)
    (σ 18317)
    (σ 18318)
    (σ 18319)
    (σ 18320)
    (σ 18321)
    (σ 18322)
    (σ 18323)
    (σ 18324)
    (σ 18325)
    (σ 18326)
    (σ 18327)
    (σ 18328)
    (σ 18329)
    (σ 18330)
    (σ 18331)
    (σ 18332)
    (σ 18333)
    (σ 18334)
    (σ 18335)
    (σ 18336)
    (σ 18337)
    (σ 18338)
    (σ 18339)
    (σ 18340)
    (σ 18341)
    (σ 18342)
    (σ 18343)
    (σ 18344)
    (σ 18345)
    (σ 18346)
    (σ 18347)
    (σ 18348)
    (σ 18349)
    (σ 18350)
    (σ 18351)
    (σ 18352)
    (σ 18353)
    (σ 18354)
    (σ 18355)
    (σ 18356)
    (σ 18357)
    (σ 18358)
    (σ 18359)
    (σ 18360)
    (σ 18361)
    (σ 18362)
    (σ 18363)
    (σ 18364)
    (σ 18365)
    (σ 18366)
    (σ 18367)
    (σ 18368)
    (σ 18369)
    (σ 18370)
    (σ 18371)
    (σ 18372)
    (σ 18373)
    (σ 18374)
    (σ 18375)
    (σ 18376)
    (σ 18377)
    (σ 18378)
    (σ 18379)
    (σ 18380)
    (σ 18381)
    (σ 18382)
    (σ 18383)
    (σ 18384)
    (σ 18385)
    (σ 18386)
    (σ 18387)
    (σ 18388)
    (σ 18389)
    (σ 18390)
    (σ 18391)
    (σ 18392)
    (σ 18393)
    (σ 18394)
    (σ 18395)
    (σ 18396)
    (σ 18397)
    (σ 18398)
    (σ 18399)
    (σ 18400)
    (σ 18401)
    (σ 18402)
    (σ 18403)
    (σ 18404)
    (σ 18405)
    (σ 18406)
    (σ 18407)
    (σ 18408)
    (σ 18409)
    (σ 18410)
    (σ 18411)
    (σ 18412)
    (σ 18413)
    (σ 18414)
    (σ 18415)
    (σ 18416)
    (σ 18417)
    (σ 18418)
    (σ 18419)
    (σ 18420)
    (σ 18421)
    (σ 18422)
    (σ 18423)
    (σ 18424)
    (σ 18425)
    (σ 18426)
    (σ 18427)
    (σ 18428)
    (σ 18429)
    (σ 18430)
    (σ 18431)
    (σ 18432)
    (σ 18433)
    (σ 18434)
    (σ 18435)
    (σ 18436)
    (σ 18437)
    (σ 18438)
    (σ 18439)
    (σ 18440)
    (σ 18441)
    (σ 18442)
    (σ 18443)
    (σ 18444)
    (σ 18445)
    (σ 18446)
    (σ 18447)
    (σ 18448)
    (σ 18449)
    (σ 18450)
    (σ 18451)
    (σ 18452)
    (σ 18453)
    (σ 18454)
    (σ 18455)
    (σ 18456)
    (σ 18457)
    (σ 18458)
    (σ 18459)
    (σ 18460)
    (σ 18461)
    (σ 18462)
    (σ 18463)
    (σ 18464)
    (σ 18465)
    (σ 18466)
    (σ 18467)
    (σ 18468)
    (σ 18469)
    (σ 18470)
    (σ 18471)
    (σ 18472)
    (σ 18473)
    (σ 18474)
    (σ 18475)
    (σ 18476)
    (σ 18477)
    (σ 18478)
    (σ 18479)
    (σ 18480)
    (σ 18481)
    (σ 18482)
    (σ 18483)
    (σ 18484)
    (σ 18485)
    (σ 18486)
    (σ 18487)
    (σ 18488)
    (σ 18489)
    (σ 18490)
    (σ 18491)
    (σ 18492)
    (σ 18493)
    (σ 18494)
    (σ 18495)
    (σ 18496)
    (σ 18497)
    (σ 18498)
    (σ 18499)
    (σ 18500)
    (σ 18501)
    (σ 18502)
    (σ 18503)
    (σ 18504)
    (σ 18505)
    (σ 18506)
    (σ 18507)
    (σ 18508)
    (σ 18509)
    (σ 18510)
    (by have hg : (⟨17134,.eq (16468,false) (16467,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17134,.eq (16468,false) (16467,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17135,.and [(16468,false),(16467,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17135,.and [(16468,false),(16467,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17136,.eq (16473,false) (16472,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17136,.eq (16473,false) (16472,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17137,.and [(16473,false),(16472,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17137,.and [(16473,false),(16472,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17138,.eq (16478,false) (16477,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17138,.eq (16478,false) (16477,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17139,.and [(16478,false),(16477,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17139,.and [(16478,false),(16477,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17140,.eq (16483,false) (16482,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17140,.eq (16483,false) (16482,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17141,.and [(16483,false),(16482,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17141,.and [(16483,false),(16482,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17142,.eq (16489,false) (16488,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17142,.eq (16489,false) (16488,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17143,.and [(16489,false),(16488,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17143,.and [(16489,false),(16488,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17144,.eq (16494,false) (16493,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17144,.eq (16494,false) (16493,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17145,.and [(16494,false),(16493,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17145,.and [(16494,false),(16493,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17146,.eq (16499,false) (16498,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17146,.eq (16499,false) (16498,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17147,.and [(16499,false),(16498,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17147,.and [(16499,false),(16498,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17148,.eq (16503,false) (16502,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17148,.eq (16503,false) (16502,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17149,.and [(16503,false),(16502,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17149,.and [(16503,false),(16502,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17150,.eq (16507,false) (16506,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17150,.eq (16507,false) (16506,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17151,.and [(16507,false),(16506,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17151,.and [(16507,false),(16506,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17152,.eq (16513,false) (16512,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17152,.eq (16513,false) (16512,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17153,.and [(16513,false),(16512,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17153,.and [(16513,false),(16512,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17154,.eq (16518,false) (16517,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17154,.eq (16518,false) (16517,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17155,.and [(16518,false),(16517,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17155,.and [(16518,false),(16517,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17156,.eq (16522,false) (16521,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17156,.eq (16522,false) (16521,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17157,.and [(16522,false),(16521,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17157,.and [(16522,false),(16521,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17158,.eq (16525,false) (16524,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17158,.eq (16525,false) (16524,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17159,.and [(16525,false),(16524,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17159,.and [(16525,false),(16524,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17160,.eq (16539,false) (16538,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17160,.eq (16539,false) (16538,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17161,.and [(16539,false),(16538,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17161,.and [(16539,false),(16538,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17162,.eq (16543,false) (16542,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17162,.eq (16543,false) (16542,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17163,.and [(16543,false),(16542,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17163,.and [(16543,false),(16542,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17164,.eq (16547,false) (16546,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17164,.eq (16547,false) (16546,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17165,.and [(16547,false),(16546,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17165,.and [(16547,false),(16546,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17166,.eq (16553,false) (16552,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17166,.eq (16553,false) (16552,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17167,.and [(16553,false),(16552,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17167,.and [(16553,false),(16552,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17168,.eq (16557,false) (16556,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17168,.eq (16557,false) (16556,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17169,.and [(16557,false),(16556,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17169,.and [(16557,false),(16556,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17170,.eq (16562,false) (16561,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17170,.eq (16562,false) (16561,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17171,.and [(16562,false),(16561,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17171,.and [(16562,false),(16561,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17172,.eq (16567,false) (16566,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17172,.eq (16567,false) (16566,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17173,.and [(16567,false),(16566,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17173,.and [(16567,false),(16566,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17174,.eq (16571,false) (16570,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17174,.eq (16571,false) (16570,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17175,.and [(16571,false),(16570,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17175,.and [(16571,false),(16570,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17176,.eq (16575,false) (16574,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17176,.eq (16575,false) (16574,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17177,.and [(16575,false),(16574,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17177,.and [(16575,false),(16574,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17178,.eq (16580,false) (16579,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17178,.eq (16580,false) (16579,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17179,.and [(16580,false),(16579,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17179,.and [(16580,false),(16579,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17180,.eq (16585,false) (16584,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17180,.eq (16585,false) (16584,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17181,.and [(16585,false),(16584,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17181,.and [(16585,false),(16584,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17182,.eq (16589,false) (16588,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17182,.eq (16589,false) (16588,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17183,.and [(16589,false),(16588,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17183,.and [(16589,false),(16588,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17184,.eq (16593,false) (16592,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17184,.eq (16593,false) (16592,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17185,.and [(16593,false),(16592,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17185,.and [(16593,false),(16592,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17186,.eq (16597,false) (16596,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17186,.eq (16597,false) (16596,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17187,.and [(16597,false),(16596,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17187,.and [(16597,false),(16596,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17188,.eq (16600,false) (16599,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17188,.eq (16600,false) (16599,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17189,.and [(16600,false),(16599,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17189,.and [(16600,false),(16599,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17190,.eq (16608,false) (16607,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17190,.eq (16608,false) (16607,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17191,.and [(16608,false),(16607,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17191,.and [(16608,false),(16607,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17192,.eq (16612,false) (16611,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17192,.eq (16612,false) (16611,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17193,.and [(16612,false),(16611,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17193,.and [(16612,false),(16611,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17194,.eq (16619,false) (16618,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17194,.eq (16619,false) (16618,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17195,.and [(16619,false),(16618,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17195,.and [(16619,false),(16618,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17196,.eq (16623,false) (16622,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17196,.eq (16623,false) (16622,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17197,.and [(16623,false),(16622,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17197,.and [(16623,false),(16622,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17198,.eq (16628,false) (16627,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17198,.eq (16628,false) (16627,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17199,.and [(16628,false),(16627,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17199,.and [(16628,false),(16627,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17200,.eq (16632,false) (16631,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17200,.eq (16632,false) (16631,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17201,.and [(16632,false),(16631,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17201,.and [(16632,false),(16631,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17202,.eq (16636,false) (16635,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17202,.eq (16636,false) (16635,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17203,.and [(16636,false),(16635,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17203,.and [(16636,false),(16635,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17204,.eq (16641,false) (16640,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17204,.eq (16641,false) (16640,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17205,.and [(16641,false),(16640,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17205,.and [(16641,false),(16640,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17206,.eq (16646,false) (16645,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17206,.eq (16646,false) (16645,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17207,.and [(16646,false),(16645,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17207,.and [(16646,false),(16645,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17208,.eq (16650,false) (16649,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17208,.eq (16650,false) (16649,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17209,.and [(16650,false),(16649,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17209,.and [(16650,false),(16649,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17210,.eq (16654,false) (16653,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17210,.eq (16654,false) (16653,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17211,.and [(16654,false),(16653,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17211,.and [(16654,false),(16653,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17212,.eq (16659,false) (16658,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17212,.eq (16659,false) (16658,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17213,.and [(16659,false),(16658,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17213,.and [(16659,false),(16658,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17214,.eq (16663,false) (16662,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17214,.eq (16663,false) (16662,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17215,.and [(16663,false),(16662,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17215,.and [(16663,false),(16662,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17216,.eq (16667,false) (16666,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17216,.eq (16667,false) (16666,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17217,.and [(16667,false),(16666,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17217,.and [(16667,false),(16666,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17218,.eq (16670,false) (16669,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17218,.eq (16670,false) (16669,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17219,.and [(16670,false),(16669,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17219,.and [(16670,false),(16669,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17220,.eq (16675,false) (16674,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17220,.eq (16675,false) (16674,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17221,.and [(16675,false),(16674,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17221,.and [(16675,false),(16674,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17222,.eq (16684,false) (16683,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17222,.eq (16684,false) (16683,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17223,.and [(16684,false),(16683,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17223,.and [(16684,false),(16683,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17224,.eq (16688,false) (16687,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17224,.eq (16688,false) (16687,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17225,.and [(16688,false),(16687,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17225,.and [(16688,false),(16687,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17226,.eq (16692,false) (16691,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17226,.eq (16692,false) (16691,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17227,.and [(16692,false),(16691,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17227,.and [(16692,false),(16691,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17228,.eq (16698,false) (16697,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17228,.eq (16698,false) (16697,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17229,.and [(16698,false),(16697,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17229,.and [(16698,false),(16697,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17230,.eq (16703,false) (16702,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17230,.eq (16703,false) (16702,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17231,.and [(16703,false),(16702,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17231,.and [(16703,false),(16702,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17232,.eq (16707,false) (16706,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17232,.eq (16707,false) (16706,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17233,.and [(16707,false),(16706,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17233,.and [(16707,false),(16706,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17234,.eq (16711,false) (16710,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17234,.eq (16711,false) (16710,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17235,.and [(16711,false),(16710,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17235,.and [(16711,false),(16710,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17236,.eq (16716,false) (16715,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17236,.eq (16716,false) (16715,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17237,.and [(16716,false),(16715,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17237,.and [(16716,false),(16715,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17238,.eq (16720,false) (16719,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17238,.eq (16720,false) (16719,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17239,.and [(16720,false),(16719,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17239,.and [(16720,false),(16719,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17240,.eq (16724,false) (16723,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17240,.eq (16724,false) (16723,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17241,.and [(16724,false),(16723,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17241,.and [(16724,false),(16723,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17242,.eq (16728,false) (16727,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17242,.eq (16728,false) (16727,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17243,.and [(16728,false),(16727,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17243,.and [(16728,false),(16727,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17244,.eq (16731,false) (16730,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17244,.eq (16731,false) (16730,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17245,.and [(16731,false),(16730,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17245,.and [(16731,false),(16730,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17246,.eq (16742,false) (16741,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17246,.eq (16742,false) (16741,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17247,.and [(16742,false),(16741,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17247,.and [(16742,false),(16741,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17248,.eq (16746,false) (16745,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17248,.eq (16746,false) (16745,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17249,.and [(16746,false),(16745,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17249,.and [(16746,false),(16745,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17250,.eq (16754,false) (16753,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17250,.eq (16754,false) (16753,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17251,.and [(16754,false),(16753,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17251,.and [(16754,false),(16753,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17252,.eq (16758,false) (16757,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17252,.eq (16758,false) (16757,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17253,.and [(16758,false),(16757,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17253,.and [(16758,false),(16757,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17254,.eq (16764,false) (16763,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17254,.eq (16764,false) (16763,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17255,.and [(16764,false),(16763,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17255,.and [(16764,false),(16763,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17256,.eq (16768,false) (16767,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17256,.eq (16768,false) (16767,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17257,.and [(16768,false),(16767,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17257,.and [(16768,false),(16767,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17258,.eq (16772,false) (16771,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17258,.eq (16772,false) (16771,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17259,.and [(16772,false),(16771,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17259,.and [(16772,false),(16771,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17260,.eq (16776,false) (16775,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17260,.eq (16776,false) (16775,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17261,.and [(16776,false),(16775,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17261,.and [(16776,false),(16775,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17262,.eq (16780,false) (16779,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17262,.eq (16780,false) (16779,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17263,.and [(16780,false),(16779,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17263,.and [(16780,false),(16779,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17264,.eq (16784,false) (16783,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17264,.eq (16784,false) (16783,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17265,.and [(16784,false),(16783,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17265,.and [(16784,false),(16783,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17266,.eq (16788,false) (16787,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17266,.eq (16788,false) (16787,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17267,.and [(16788,false),(16787,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17267,.and [(16788,false),(16787,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17268,.eq (16792,false) (16791,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17268,.eq (16792,false) (16791,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17269,.and [(16792,false),(16791,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17269,.and [(16792,false),(16791,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17270,.eq (16797,false) (16796,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17270,.eq (16797,false) (16796,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17271,.and [(16797,false),(16796,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17271,.and [(16797,false),(16796,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17272,.eq (16802,false) (16801,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17272,.eq (16802,false) (16801,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17273,.and [(16802,false),(16801,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17273,.and [(16802,false),(16801,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17274,.eq (16806,false) (16805,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17274,.eq (16806,false) (16805,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17275,.and [(16806,false),(16805,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17275,.and [(16806,false),(16805,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17276,.eq (16810,false) (16809,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17276,.eq (16810,false) (16809,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17277,.and [(16810,false),(16809,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17277,.and [(16810,false),(16809,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17278,.eq (16814,false) (16813,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17278,.eq (16814,false) (16813,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17279,.and [(16814,false),(16813,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17279,.and [(16814,false),(16813,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17280,.eq (16819,false) (16818,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17280,.eq (16819,false) (16818,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17281,.and [(16819,false),(16818,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17281,.and [(16819,false),(16818,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17282,.eq (16823,false) (16822,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17282,.eq (16823,false) (16822,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17283,.and [(16823,false),(16822,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17283,.and [(16823,false),(16822,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17284,.eq (16827,false) (16826,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17284,.eq (16827,false) (16826,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17285,.and [(16827,false),(16826,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17285,.and [(16827,false),(16826,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17286,.eq (16835,false) (16834,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17286,.eq (16835,false) (16834,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17287,.and [(16835,false),(16834,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17287,.and [(16835,false),(16834,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17288,.eq (16839,false) (16838,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17288,.eq (16839,false) (16838,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17289,.and [(16839,false),(16838,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17289,.and [(16839,false),(16838,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17290,.eq (16843,false) (16842,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17290,.eq (16843,false) (16842,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17291,.and [(16843,false),(16842,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17291,.and [(16843,false),(16842,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17292,.eq (16849,false) (16848,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17292,.eq (16849,false) (16848,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17293,.and [(16849,false),(16848,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17293,.and [(16849,false),(16848,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17294,.eq (16853,false) (16852,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17294,.eq (16853,false) (16852,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17295,.and [(16853,false),(16852,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17295,.and [(16853,false),(16852,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17296,.eq (16858,false) (16857,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17296,.eq (16858,false) (16857,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17297,.and [(16858,false),(16857,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17297,.and [(16858,false),(16857,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17298,.eq (16862,false) (16861,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17298,.eq (16862,false) (16861,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17299,.and [(16862,false),(16861,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17299,.and [(16862,false),(16861,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17300,.eq (16866,false) (16865,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17300,.eq (16866,false) (16865,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17301,.and [(16866,false),(16865,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17301,.and [(16866,false),(16865,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17302,.eq (16871,false) (16870,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17302,.eq (16871,false) (16870,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17303,.and [(16871,false),(16870,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17303,.and [(16871,false),(16870,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17304,.eq (16875,false) (16874,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17304,.eq (16875,false) (16874,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17305,.and [(16875,false),(16874,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17305,.and [(16875,false),(16874,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17306,.eq (16879,false) (16878,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17306,.eq (16879,false) (16878,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17307,.and [(16879,false),(16878,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17307,.and [(16879,false),(16878,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17308,.eq (16883,false) (16882,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17308,.eq (16883,false) (16882,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17309,.and [(16883,false),(16882,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17309,.and [(16883,false),(16882,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17310,.eq (16888,false) (16887,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17310,.eq (16888,false) (16887,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17311,.and [(16888,false),(16887,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17311,.and [(16888,false),(16887,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17312,.eq (16892,false) (16891,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17312,.eq (16892,false) (16891,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17313,.and [(16892,false),(16891,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17313,.and [(16892,false),(16891,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17314,.eq (16899,false) (16898,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17314,.eq (16899,false) (16898,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17315,.and [(16899,false),(16898,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17315,.and [(16899,false),(16898,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17316,.eq (16903,false) (16902,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17316,.eq (16903,false) (16902,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17317,.and [(16903,false),(16902,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17317,.and [(16903,false),(16902,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17318,.eq (16907,false) (16906,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17318,.eq (16907,false) (16906,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17319,.and [(16907,false),(16906,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17319,.and [(16907,false),(16906,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17320,.eq (16911,false) (16910,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17320,.eq (16911,false) (16910,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17321,.and [(16911,false),(16910,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17321,.and [(16911,false),(16910,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17322,.eq (16916,false) (16915,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17322,.eq (16916,false) (16915,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17323,.and [(16916,false),(16915,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17323,.and [(16916,false),(16915,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17324,.eq (16920,false) (16919,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17324,.eq (16920,false) (16919,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17325,.and [(16920,false),(16919,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17325,.and [(16920,false),(16919,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17326,.eq (16924,false) (16923,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17326,.eq (16924,false) (16923,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17327,.and [(16924,false),(16923,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17327,.and [(16924,false),(16923,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17328,.eq (16928,false) (16927,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17328,.eq (16928,false) (16927,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17329,.and [(16928,false),(16927,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17329,.and [(16928,false),(16927,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17330,.eq (16932,false) (16931,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17330,.eq (16932,false) (16931,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17331,.and [(16932,false),(16931,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17331,.and [(16932,false),(16931,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17332,.eq (16936,false) (16935,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17332,.eq (16936,false) (16935,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17333,.and [(16936,false),(16935,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17333,.and [(16936,false),(16935,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17334,.eq (16945,false) (16944,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17334,.eq (16945,false) (16944,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17335,.and [(16945,false),(16944,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17335,.and [(16945,false),(16944,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17336,.eq (16949,false) (16948,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17336,.eq (16949,false) (16948,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17337,.and [(16949,false),(16948,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17337,.and [(16949,false),(16948,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17338,.eq (16955,false) (16954,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17338,.eq (16955,false) (16954,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17339,.and [(16955,false),(16954,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17339,.and [(16955,false),(16954,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17340,.eq (16959,false) (16958,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17340,.eq (16959,false) (16958,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17341,.and [(16959,false),(16958,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17341,.and [(16959,false),(16958,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17342,.eq (16963,false) (16962,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17342,.eq (16963,false) (16962,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17343,.and [(16963,false),(16962,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17343,.and [(16963,false),(16962,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17344,.eq (16967,false) (16966,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17344,.eq (16967,false) (16966,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17345,.and [(16967,false),(16966,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17345,.and [(16967,false),(16966,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17346,.eq (16971,false) (16970,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17346,.eq (16971,false) (16970,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17347,.and [(16971,false),(16970,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17347,.and [(16971,false),(16970,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17348,.eq (16983,false) (16982,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17348,.eq (16983,false) (16982,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17349,.and [(16983,false),(16982,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17349,.and [(16983,false),(16982,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17350,.eq (16987,false) (16986,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17350,.eq (16987,false) (16986,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17351,.and [(16987,false),(16986,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17351,.and [(16987,false),(16986,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17352,.eq (16991,false) (16990,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17352,.eq (16991,false) (16990,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17353,.and [(16991,false),(16990,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17353,.and [(16991,false),(16990,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17354,.eq (16996,false) (16995,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17354,.eq (16996,false) (16995,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17355,.and [(16996,false),(16995,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17355,.and [(16996,false),(16995,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17356,.eq (17000,false) (16999,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17356,.eq (17000,false) (16999,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17357,.and [(17000,false),(16999,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17357,.and [(17000,false),(16999,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17358,.eq (17004,false) (17003,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17358,.eq (17004,false) (17003,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17359,.and [(17004,false),(17003,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17359,.and [(17004,false),(17003,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17360,.eq (17009,false) (17008,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17360,.eq (17009,false) (17008,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17361,.and [(17009,false),(17008,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17361,.and [(17009,false),(17008,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17362,.eq (17013,false) (17012,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17362,.eq (17013,false) (17012,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17363,.and [(17013,false),(17012,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17363,.and [(17013,false),(17012,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17364,.eq (17018,false) (17017,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17364,.eq (17018,false) (17017,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17365,.and [(17018,false),(17017,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17365,.and [(17018,false),(17017,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17366,.eq (17022,false) (17021,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17366,.eq (17022,false) (17021,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17367,.and [(17022,false),(17021,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17367,.and [(17022,false),(17021,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17368,.eq (17028,false) (17027,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17368,.eq (17028,false) (17027,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17369,.and [(17028,false),(17027,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17369,.and [(17028,false),(17027,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17370,.eq (17032,false) (17031,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17370,.eq (17032,false) (17031,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17371,.and [(17032,false),(17031,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17371,.and [(17032,false),(17031,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17372,.eq (17036,false) (17035,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17372,.eq (17036,false) (17035,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17373,.and [(17036,false),(17035,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17373,.and [(17036,false),(17035,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17374,.eq (17040,false) (17039,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17374,.eq (17040,false) (17039,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17375,.and [(17040,false),(17039,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17375,.and [(17040,false),(17039,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17376,.eq (17044,false) (17043,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17376,.eq (17044,false) (17043,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17377,.and [(17044,false),(17043,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17377,.and [(17044,false),(17043,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17378,.eq (17048,false) (17047,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17378,.eq (17048,false) (17047,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17379,.and [(17048,false),(17047,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17379,.and [(17048,false),(17047,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17380,.eq (17052,false) (17051,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17380,.eq (17052,false) (17051,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17381,.and [(17052,false),(17051,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17381,.and [(17052,false),(17051,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17382,.eq (17059,false) (17058,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17382,.eq (17059,false) (17058,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17383,.and [(17059,false),(17058,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17383,.and [(17059,false),(17058,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17384,.eq (17063,false) (17062,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17384,.eq (17063,false) (17062,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17385,.and [(17063,false),(17062,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17385,.and [(17063,false),(17062,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17386,.eq (17067,false) (17066,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17386,.eq (17067,false) (17066,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17387,.and [(17067,false),(17066,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17387,.and [(17067,false),(17066,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17388,.eq (17071,false) (17070,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17388,.eq (17071,false) (17070,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17389,.and [(17071,false),(17070,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17389,.and [(17071,false),(17070,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17390,.eq (17075,false) (17074,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17390,.eq (17075,false) (17074,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17391,.and [(17075,false),(17074,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17391,.and [(17075,false),(17074,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17392,.eq (17084,false) (17083,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17392,.eq (17084,false) (17083,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17393,.and [(17084,false),(17083,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17393,.and [(17084,false),(17083,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17394,.eq (17088,false) (17087,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17394,.eq (17088,false) (17087,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17395,.and [(17088,false),(17087,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17395,.and [(17088,false),(17087,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17396,.eq (17093,false) (17092,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17396,.eq (17093,false) (17092,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17397,.and [(17093,false),(17092,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17397,.and [(17093,false),(17092,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17398,.eq (17097,false) (17096,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17398,.eq (17097,false) (17096,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17399,.and [(17097,false),(17096,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17399,.and [(17097,false),(17096,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17400,.eq (17102,false) (17101,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17400,.eq (17102,false) (17101,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17401,.and [(17102,false),(17101,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17401,.and [(17102,false),(17101,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17402,.eq (17106,false) (17105,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17402,.eq (17106,false) (17105,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17403,.and [(17106,false),(17105,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17403,.and [(17106,false),(17105,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17404,.eq (17112,false) (17111,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17404,.eq (17112,false) (17111,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17405,.and [(17112,false),(17111,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17405,.and [(17112,false),(17111,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17406,.eq (17116,false) (17115,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17406,.eq (17116,false) (17115,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17407,.and [(17116,false),(17115,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17407,.and [(17116,false),(17115,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17408,.eq (17120,false) (17119,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17408,.eq (17120,false) (17119,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17409,.and [(17120,false),(17119,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17409,.and [(17120,false),(17119,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17410,.eq (17127,false) (17126,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17410,.eq (17127,false) (17126,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17411,.and [(17127,false),(17126,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17411,.and [(17127,false),(17126,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17412,.eq (17131,false) (17130,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17412,.eq (17131,false) (17130,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17413,.and [(17131,false),(17130,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17413,.and [(17131,false),(17130,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17414,.eq (17136,false) (17134,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17414,.eq (17136,false) (17134,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17415,.and [(17136,false),(17134,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17415,.and [(17136,false),(17134,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17416,.eq (17137,false) (17135,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17416,.eq (17137,false) (17135,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17417,.eq (17416,false) (17415,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17417,.eq (17416,false) (17415,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17418,.majority (17135,true) (17137,true) (17415,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17418,.majority (17135,true) (17137,true) (17415,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17419,.eq (17140,false) (17138,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17419,.eq (17140,false) (17138,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17420,.and [(17140,false),(17138,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17420,.and [(17140,false),(17138,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17421,.eq (17141,false) (17139,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17421,.eq (17141,false) (17139,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17422,.eq (17421,false) (17420,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17422,.eq (17421,false) (17420,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17423,.majority (17139,true) (17141,true) (17420,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17423,.majority (17139,true) (17141,true) (17420,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17424,.eq (17144,false) (17142,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17424,.eq (17144,false) (17142,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17425,.and [(17144,false),(17142,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17425,.and [(17144,false),(17142,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17426,.eq (17145,false) (17143,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17426,.eq (17145,false) (17143,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17427,.eq (17426,false) (17425,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17427,.eq (17426,false) (17425,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17428,.majority (17143,true) (17145,true) (17425,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17428,.majority (17143,true) (17145,true) (17425,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17429,.eq (17148,false) (17146,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17429,.eq (17148,false) (17146,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17430,.and [(17148,false),(17146,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17430,.and [(17148,false),(17146,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17431,.eq (17149,false) (17147,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17431,.eq (17149,false) (17147,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17432,.eq (17431,false) (17430,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17432,.eq (17431,false) (17430,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17433,.majority (17147,true) (17149,true) (17430,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17433,.majority (17147,true) (17149,true) (17430,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17434,.eq (17152,false) (17150,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17434,.eq (17152,false) (17150,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17435,.and [(17152,false),(17150,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17435,.and [(17152,false),(17150,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17436,.eq (17153,false) (17151,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17436,.eq (17153,false) (17151,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17437,.eq (17436,false) (17435,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17437,.eq (17436,false) (17435,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17438,.majority (17151,true) (17153,true) (17435,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17438,.majority (17151,true) (17153,true) (17435,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17439,.eq (17156,false) (17154,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17439,.eq (17156,false) (17154,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17440,.and [(17156,false),(17154,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17440,.and [(17156,false),(17154,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17441,.eq (17157,false) (17155,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17441,.eq (17157,false) (17155,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17442,.eq (17441,false) (17440,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17442,.eq (17441,false) (17440,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17443,.majority (17155,true) (17157,true) (17440,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17443,.majority (17155,true) (17157,true) (17440,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17444,.eq (17160,false) (17158,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17444,.eq (17160,false) (17158,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17445,.and [(17160,false),(17158,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17445,.and [(17160,false),(17158,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17446,.eq (17161,false) (17159,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17446,.eq (17161,false) (17159,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17447,.eq (17446,false) (17445,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17447,.eq (17446,false) (17445,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17448,.majority (17159,true) (17161,true) (17445,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17448,.majority (17159,true) (17161,true) (17445,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17449,.eq (17164,false) (17162,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17449,.eq (17164,false) (17162,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17450,.and [(17164,false),(17162,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17450,.and [(17164,false),(17162,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17451,.eq (17165,false) (17163,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17451,.eq (17165,false) (17163,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17452,.eq (17451,false) (17450,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17452,.eq (17451,false) (17450,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17453,.majority (17163,true) (17165,true) (17450,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17453,.majority (17163,true) (17165,true) (17450,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17454,.eq (17168,false) (17166,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17454,.eq (17168,false) (17166,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17455,.and [(17168,false),(17166,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17455,.and [(17168,false),(17166,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17456,.eq (17169,false) (17167,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17456,.eq (17169,false) (17167,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17457,.eq (17456,false) (17455,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17457,.eq (17456,false) (17455,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17458,.majority (17167,true) (17169,true) (17455,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17458,.majority (17167,true) (17169,true) (17455,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17459,.eq (17172,false) (17170,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17459,.eq (17172,false) (17170,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17460,.and [(17172,false),(17170,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17460,.and [(17172,false),(17170,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17461,.eq (17173,false) (17171,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17461,.eq (17173,false) (17171,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17462,.eq (17461,false) (17460,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17462,.eq (17461,false) (17460,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17463,.majority (17171,true) (17173,true) (17460,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17463,.majority (17171,true) (17173,true) (17460,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17464,.eq (17176,false) (17174,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17464,.eq (17176,false) (17174,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17465,.and [(17176,false),(17174,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17465,.and [(17176,false),(17174,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17466,.eq (17177,false) (17175,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17466,.eq (17177,false) (17175,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17467,.eq (17466,false) (17465,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17467,.eq (17466,false) (17465,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17468,.majority (17175,true) (17177,true) (17465,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17468,.majority (17175,true) (17177,true) (17465,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17469,.eq (17180,false) (17178,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17469,.eq (17180,false) (17178,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17470,.and [(17180,false),(17178,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17470,.and [(17180,false),(17178,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17471,.eq (17181,false) (17179,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17471,.eq (17181,false) (17179,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17472,.eq (17471,false) (17470,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17472,.eq (17471,false) (17470,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17473,.majority (17179,true) (17181,true) (17470,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17473,.majority (17179,true) (17181,true) (17470,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17474,.eq (17184,false) (17182,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17474,.eq (17184,false) (17182,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17475,.and [(17184,false),(17182,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17475,.and [(17184,false),(17182,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17476,.eq (17185,false) (17183,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17476,.eq (17185,false) (17183,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17477,.eq (17476,false) (17475,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17477,.eq (17476,false) (17475,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17478,.majority (17183,true) (17185,true) (17475,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17478,.majority (17183,true) (17185,true) (17475,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17479,.eq (17188,false) (17186,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17479,.eq (17188,false) (17186,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17480,.and [(17188,false),(17186,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17480,.and [(17188,false),(17186,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17481,.eq (17189,false) (17187,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17481,.eq (17189,false) (17187,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17482,.eq (17481,false) (17480,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17482,.eq (17481,false) (17480,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17483,.majority (17187,true) (17189,true) (17480,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17483,.majority (17187,true) (17189,true) (17480,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17484,.eq (17192,false) (17190,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17484,.eq (17192,false) (17190,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17485,.and [(17192,false),(17190,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17485,.and [(17192,false),(17190,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17486,.eq (17193,false) (17191,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17486,.eq (17193,false) (17191,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17487,.eq (17486,false) (17485,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17487,.eq (17486,false) (17485,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17488,.majority (17191,true) (17193,true) (17485,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17488,.majority (17191,true) (17193,true) (17485,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17489,.eq (17196,false) (17194,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17489,.eq (17196,false) (17194,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17490,.and [(17196,false),(17194,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17490,.and [(17196,false),(17194,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17491,.eq (17197,false) (17195,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17491,.eq (17197,false) (17195,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17492,.eq (17491,false) (17490,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17492,.eq (17491,false) (17490,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17493,.majority (17195,true) (17197,true) (17490,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17493,.majority (17195,true) (17197,true) (17490,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17494,.eq (17200,false) (17198,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17494,.eq (17200,false) (17198,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17495,.and [(17200,false),(17198,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17495,.and [(17200,false),(17198,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17496,.eq (17201,false) (17199,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17496,.eq (17201,false) (17199,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17497,.eq (17496,false) (17495,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17497,.eq (17496,false) (17495,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17498,.majority (17199,true) (17201,true) (17495,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17498,.majority (17199,true) (17201,true) (17495,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17499,.eq (17204,false) (17202,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17499,.eq (17204,false) (17202,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17500,.and [(17204,false),(17202,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17500,.and [(17204,false),(17202,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17501,.eq (17205,false) (17203,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17501,.eq (17205,false) (17203,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17502,.eq (17501,false) (17500,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17502,.eq (17501,false) (17500,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17503,.majority (17203,true) (17205,true) (17500,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17503,.majority (17203,true) (17205,true) (17500,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17504,.eq (17208,false) (17206,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17504,.eq (17208,false) (17206,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17505,.and [(17208,false),(17206,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17505,.and [(17208,false),(17206,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17506,.eq (17209,false) (17207,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17506,.eq (17209,false) (17207,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17507,.eq (17506,false) (17505,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17507,.eq (17506,false) (17505,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17508,.majority (17207,true) (17209,true) (17505,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17508,.majority (17207,true) (17209,true) (17505,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17509,.eq (17212,false) (17210,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17509,.eq (17212,false) (17210,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17510,.and [(17212,false),(17210,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17510,.and [(17212,false),(17210,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17511,.eq (17213,false) (17211,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17511,.eq (17213,false) (17211,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17512,.eq (17511,false) (17510,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17512,.eq (17511,false) (17510,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17513,.majority (17211,true) (17213,true) (17510,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17513,.majority (17211,true) (17213,true) (17510,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17514,.eq (17216,false) (17214,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17514,.eq (17216,false) (17214,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17515,.and [(17216,false),(17214,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17515,.and [(17216,false),(17214,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17516,.eq (17217,false) (17215,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17516,.eq (17217,false) (17215,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17517,.eq (17516,false) (17515,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17517,.eq (17516,false) (17515,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17518,.majority (17215,true) (17217,true) (17515,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17518,.majority (17215,true) (17217,true) (17515,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17519,.eq (17220,false) (17218,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17519,.eq (17220,false) (17218,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17520,.and [(17220,false),(17218,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17520,.and [(17220,false),(17218,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17521,.eq (17221,false) (17219,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17521,.eq (17221,false) (17219,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17522,.eq (17521,false) (17520,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17522,.eq (17521,false) (17520,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17523,.majority (17219,true) (17221,true) (17520,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17523,.majority (17219,true) (17221,true) (17520,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17524,.eq (17224,false) (17222,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17524,.eq (17224,false) (17222,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17525,.and [(17224,false),(17222,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17525,.and [(17224,false),(17222,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17526,.eq (17225,false) (17223,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17526,.eq (17225,false) (17223,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17527,.eq (17526,false) (17525,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17527,.eq (17526,false) (17525,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17528,.majority (17223,true) (17225,true) (17525,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17528,.majority (17223,true) (17225,true) (17525,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17529,.eq (17228,false) (17226,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17529,.eq (17228,false) (17226,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17530,.and [(17228,false),(17226,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17530,.and [(17228,false),(17226,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17531,.eq (17229,false) (17227,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17531,.eq (17229,false) (17227,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17532,.eq (17531,false) (17530,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17532,.eq (17531,false) (17530,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17533,.majority (17227,true) (17229,true) (17530,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17533,.majority (17227,true) (17229,true) (17530,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17534,.eq (17232,false) (17230,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17534,.eq (17232,false) (17230,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17535,.and [(17232,false),(17230,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17535,.and [(17232,false),(17230,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17536,.eq (17233,false) (17231,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17536,.eq (17233,false) (17231,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17537,.eq (17536,false) (17535,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17537,.eq (17536,false) (17535,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17538,.majority (17231,true) (17233,true) (17535,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17538,.majority (17231,true) (17233,true) (17535,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17539,.eq (17236,false) (17234,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17539,.eq (17236,false) (17234,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17540,.and [(17236,false),(17234,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17540,.and [(17236,false),(17234,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17541,.eq (17237,false) (17235,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17541,.eq (17237,false) (17235,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17542,.eq (17541,false) (17540,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17542,.eq (17541,false) (17540,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17543,.majority (17235,true) (17237,true) (17540,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17543,.majority (17235,true) (17237,true) (17540,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17544,.eq (17240,false) (17238,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17544,.eq (17240,false) (17238,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17545,.and [(17240,false),(17238,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17545,.and [(17240,false),(17238,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17546,.eq (17241,false) (17239,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17546,.eq (17241,false) (17239,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17547,.eq (17546,false) (17545,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17547,.eq (17546,false) (17545,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17548,.majority (17239,true) (17241,true) (17545,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17548,.majority (17239,true) (17241,true) (17545,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17549,.eq (17244,false) (17242,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17549,.eq (17244,false) (17242,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17550,.and [(17244,false),(17242,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17550,.and [(17244,false),(17242,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17551,.eq (17245,false) (17243,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17551,.eq (17245,false) (17243,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17552,.eq (17551,false) (17550,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17552,.eq (17551,false) (17550,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17553,.majority (17243,true) (17245,true) (17550,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17553,.majority (17243,true) (17245,true) (17550,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17554,.eq (17248,false) (17246,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17554,.eq (17248,false) (17246,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17555,.and [(17248,false),(17246,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17555,.and [(17248,false),(17246,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17556,.eq (17249,false) (17247,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17556,.eq (17249,false) (17247,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17557,.eq (17556,false) (17555,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17557,.eq (17556,false) (17555,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17558,.majority (17247,true) (17249,true) (17555,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17558,.majority (17247,true) (17249,true) (17555,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17559,.eq (17252,false) (17250,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17559,.eq (17252,false) (17250,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17560,.and [(17252,false),(17250,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17560,.and [(17252,false),(17250,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17561,.eq (17253,false) (17251,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17561,.eq (17253,false) (17251,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17562,.eq (17561,false) (17560,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17562,.eq (17561,false) (17560,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17563,.majority (17251,true) (17253,true) (17560,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17563,.majority (17251,true) (17253,true) (17560,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17564,.eq (17256,false) (17254,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17564,.eq (17256,false) (17254,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17565,.and [(17256,false),(17254,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17565,.and [(17256,false),(17254,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17566,.eq (17257,false) (17255,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17566,.eq (17257,false) (17255,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17567,.eq (17566,false) (17565,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17567,.eq (17566,false) (17565,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17568,.majority (17255,true) (17257,true) (17565,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17568,.majority (17255,true) (17257,true) (17565,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17569,.eq (17260,false) (17258,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17569,.eq (17260,false) (17258,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17570,.and [(17260,false),(17258,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17570,.and [(17260,false),(17258,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17571,.eq (17261,false) (17259,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17571,.eq (17261,false) (17259,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17572,.eq (17571,false) (17570,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17572,.eq (17571,false) (17570,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17573,.majority (17259,true) (17261,true) (17570,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17573,.majority (17259,true) (17261,true) (17570,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17574,.eq (17264,false) (17262,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17574,.eq (17264,false) (17262,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17575,.and [(17264,false),(17262,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17575,.and [(17264,false),(17262,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17576,.eq (17265,false) (17263,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17576,.eq (17265,false) (17263,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17577,.eq (17576,false) (17575,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17577,.eq (17576,false) (17575,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17578,.majority (17263,true) (17265,true) (17575,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17578,.majority (17263,true) (17265,true) (17575,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17579,.eq (17268,false) (17266,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17579,.eq (17268,false) (17266,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17580,.and [(17268,false),(17266,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17580,.and [(17268,false),(17266,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17581,.eq (17269,false) (17267,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17581,.eq (17269,false) (17267,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17582,.eq (17581,false) (17580,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17582,.eq (17581,false) (17580,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17583,.majority (17267,true) (17269,true) (17580,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17583,.majority (17267,true) (17269,true) (17580,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17584,.eq (17272,false) (17270,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17584,.eq (17272,false) (17270,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17585,.and [(17272,false),(17270,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17585,.and [(17272,false),(17270,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17586,.eq (17273,false) (17271,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17586,.eq (17273,false) (17271,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17587,.eq (17586,false) (17585,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17587,.eq (17586,false) (17585,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17588,.majority (17271,true) (17273,true) (17585,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17588,.majority (17271,true) (17273,true) (17585,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17589,.eq (17276,false) (17274,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17589,.eq (17276,false) (17274,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17590,.and [(17276,false),(17274,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17590,.and [(17276,false),(17274,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17591,.eq (17277,false) (17275,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17591,.eq (17277,false) (17275,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17592,.eq (17591,false) (17590,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17592,.eq (17591,false) (17590,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17593,.majority (17275,true) (17277,true) (17590,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17593,.majority (17275,true) (17277,true) (17590,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17594,.eq (17280,false) (17278,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17594,.eq (17280,false) (17278,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17595,.and [(17280,false),(17278,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17595,.and [(17280,false),(17278,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17596,.eq (17281,false) (17279,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17596,.eq (17281,false) (17279,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17597,.eq (17596,false) (17595,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17597,.eq (17596,false) (17595,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17598,.majority (17279,true) (17281,true) (17595,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17598,.majority (17279,true) (17281,true) (17595,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17599,.eq (17284,false) (17282,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17599,.eq (17284,false) (17282,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17600,.and [(17284,false),(17282,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17600,.and [(17284,false),(17282,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17601,.eq (17285,false) (17283,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17601,.eq (17285,false) (17283,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17602,.eq (17601,false) (17600,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17602,.eq (17601,false) (17600,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17603,.majority (17283,true) (17285,true) (17600,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17603,.majority (17283,true) (17285,true) (17600,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17604,.eq (17288,false) (17286,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17604,.eq (17288,false) (17286,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17605,.and [(17288,false),(17286,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17605,.and [(17288,false),(17286,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17606,.eq (17289,false) (17287,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17606,.eq (17289,false) (17287,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17607,.eq (17606,false) (17605,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17607,.eq (17606,false) (17605,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17608,.majority (17287,true) (17289,true) (17605,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17608,.majority (17287,true) (17289,true) (17605,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17609,.eq (17292,false) (17290,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17609,.eq (17292,false) (17290,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17610,.and [(17292,false),(17290,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17610,.and [(17292,false),(17290,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17611,.eq (17293,false) (17291,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17611,.eq (17293,false) (17291,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17612,.eq (17611,false) (17610,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17612,.eq (17611,false) (17610,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17613,.majority (17291,true) (17293,true) (17610,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17613,.majority (17291,true) (17293,true) (17610,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17614,.eq (17296,false) (17294,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17614,.eq (17296,false) (17294,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17615,.and [(17296,false),(17294,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17615,.and [(17296,false),(17294,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17616,.eq (17297,false) (17295,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17616,.eq (17297,false) (17295,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17617,.eq (17616,false) (17615,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17617,.eq (17616,false) (17615,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17618,.majority (17295,true) (17297,true) (17615,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17618,.majority (17295,true) (17297,true) (17615,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17619,.eq (17300,false) (17298,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17619,.eq (17300,false) (17298,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17620,.and [(17300,false),(17298,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17620,.and [(17300,false),(17298,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17621,.eq (17301,false) (17299,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17621,.eq (17301,false) (17299,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17622,.eq (17621,false) (17620,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17622,.eq (17621,false) (17620,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17623,.majority (17299,true) (17301,true) (17620,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17623,.majority (17299,true) (17301,true) (17620,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17624,.eq (17304,false) (17302,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17624,.eq (17304,false) (17302,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17625,.and [(17304,false),(17302,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17625,.and [(17304,false),(17302,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17626,.eq (17305,false) (17303,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17626,.eq (17305,false) (17303,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17627,.eq (17626,false) (17625,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17627,.eq (17626,false) (17625,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17628,.majority (17303,true) (17305,true) (17625,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17628,.majority (17303,true) (17305,true) (17625,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17629,.eq (17308,false) (17306,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17629,.eq (17308,false) (17306,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17630,.and [(17308,false),(17306,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17630,.and [(17308,false),(17306,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17631,.eq (17309,false) (17307,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17631,.eq (17309,false) (17307,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17632,.eq (17631,false) (17630,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17632,.eq (17631,false) (17630,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17633,.majority (17307,true) (17309,true) (17630,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17633,.majority (17307,true) (17309,true) (17630,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17634,.eq (17312,false) (17310,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17634,.eq (17312,false) (17310,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17635,.and [(17312,false),(17310,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17635,.and [(17312,false),(17310,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17636,.eq (17313,false) (17311,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17636,.eq (17313,false) (17311,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17637,.eq (17636,false) (17635,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17637,.eq (17636,false) (17635,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17638,.majority (17311,true) (17313,true) (17635,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17638,.majority (17311,true) (17313,true) (17635,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17639,.eq (17316,false) (17314,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17639,.eq (17316,false) (17314,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17640,.and [(17316,false),(17314,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17640,.and [(17316,false),(17314,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17641,.eq (17317,false) (17315,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17641,.eq (17317,false) (17315,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17642,.eq (17641,false) (17640,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17642,.eq (17641,false) (17640,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17643,.majority (17315,true) (17317,true) (17640,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17643,.majority (17315,true) (17317,true) (17640,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17644,.eq (17320,false) (17318,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17644,.eq (17320,false) (17318,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17645,.and [(17320,false),(17318,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17645,.and [(17320,false),(17318,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17646,.eq (17321,false) (17319,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17646,.eq (17321,false) (17319,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17647,.eq (17646,false) (17645,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17647,.eq (17646,false) (17645,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17648,.majority (17319,true) (17321,true) (17645,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17648,.majority (17319,true) (17321,true) (17645,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17649,.eq (17324,false) (17322,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17649,.eq (17324,false) (17322,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17650,.and [(17324,false),(17322,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17650,.and [(17324,false),(17322,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17651,.eq (17325,false) (17323,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17651,.eq (17325,false) (17323,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17652,.eq (17651,false) (17650,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17652,.eq (17651,false) (17650,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17653,.majority (17323,true) (17325,true) (17650,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17653,.majority (17323,true) (17325,true) (17650,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17654,.eq (17328,false) (17326,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17654,.eq (17328,false) (17326,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17655,.and [(17328,false),(17326,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17655,.and [(17328,false),(17326,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17656,.eq (17329,false) (17327,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17656,.eq (17329,false) (17327,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17657,.eq (17656,false) (17655,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17657,.eq (17656,false) (17655,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17658,.majority (17327,true) (17329,true) (17655,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17658,.majority (17327,true) (17329,true) (17655,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17659,.eq (17332,false) (17330,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17659,.eq (17332,false) (17330,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17660,.and [(17332,false),(17330,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17660,.and [(17332,false),(17330,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17661,.eq (17333,false) (17331,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17661,.eq (17333,false) (17331,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17662,.eq (17661,false) (17660,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17662,.eq (17661,false) (17660,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17663,.majority (17331,true) (17333,true) (17660,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17663,.majority (17331,true) (17333,true) (17660,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17664,.eq (17336,false) (17334,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17664,.eq (17336,false) (17334,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17665,.and [(17336,false),(17334,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17665,.and [(17336,false),(17334,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17666,.eq (17337,false) (17335,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17666,.eq (17337,false) (17335,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17667,.eq (17666,false) (17665,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17667,.eq (17666,false) (17665,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17668,.majority (17335,true) (17337,true) (17665,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17668,.majority (17335,true) (17337,true) (17665,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17669,.eq (17340,false) (17338,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17669,.eq (17340,false) (17338,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17670,.and [(17340,false),(17338,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17670,.and [(17340,false),(17338,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17671,.eq (17341,false) (17339,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17671,.eq (17341,false) (17339,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17672,.eq (17671,false) (17670,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17672,.eq (17671,false) (17670,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17673,.majority (17339,true) (17341,true) (17670,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17673,.majority (17339,true) (17341,true) (17670,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17674,.eq (17344,false) (17342,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17674,.eq (17344,false) (17342,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17675,.and [(17344,false),(17342,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17675,.and [(17344,false),(17342,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17676,.eq (17345,false) (17343,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17676,.eq (17345,false) (17343,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17677,.eq (17676,false) (17675,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17677,.eq (17676,false) (17675,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17678,.majority (17343,true) (17345,true) (17675,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17678,.majority (17343,true) (17345,true) (17675,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17679,.eq (17348,false) (17346,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17679,.eq (17348,false) (17346,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17680,.and [(17348,false),(17346,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17680,.and [(17348,false),(17346,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17681,.eq (17349,false) (17347,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17681,.eq (17349,false) (17347,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17682,.eq (17681,false) (17680,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17682,.eq (17681,false) (17680,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17683,.majority (17347,true) (17349,true) (17680,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17683,.majority (17347,true) (17349,true) (17680,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17684,.eq (17352,false) (17350,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17684,.eq (17352,false) (17350,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17685,.and [(17352,false),(17350,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17685,.and [(17352,false),(17350,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17686,.eq (17353,false) (17351,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17686,.eq (17353,false) (17351,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17687,.eq (17686,false) (17685,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17687,.eq (17686,false) (17685,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17688,.majority (17351,true) (17353,true) (17685,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17688,.majority (17351,true) (17353,true) (17685,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17689,.eq (17356,false) (17354,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17689,.eq (17356,false) (17354,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17690,.and [(17356,false),(17354,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17690,.and [(17356,false),(17354,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17691,.eq (17357,false) (17355,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17691,.eq (17357,false) (17355,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17692,.eq (17691,false) (17690,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17692,.eq (17691,false) (17690,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17693,.majority (17355,true) (17357,true) (17690,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17693,.majority (17355,true) (17357,true) (17690,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17694,.eq (17360,false) (17358,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17694,.eq (17360,false) (17358,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17695,.and [(17360,false),(17358,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17695,.and [(17360,false),(17358,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17696,.eq (17361,false) (17359,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17696,.eq (17361,false) (17359,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17697,.eq (17696,false) (17695,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17697,.eq (17696,false) (17695,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17698,.majority (17359,true) (17361,true) (17695,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17698,.majority (17359,true) (17361,true) (17695,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17699,.eq (17364,false) (17362,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17699,.eq (17364,false) (17362,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17700,.and [(17364,false),(17362,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17700,.and [(17364,false),(17362,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17701,.eq (17365,false) (17363,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17701,.eq (17365,false) (17363,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17702,.eq (17701,false) (17700,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17702,.eq (17701,false) (17700,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17703,.majority (17363,true) (17365,true) (17700,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17703,.majority (17363,true) (17365,true) (17700,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17704,.eq (17368,false) (17366,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17704,.eq (17368,false) (17366,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17705,.and [(17368,false),(17366,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17705,.and [(17368,false),(17366,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17706,.eq (17369,false) (17367,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17706,.eq (17369,false) (17367,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17707,.eq (17706,false) (17705,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17707,.eq (17706,false) (17705,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17708,.majority (17367,true) (17369,true) (17705,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17708,.majority (17367,true) (17369,true) (17705,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17709,.eq (17372,false) (17370,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17709,.eq (17372,false) (17370,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17710,.and [(17372,false),(17370,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17710,.and [(17372,false),(17370,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17711,.eq (17373,false) (17371,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17711,.eq (17373,false) (17371,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17712,.eq (17711,false) (17710,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17712,.eq (17711,false) (17710,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17713,.majority (17371,true) (17373,true) (17710,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17713,.majority (17371,true) (17373,true) (17710,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17714,.eq (17376,false) (17374,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17714,.eq (17376,false) (17374,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17715,.and [(17376,false),(17374,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17715,.and [(17376,false),(17374,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17716,.eq (17377,false) (17375,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17716,.eq (17377,false) (17375,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17717,.eq (17716,false) (17715,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17717,.eq (17716,false) (17715,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17718,.majority (17375,true) (17377,true) (17715,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17718,.majority (17375,true) (17377,true) (17715,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17719,.eq (17380,false) (17378,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17719,.eq (17380,false) (17378,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17720,.and [(17380,false),(17378,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17720,.and [(17380,false),(17378,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17721,.eq (17381,false) (17379,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17721,.eq (17381,false) (17379,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17722,.eq (17721,false) (17720,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17722,.eq (17721,false) (17720,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17723,.majority (17379,true) (17381,true) (17720,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17723,.majority (17379,true) (17381,true) (17720,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17724,.eq (17384,false) (17382,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17724,.eq (17384,false) (17382,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17725,.and [(17384,false),(17382,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17725,.and [(17384,false),(17382,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17726,.eq (17385,false) (17383,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17726,.eq (17385,false) (17383,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17727,.eq (17726,false) (17725,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17727,.eq (17726,false) (17725,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17728,.majority (17383,true) (17385,true) (17725,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17728,.majority (17383,true) (17385,true) (17725,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17729,.eq (17388,false) (17386,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17729,.eq (17388,false) (17386,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17730,.and [(17388,false),(17386,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17730,.and [(17388,false),(17386,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17731,.eq (17389,false) (17387,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17731,.eq (17389,false) (17387,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17732,.eq (17731,false) (17730,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17732,.eq (17731,false) (17730,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17733,.majority (17387,true) (17389,true) (17730,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17733,.majority (17387,true) (17389,true) (17730,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17734,.eq (17392,false) (17390,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17734,.eq (17392,false) (17390,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17735,.and [(17392,false),(17390,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17735,.and [(17392,false),(17390,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17736,.eq (17393,false) (17391,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17736,.eq (17393,false) (17391,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17737,.eq (17736,false) (17735,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17737,.eq (17736,false) (17735,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17738,.majority (17391,true) (17393,true) (17735,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17738,.majority (17391,true) (17393,true) (17735,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17739,.eq (17396,false) (17394,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17739,.eq (17396,false) (17394,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17740,.and [(17396,false),(17394,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17740,.and [(17396,false),(17394,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17741,.eq (17397,false) (17395,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17741,.eq (17397,false) (17395,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17742,.eq (17741,false) (17740,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17742,.eq (17741,false) (17740,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17743,.majority (17395,true) (17397,true) (17740,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17743,.majority (17395,true) (17397,true) (17740,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17744,.eq (17400,false) (17398,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17744,.eq (17400,false) (17398,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17745,.and [(17400,false),(17398,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17745,.and [(17400,false),(17398,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17746,.eq (17401,false) (17399,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17746,.eq (17401,false) (17399,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17747,.eq (17746,false) (17745,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17747,.eq (17746,false) (17745,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17748,.majority (17399,true) (17401,true) (17745,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17748,.majority (17399,true) (17401,true) (17745,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17749,.eq (17404,false) (17402,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17749,.eq (17404,false) (17402,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17750,.and [(17404,false),(17402,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17750,.and [(17404,false),(17402,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17751,.eq (17405,false) (17403,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17751,.eq (17405,false) (17403,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17752,.eq (17751,false) (17750,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17752,.eq (17751,false) (17750,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17753,.majority (17403,true) (17405,true) (17750,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17753,.majority (17403,true) (17405,true) (17750,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17754,.eq (17408,false) (17406,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17754,.eq (17408,false) (17406,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17755,.and [(17408,false),(17406,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17755,.and [(17408,false),(17406,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17756,.eq (17409,false) (17407,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17756,.eq (17409,false) (17407,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17757,.eq (17756,false) (17755,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17757,.eq (17756,false) (17755,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17758,.majority (17407,true) (17409,true) (17755,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17758,.majority (17407,true) (17409,true) (17755,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17759,.eq (17412,false) (17410,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17759,.eq (17412,false) (17410,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17760,.and [(17412,false),(17410,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17760,.and [(17412,false),(17410,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17761,.eq (17413,false) (17411,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17761,.eq (17413,false) (17411,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17762,.eq (17761,false) (17760,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17762,.eq (17761,false) (17760,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17763,.majority (17411,true) (17413,true) (17760,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17763,.majority (17411,true) (17413,true) (17760,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17764,.eq (17419,false) (17414,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17764,.eq (17419,false) (17414,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17765,.and [(17419,false),(17414,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17765,.and [(17419,false),(17414,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17766,.eq (17422,false) (17417,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17766,.eq (17422,false) (17417,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17767,.eq (17766,false) (17765,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17767,.eq (17766,false) (17765,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17768,.majority (17422,false) (17417,false) (17765,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17768,.majority (17422,false) (17417,false) (17765,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17769,.eq (17423,false) (17418,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17769,.eq (17423,false) (17418,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17770,.eq (17769,false) (17768,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17770,.eq (17769,false) (17768,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17771,.majority (17418,true) (17423,true) (17768,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17771,.majority (17418,true) (17423,true) (17768,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17772,.eq (17429,false) (17424,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17772,.eq (17429,false) (17424,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17773,.and [(17429,false),(17424,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17773,.and [(17429,false),(17424,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17774,.eq (17432,false) (17427,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17774,.eq (17432,false) (17427,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17775,.eq (17774,false) (17773,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17775,.eq (17774,false) (17773,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17776,.majority (17432,false) (17427,false) (17773,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17776,.majority (17432,false) (17427,false) (17773,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17777,.eq (17433,false) (17428,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17777,.eq (17433,false) (17428,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17778,.eq (17777,false) (17776,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17778,.eq (17777,false) (17776,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17779,.majority (17428,true) (17433,true) (17776,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17779,.majority (17428,true) (17433,true) (17776,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17780,.eq (17439,false) (17434,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17780,.eq (17439,false) (17434,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17781,.and [(17439,false),(17434,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17781,.and [(17439,false),(17434,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17782,.eq (17442,false) (17437,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17782,.eq (17442,false) (17437,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17783,.eq (17782,false) (17781,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17783,.eq (17782,false) (17781,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17784,.majority (17442,false) (17437,false) (17781,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17784,.majority (17442,false) (17437,false) (17781,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17785,.eq (17443,false) (17438,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17785,.eq (17443,false) (17438,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17786,.eq (17785,false) (17784,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17786,.eq (17785,false) (17784,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17787,.majority (17438,true) (17443,true) (17784,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17787,.majority (17438,true) (17443,true) (17784,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17788,.eq (17449,false) (17444,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17788,.eq (17449,false) (17444,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17789,.and [(17449,false),(17444,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17789,.and [(17449,false),(17444,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17790,.eq (17452,false) (17447,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17790,.eq (17452,false) (17447,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17791,.eq (17790,false) (17789,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17791,.eq (17790,false) (17789,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17792,.majority (17452,false) (17447,false) (17789,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17792,.majority (17452,false) (17447,false) (17789,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17793,.eq (17453,false) (17448,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17793,.eq (17453,false) (17448,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17794,.eq (17793,false) (17792,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17794,.eq (17793,false) (17792,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17795,.majority (17448,true) (17453,true) (17792,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17795,.majority (17448,true) (17453,true) (17792,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17796,.eq (17459,false) (17454,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17796,.eq (17459,false) (17454,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17797,.and [(17459,false),(17454,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17797,.and [(17459,false),(17454,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17798,.eq (17462,false) (17457,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17798,.eq (17462,false) (17457,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17799,.eq (17798,false) (17797,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17799,.eq (17798,false) (17797,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17800,.majority (17462,false) (17457,false) (17797,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17800,.majority (17462,false) (17457,false) (17797,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17801,.eq (17463,false) (17458,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17801,.eq (17463,false) (17458,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17802,.eq (17801,false) (17800,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17802,.eq (17801,false) (17800,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17803,.majority (17458,true) (17463,true) (17800,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17803,.majority (17458,true) (17463,true) (17800,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17804,.eq (17469,false) (17464,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17804,.eq (17469,false) (17464,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17805,.and [(17469,false),(17464,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17805,.and [(17469,false),(17464,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17806,.eq (17472,false) (17467,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17806,.eq (17472,false) (17467,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17807,.eq (17806,false) (17805,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17807,.eq (17806,false) (17805,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17808,.majority (17472,false) (17467,false) (17805,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17808,.majority (17472,false) (17467,false) (17805,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17809,.eq (17473,false) (17468,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17809,.eq (17473,false) (17468,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17810,.eq (17809,false) (17808,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17810,.eq (17809,false) (17808,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17811,.majority (17468,true) (17473,true) (17808,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17811,.majority (17468,true) (17473,true) (17808,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17812,.eq (17479,false) (17474,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17812,.eq (17479,false) (17474,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17813,.and [(17479,false),(17474,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17813,.and [(17479,false),(17474,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17814,.eq (17482,false) (17477,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17814,.eq (17482,false) (17477,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17815,.eq (17814,false) (17813,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17815,.eq (17814,false) (17813,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17816,.majority (17482,false) (17477,false) (17813,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17816,.majority (17482,false) (17477,false) (17813,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17817,.eq (17483,false) (17478,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17817,.eq (17483,false) (17478,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17818,.eq (17817,false) (17816,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17818,.eq (17817,false) (17816,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17819,.majority (17478,true) (17483,true) (17816,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17819,.majority (17478,true) (17483,true) (17816,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17820,.eq (17489,false) (17484,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17820,.eq (17489,false) (17484,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17821,.and [(17489,false),(17484,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17821,.and [(17489,false),(17484,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17822,.eq (17492,false) (17487,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17822,.eq (17492,false) (17487,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17823,.eq (17822,false) (17821,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17823,.eq (17822,false) (17821,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17824,.majority (17492,false) (17487,false) (17821,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17824,.majority (17492,false) (17487,false) (17821,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17825,.eq (17493,false) (17488,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17825,.eq (17493,false) (17488,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17826,.eq (17825,false) (17824,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17826,.eq (17825,false) (17824,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17827,.majority (17488,true) (17493,true) (17824,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17827,.majority (17488,true) (17493,true) (17824,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17828,.eq (17499,false) (17494,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17828,.eq (17499,false) (17494,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17829,.and [(17499,false),(17494,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17829,.and [(17499,false),(17494,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17830,.eq (17502,false) (17497,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17830,.eq (17502,false) (17497,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17831,.eq (17830,false) (17829,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17831,.eq (17830,false) (17829,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17832,.majority (17502,false) (17497,false) (17829,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17832,.majority (17502,false) (17497,false) (17829,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17833,.eq (17503,false) (17498,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17833,.eq (17503,false) (17498,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17834,.eq (17833,false) (17832,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17834,.eq (17833,false) (17832,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17835,.majority (17498,true) (17503,true) (17832,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17835,.majority (17498,true) (17503,true) (17832,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17836,.eq (17509,false) (17504,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17836,.eq (17509,false) (17504,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17837,.and [(17509,false),(17504,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17837,.and [(17509,false),(17504,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17838,.eq (17512,false) (17507,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17838,.eq (17512,false) (17507,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17839,.eq (17838,false) (17837,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17839,.eq (17838,false) (17837,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17840,.majority (17512,false) (17507,false) (17837,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17840,.majority (17512,false) (17507,false) (17837,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17841,.eq (17513,false) (17508,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17841,.eq (17513,false) (17508,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17842,.eq (17841,false) (17840,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17842,.eq (17841,false) (17840,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17843,.majority (17508,true) (17513,true) (17840,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17843,.majority (17508,true) (17513,true) (17840,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17844,.eq (17519,false) (17514,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17844,.eq (17519,false) (17514,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17845,.and [(17519,false),(17514,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17845,.and [(17519,false),(17514,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17846,.eq (17522,false) (17517,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17846,.eq (17522,false) (17517,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17847,.eq (17846,false) (17845,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17847,.eq (17846,false) (17845,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17848,.majority (17522,false) (17517,false) (17845,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17848,.majority (17522,false) (17517,false) (17845,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17849,.eq (17523,false) (17518,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17849,.eq (17523,false) (17518,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17850,.eq (17849,false) (17848,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17850,.eq (17849,false) (17848,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17851,.majority (17518,true) (17523,true) (17848,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17851,.majority (17518,true) (17523,true) (17848,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17852,.eq (17529,false) (17524,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17852,.eq (17529,false) (17524,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17853,.and [(17529,false),(17524,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17853,.and [(17529,false),(17524,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17854,.eq (17532,false) (17527,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17854,.eq (17532,false) (17527,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17855,.eq (17854,false) (17853,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17855,.eq (17854,false) (17853,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17856,.majority (17532,false) (17527,false) (17853,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17856,.majority (17532,false) (17527,false) (17853,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17857,.eq (17533,false) (17528,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17857,.eq (17533,false) (17528,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17858,.eq (17857,false) (17856,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17858,.eq (17857,false) (17856,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17859,.majority (17528,true) (17533,true) (17856,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17859,.majority (17528,true) (17533,true) (17856,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17860,.eq (17539,false) (17534,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17860,.eq (17539,false) (17534,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17861,.and [(17539,false),(17534,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17861,.and [(17539,false),(17534,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17862,.eq (17542,false) (17537,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17862,.eq (17542,false) (17537,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17863,.eq (17862,false) (17861,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17863,.eq (17862,false) (17861,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17864,.majority (17542,false) (17537,false) (17861,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17864,.majority (17542,false) (17537,false) (17861,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17865,.eq (17543,false) (17538,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17865,.eq (17543,false) (17538,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17866,.eq (17865,false) (17864,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17866,.eq (17865,false) (17864,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17867,.majority (17538,true) (17543,true) (17864,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17867,.majority (17538,true) (17543,true) (17864,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17868,.eq (17549,false) (17544,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17868,.eq (17549,false) (17544,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17869,.and [(17549,false),(17544,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17869,.and [(17549,false),(17544,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17870,.eq (17552,false) (17547,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17870,.eq (17552,false) (17547,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17871,.eq (17870,false) (17869,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17871,.eq (17870,false) (17869,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17872,.majority (17552,false) (17547,false) (17869,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17872,.majority (17552,false) (17547,false) (17869,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17873,.eq (17553,false) (17548,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17873,.eq (17553,false) (17548,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17874,.eq (17873,false) (17872,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17874,.eq (17873,false) (17872,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17875,.majority (17548,true) (17553,true) (17872,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17875,.majority (17548,true) (17553,true) (17872,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17876,.eq (17559,false) (17554,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17876,.eq (17559,false) (17554,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17877,.and [(17559,false),(17554,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17877,.and [(17559,false),(17554,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17878,.eq (17562,false) (17557,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17878,.eq (17562,false) (17557,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17879,.eq (17878,false) (17877,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17879,.eq (17878,false) (17877,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17880,.majority (17562,false) (17557,false) (17877,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17880,.majority (17562,false) (17557,false) (17877,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17881,.eq (17563,false) (17558,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17881,.eq (17563,false) (17558,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17882,.eq (17881,false) (17880,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17882,.eq (17881,false) (17880,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17883,.majority (17558,true) (17563,true) (17880,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17883,.majority (17558,true) (17563,true) (17880,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17884,.eq (17569,false) (17564,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17884,.eq (17569,false) (17564,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17885,.and [(17569,false),(17564,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17885,.and [(17569,false),(17564,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17886,.eq (17572,false) (17567,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17886,.eq (17572,false) (17567,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17887,.eq (17886,false) (17885,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17887,.eq (17886,false) (17885,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17888,.majority (17572,false) (17567,false) (17885,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17888,.majority (17572,false) (17567,false) (17885,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17889,.eq (17573,false) (17568,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17889,.eq (17573,false) (17568,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17890,.eq (17889,false) (17888,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17890,.eq (17889,false) (17888,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17891,.majority (17568,true) (17573,true) (17888,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17891,.majority (17568,true) (17573,true) (17888,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17892,.eq (17579,false) (17574,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17892,.eq (17579,false) (17574,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17893,.and [(17579,false),(17574,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17893,.and [(17579,false),(17574,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17894,.eq (17582,false) (17577,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17894,.eq (17582,false) (17577,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17895,.eq (17894,false) (17893,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17895,.eq (17894,false) (17893,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17896,.majority (17582,false) (17577,false) (17893,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17896,.majority (17582,false) (17577,false) (17893,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17897,.eq (17583,false) (17578,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17897,.eq (17583,false) (17578,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17898,.eq (17897,false) (17896,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17898,.eq (17897,false) (17896,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17899,.majority (17578,true) (17583,true) (17896,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17899,.majority (17578,true) (17583,true) (17896,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17900,.eq (17589,false) (17584,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17900,.eq (17589,false) (17584,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17901,.and [(17589,false),(17584,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17901,.and [(17589,false),(17584,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17902,.eq (17592,false) (17587,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17902,.eq (17592,false) (17587,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17903,.eq (17902,false) (17901,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17903,.eq (17902,false) (17901,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17904,.majority (17592,false) (17587,false) (17901,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17904,.majority (17592,false) (17587,false) (17901,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17905,.eq (17593,false) (17588,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17905,.eq (17593,false) (17588,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17906,.eq (17905,false) (17904,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17906,.eq (17905,false) (17904,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17907,.majority (17588,true) (17593,true) (17904,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17907,.majority (17588,true) (17593,true) (17904,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17908,.eq (17599,false) (17594,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17908,.eq (17599,false) (17594,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17909,.and [(17599,false),(17594,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17909,.and [(17599,false),(17594,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17910,.eq (17602,false) (17597,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17910,.eq (17602,false) (17597,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17911,.eq (17910,false) (17909,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17911,.eq (17910,false) (17909,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17912,.majority (17602,false) (17597,false) (17909,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17912,.majority (17602,false) (17597,false) (17909,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17913,.eq (17603,false) (17598,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17913,.eq (17603,false) (17598,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17914,.eq (17913,false) (17912,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17914,.eq (17913,false) (17912,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17915,.majority (17598,true) (17603,true) (17912,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17915,.majority (17598,true) (17603,true) (17912,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17916,.eq (17609,false) (17604,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17916,.eq (17609,false) (17604,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17917,.and [(17609,false),(17604,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17917,.and [(17609,false),(17604,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17918,.eq (17612,false) (17607,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17918,.eq (17612,false) (17607,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17919,.eq (17918,false) (17917,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17919,.eq (17918,false) (17917,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17920,.majority (17612,false) (17607,false) (17917,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17920,.majority (17612,false) (17607,false) (17917,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17921,.eq (17613,false) (17608,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17921,.eq (17613,false) (17608,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17922,.eq (17921,false) (17920,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17922,.eq (17921,false) (17920,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17923,.majority (17608,true) (17613,true) (17920,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17923,.majority (17608,true) (17613,true) (17920,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17924,.eq (17619,false) (17614,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17924,.eq (17619,false) (17614,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17925,.and [(17619,false),(17614,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17925,.and [(17619,false),(17614,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17926,.eq (17622,false) (17617,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17926,.eq (17622,false) (17617,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17927,.eq (17926,false) (17925,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17927,.eq (17926,false) (17925,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17928,.majority (17622,false) (17617,false) (17925,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17928,.majority (17622,false) (17617,false) (17925,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17929,.eq (17623,false) (17618,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17929,.eq (17623,false) (17618,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17930,.eq (17929,false) (17928,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17930,.eq (17929,false) (17928,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17931,.majority (17618,true) (17623,true) (17928,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17931,.majority (17618,true) (17623,true) (17928,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17932,.eq (17629,false) (17624,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17932,.eq (17629,false) (17624,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17933,.and [(17629,false),(17624,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17933,.and [(17629,false),(17624,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17934,.eq (17632,false) (17627,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17934,.eq (17632,false) (17627,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17935,.eq (17934,false) (17933,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17935,.eq (17934,false) (17933,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17936,.majority (17632,false) (17627,false) (17933,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17936,.majority (17632,false) (17627,false) (17933,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17937,.eq (17633,false) (17628,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17937,.eq (17633,false) (17628,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17938,.eq (17937,false) (17936,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17938,.eq (17937,false) (17936,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17939,.majority (17628,true) (17633,true) (17936,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17939,.majority (17628,true) (17633,true) (17936,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17940,.eq (17639,false) (17634,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17940,.eq (17639,false) (17634,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17941,.and [(17639,false),(17634,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17941,.and [(17639,false),(17634,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17942,.eq (17642,false) (17637,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17942,.eq (17642,false) (17637,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17943,.eq (17942,false) (17941,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17943,.eq (17942,false) (17941,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17944,.majority (17642,false) (17637,false) (17941,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17944,.majority (17642,false) (17637,false) (17941,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17945,.eq (17643,false) (17638,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17945,.eq (17643,false) (17638,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17946,.eq (17945,false) (17944,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17946,.eq (17945,false) (17944,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17947,.majority (17638,true) (17643,true) (17944,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17947,.majority (17638,true) (17643,true) (17944,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17948,.eq (17649,false) (17644,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17948,.eq (17649,false) (17644,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17949,.and [(17649,false),(17644,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17949,.and [(17649,false),(17644,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17950,.eq (17652,false) (17647,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17950,.eq (17652,false) (17647,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17951,.eq (17950,false) (17949,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17951,.eq (17950,false) (17949,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17952,.majority (17652,false) (17647,false) (17949,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17952,.majority (17652,false) (17647,false) (17949,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17953,.eq (17653,false) (17648,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17953,.eq (17653,false) (17648,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17954,.eq (17953,false) (17952,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17954,.eq (17953,false) (17952,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17955,.majority (17648,true) (17653,true) (17952,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17955,.majority (17648,true) (17653,true) (17952,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17956,.eq (17659,false) (17654,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17956,.eq (17659,false) (17654,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17957,.and [(17659,false),(17654,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17957,.and [(17659,false),(17654,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17958,.eq (17662,false) (17657,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17958,.eq (17662,false) (17657,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17959,.eq (17958,false) (17957,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17959,.eq (17958,false) (17957,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17960,.majority (17662,false) (17657,false) (17957,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17960,.majority (17662,false) (17657,false) (17957,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17961,.eq (17663,false) (17658,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17961,.eq (17663,false) (17658,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17962,.eq (17961,false) (17960,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17962,.eq (17961,false) (17960,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17963,.majority (17658,true) (17663,true) (17960,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17963,.majority (17658,true) (17663,true) (17960,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17964,.eq (17669,false) (17664,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17964,.eq (17669,false) (17664,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17965,.and [(17669,false),(17664,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17965,.and [(17669,false),(17664,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17966,.eq (17672,false) (17667,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17966,.eq (17672,false) (17667,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17967,.eq (17966,false) (17965,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17967,.eq (17966,false) (17965,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17968,.majority (17672,false) (17667,false) (17965,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17968,.majority (17672,false) (17667,false) (17965,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17969,.eq (17673,false) (17668,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17969,.eq (17673,false) (17668,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17970,.eq (17969,false) (17968,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17970,.eq (17969,false) (17968,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17971,.majority (17668,true) (17673,true) (17968,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17971,.majority (17668,true) (17673,true) (17968,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17972,.eq (17679,false) (17674,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17972,.eq (17679,false) (17674,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17973,.and [(17679,false),(17674,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17973,.and [(17679,false),(17674,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17974,.eq (17682,false) (17677,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17974,.eq (17682,false) (17677,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17975,.eq (17974,false) (17973,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17975,.eq (17974,false) (17973,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17976,.majority (17682,false) (17677,false) (17973,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17976,.majority (17682,false) (17677,false) (17973,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17977,.eq (17683,false) (17678,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17977,.eq (17683,false) (17678,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17978,.eq (17977,false) (17976,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17978,.eq (17977,false) (17976,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17979,.majority (17678,true) (17683,true) (17976,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17979,.majority (17678,true) (17683,true) (17976,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17980,.eq (17689,false) (17684,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17980,.eq (17689,false) (17684,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17981,.and [(17689,false),(17684,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17981,.and [(17689,false),(17684,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17982,.eq (17692,false) (17687,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17982,.eq (17692,false) (17687,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17983,.eq (17982,false) (17981,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17983,.eq (17982,false) (17981,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17984,.majority (17692,false) (17687,false) (17981,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17984,.majority (17692,false) (17687,false) (17981,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17985,.eq (17693,false) (17688,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17985,.eq (17693,false) (17688,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17986,.eq (17985,false) (17984,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17986,.eq (17985,false) (17984,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17987,.majority (17688,true) (17693,true) (17984,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17987,.majority (17688,true) (17693,true) (17984,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17988,.eq (17699,false) (17694,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17988,.eq (17699,false) (17694,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17989,.and [(17699,false),(17694,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17989,.and [(17699,false),(17694,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17990,.eq (17702,false) (17697,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17990,.eq (17702,false) (17697,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17991,.eq (17990,false) (17989,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17991,.eq (17990,false) (17989,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17992,.majority (17702,false) (17697,false) (17989,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17992,.majority (17702,false) (17697,false) (17989,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17993,.eq (17703,false) (17698,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17993,.eq (17703,false) (17698,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17994,.eq (17993,false) (17992,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17994,.eq (17993,false) (17992,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17995,.majority (17698,true) (17703,true) (17992,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17995,.majority (17698,true) (17703,true) (17992,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17996,.eq (17709,false) (17704,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17996,.eq (17709,false) (17704,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17997,.and [(17709,false),(17704,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17997,.and [(17709,false),(17704,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17998,.eq (17712,false) (17707,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17998,.eq (17712,false) (17707,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨17999,.eq (17998,false) (17997,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨17999,.eq (17998,false) (17997,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18000,.majority (17712,false) (17707,false) (17997,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18000,.majority (17712,false) (17707,false) (17997,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18001,.eq (17713,false) (17708,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18001,.eq (17713,false) (17708,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18002,.eq (18001,false) (18000,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18002,.eq (18001,false) (18000,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18003,.majority (17708,true) (17713,true) (18000,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18003,.majority (17708,true) (17713,true) (18000,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18004,.eq (17719,false) (17714,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18004,.eq (17719,false) (17714,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18005,.and [(17719,false),(17714,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18005,.and [(17719,false),(17714,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18006,.eq (17722,false) (17717,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18006,.eq (17722,false) (17717,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18007,.eq (18006,false) (18005,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18007,.eq (18006,false) (18005,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18008,.majority (17722,false) (17717,false) (18005,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18008,.majority (17722,false) (17717,false) (18005,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18009,.eq (17723,false) (17718,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18009,.eq (17723,false) (17718,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18010,.eq (18009,false) (18008,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18010,.eq (18009,false) (18008,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18011,.majority (17718,true) (17723,true) (18008,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18011,.majority (17718,true) (17723,true) (18008,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18012,.eq (17729,false) (17724,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18012,.eq (17729,false) (17724,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18013,.and [(17729,false),(17724,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18013,.and [(17729,false),(17724,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18014,.eq (17732,false) (17727,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18014,.eq (17732,false) (17727,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18015,.eq (18014,false) (18013,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18015,.eq (18014,false) (18013,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18016,.majority (17732,false) (17727,false) (18013,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18016,.majority (17732,false) (17727,false) (18013,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18017,.eq (17733,false) (17728,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18017,.eq (17733,false) (17728,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18018,.eq (18017,false) (18016,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18018,.eq (18017,false) (18016,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18019,.majority (17728,true) (17733,true) (18016,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18019,.majority (17728,true) (17733,true) (18016,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18020,.eq (17739,false) (17734,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18020,.eq (17739,false) (17734,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18021,.and [(17739,false),(17734,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18021,.and [(17739,false),(17734,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18022,.eq (17742,false) (17737,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18022,.eq (17742,false) (17737,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18023,.eq (18022,false) (18021,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18023,.eq (18022,false) (18021,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18024,.majority (17742,false) (17737,false) (18021,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18024,.majority (17742,false) (17737,false) (18021,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18025,.eq (17743,false) (17738,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18025,.eq (17743,false) (17738,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18026,.eq (18025,false) (18024,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18026,.eq (18025,false) (18024,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18027,.majority (17738,true) (17743,true) (18024,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18027,.majority (17738,true) (17743,true) (18024,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18028,.eq (17749,false) (17744,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18028,.eq (17749,false) (17744,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18029,.and [(17749,false),(17744,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18029,.and [(17749,false),(17744,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18030,.eq (17752,false) (17747,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18030,.eq (17752,false) (17747,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18031,.eq (18030,false) (18029,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18031,.eq (18030,false) (18029,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18032,.majority (17752,false) (17747,false) (18029,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18032,.majority (17752,false) (17747,false) (18029,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18033,.eq (17753,false) (17748,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18033,.eq (17753,false) (17748,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18034,.eq (18033,false) (18032,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18034,.eq (18033,false) (18032,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18035,.majority (17748,true) (17753,true) (18032,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18035,.majority (17748,true) (17753,true) (18032,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18036,.eq (17759,false) (17754,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18036,.eq (17759,false) (17754,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18037,.and [(17759,false),(17754,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18037,.and [(17759,false),(17754,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18038,.eq (17762,false) (17757,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18038,.eq (17762,false) (17757,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18039,.eq (18038,false) (18037,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18039,.eq (18038,false) (18037,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18040,.majority (17762,false) (17757,false) (18037,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18040,.majority (17762,false) (17757,false) (18037,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18041,.eq (17763,false) (17758,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18041,.eq (17763,false) (17758,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18042,.eq (18041,false) (18040,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18042,.eq (18041,false) (18040,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18043,.majority (17758,true) (17763,true) (18040,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18043,.majority (17758,true) (17763,true) (18040,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18044,.eq (17772,false) (17764,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18044,.eq (17772,false) (17764,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18045,.and [(17772,false),(17764,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18045,.and [(17772,false),(17764,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18046,.eq (17775,false) (17767,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18046,.eq (17775,false) (17767,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18047,.eq (18046,false) (18045,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18047,.eq (18046,false) (18045,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18048,.majority (17775,false) (17767,false) (18045,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18048,.majority (17775,false) (17767,false) (18045,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18049,.eq (17778,false) (17770,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18049,.eq (17778,false) (17770,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18050,.eq (18049,false) (18048,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18050,.eq (18049,false) (18048,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18051,.majority (17778,false) (17770,false) (18048,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18051,.majority (17778,false) (17770,false) (18048,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18052,.eq (17779,false) (17771,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18052,.eq (17779,false) (17771,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18053,.eq (18052,false) (18051,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18053,.eq (18052,false) (18051,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18054,.majority (17771,true) (17779,true) (18051,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18054,.majority (17771,true) (17779,true) (18051,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18055,.eq (17788,false) (17780,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18055,.eq (17788,false) (17780,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18056,.and [(17788,false),(17780,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18056,.and [(17788,false),(17780,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18057,.eq (17791,false) (17783,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18057,.eq (17791,false) (17783,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18058,.eq (18057,false) (18056,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18058,.eq (18057,false) (18056,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18059,.majority (17791,false) (17783,false) (18056,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18059,.majority (17791,false) (17783,false) (18056,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18060,.eq (17794,false) (17786,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18060,.eq (17794,false) (17786,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18061,.eq (18060,false) (18059,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18061,.eq (18060,false) (18059,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18062,.majority (17794,false) (17786,false) (18059,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18062,.majority (17794,false) (17786,false) (18059,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18063,.eq (17795,false) (17787,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18063,.eq (17795,false) (17787,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18064,.eq (18063,false) (18062,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18064,.eq (18063,false) (18062,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18065,.majority (17787,true) (17795,true) (18062,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18065,.majority (17787,true) (17795,true) (18062,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18066,.eq (17804,false) (17796,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18066,.eq (17804,false) (17796,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18067,.and [(17804,false),(17796,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18067,.and [(17804,false),(17796,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18068,.eq (17807,false) (17799,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18068,.eq (17807,false) (17799,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18069,.eq (18068,false) (18067,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18069,.eq (18068,false) (18067,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18070,.majority (17807,false) (17799,false) (18067,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18070,.majority (17807,false) (17799,false) (18067,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18071,.eq (17810,false) (17802,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18071,.eq (17810,false) (17802,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18072,.eq (18071,false) (18070,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18072,.eq (18071,false) (18070,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18073,.majority (17810,false) (17802,false) (18070,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18073,.majority (17810,false) (17802,false) (18070,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18074,.eq (17811,false) (17803,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18074,.eq (17811,false) (17803,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18075,.eq (18074,false) (18073,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18075,.eq (18074,false) (18073,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18076,.majority (17803,true) (17811,true) (18073,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18076,.majority (17803,true) (17811,true) (18073,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18077,.eq (17820,false) (17812,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18077,.eq (17820,false) (17812,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18078,.and [(17820,false),(17812,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18078,.and [(17820,false),(17812,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18079,.eq (17823,false) (17815,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18079,.eq (17823,false) (17815,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18080,.eq (18079,false) (18078,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18080,.eq (18079,false) (18078,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18081,.majority (17823,false) (17815,false) (18078,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18081,.majority (17823,false) (17815,false) (18078,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18082,.eq (17826,false) (17818,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18082,.eq (17826,false) (17818,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18083,.eq (18082,false) (18081,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18083,.eq (18082,false) (18081,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18084,.majority (17826,false) (17818,false) (18081,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18084,.majority (17826,false) (17818,false) (18081,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18085,.eq (17827,false) (17819,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18085,.eq (17827,false) (17819,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18086,.eq (18085,false) (18084,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18086,.eq (18085,false) (18084,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18087,.majority (17819,true) (17827,true) (18084,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18087,.majority (17819,true) (17827,true) (18084,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18088,.eq (17836,false) (17828,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18088,.eq (17836,false) (17828,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18089,.and [(17836,false),(17828,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18089,.and [(17836,false),(17828,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18090,.eq (17839,false) (17831,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18090,.eq (17839,false) (17831,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18091,.eq (18090,false) (18089,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18091,.eq (18090,false) (18089,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18092,.majority (17839,false) (17831,false) (18089,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18092,.majority (17839,false) (17831,false) (18089,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18093,.eq (17842,false) (17834,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18093,.eq (17842,false) (17834,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18094,.eq (18093,false) (18092,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18094,.eq (18093,false) (18092,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18095,.majority (17842,false) (17834,false) (18092,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18095,.majority (17842,false) (17834,false) (18092,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18096,.eq (17843,false) (17835,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18096,.eq (17843,false) (17835,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18097,.eq (18096,false) (18095,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18097,.eq (18096,false) (18095,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18098,.majority (17835,true) (17843,true) (18095,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18098,.majority (17835,true) (17843,true) (18095,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18099,.eq (17852,false) (17844,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18099,.eq (17852,false) (17844,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18100,.and [(17852,false),(17844,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18100,.and [(17852,false),(17844,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18101,.eq (17855,false) (17847,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18101,.eq (17855,false) (17847,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18102,.eq (18101,false) (18100,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18102,.eq (18101,false) (18100,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18103,.majority (17855,false) (17847,false) (18100,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18103,.majority (17855,false) (17847,false) (18100,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18104,.eq (17858,false) (17850,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18104,.eq (17858,false) (17850,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18105,.eq (18104,false) (18103,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18105,.eq (18104,false) (18103,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18106,.majority (17858,false) (17850,false) (18103,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18106,.majority (17858,false) (17850,false) (18103,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18107,.eq (17859,false) (17851,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18107,.eq (17859,false) (17851,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18108,.eq (18107,false) (18106,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18108,.eq (18107,false) (18106,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18109,.majority (17851,true) (17859,true) (18106,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18109,.majority (17851,true) (17859,true) (18106,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18110,.eq (17868,false) (17860,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18110,.eq (17868,false) (17860,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18111,.and [(17868,false),(17860,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18111,.and [(17868,false),(17860,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18112,.eq (17871,false) (17863,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18112,.eq (17871,false) (17863,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18113,.eq (18112,false) (18111,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18113,.eq (18112,false) (18111,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18114,.majority (17871,false) (17863,false) (18111,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18114,.majority (17871,false) (17863,false) (18111,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18115,.eq (17874,false) (17866,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18115,.eq (17874,false) (17866,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18116,.eq (18115,false) (18114,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18116,.eq (18115,false) (18114,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18117,.majority (17874,false) (17866,false) (18114,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18117,.majority (17874,false) (17866,false) (18114,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18118,.eq (17875,false) (17867,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18118,.eq (17875,false) (17867,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18119,.eq (18118,false) (18117,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18119,.eq (18118,false) (18117,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18120,.majority (17867,true) (17875,true) (18117,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18120,.majority (17867,true) (17875,true) (18117,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18121,.eq (17884,false) (17876,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18121,.eq (17884,false) (17876,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18122,.and [(17884,false),(17876,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18122,.and [(17884,false),(17876,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18123,.eq (17887,false) (17879,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18123,.eq (17887,false) (17879,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18124,.eq (18123,false) (18122,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18124,.eq (18123,false) (18122,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18125,.majority (17887,false) (17879,false) (18122,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18125,.majority (17887,false) (17879,false) (18122,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18126,.eq (17890,false) (17882,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18126,.eq (17890,false) (17882,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18127,.eq (18126,false) (18125,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18127,.eq (18126,false) (18125,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18128,.majority (17890,false) (17882,false) (18125,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18128,.majority (17890,false) (17882,false) (18125,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18129,.eq (17891,false) (17883,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18129,.eq (17891,false) (17883,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18130,.eq (18129,false) (18128,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18130,.eq (18129,false) (18128,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18131,.majority (17883,true) (17891,true) (18128,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18131,.majority (17883,true) (17891,true) (18128,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18132,.eq (17900,false) (17892,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18132,.eq (17900,false) (17892,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18133,.and [(17900,false),(17892,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18133,.and [(17900,false),(17892,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18134,.eq (17903,false) (17895,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18134,.eq (17903,false) (17895,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18135,.eq (18134,false) (18133,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18135,.eq (18134,false) (18133,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18136,.majority (17903,false) (17895,false) (18133,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18136,.majority (17903,false) (17895,false) (18133,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18137,.eq (17906,false) (17898,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18137,.eq (17906,false) (17898,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18138,.eq (18137,false) (18136,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18138,.eq (18137,false) (18136,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18139,.majority (17906,false) (17898,false) (18136,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18139,.majority (17906,false) (17898,false) (18136,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18140,.eq (17907,false) (17899,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18140,.eq (17907,false) (17899,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18141,.eq (18140,false) (18139,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18141,.eq (18140,false) (18139,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18142,.majority (17899,true) (17907,true) (18139,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18142,.majority (17899,true) (17907,true) (18139,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18143,.eq (17916,false) (17908,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18143,.eq (17916,false) (17908,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18144,.and [(17916,false),(17908,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18144,.and [(17916,false),(17908,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18145,.eq (17919,false) (17911,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18145,.eq (17919,false) (17911,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18146,.eq (18145,false) (18144,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18146,.eq (18145,false) (18144,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18147,.majority (17919,false) (17911,false) (18144,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18147,.majority (17919,false) (17911,false) (18144,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18148,.eq (17922,false) (17914,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18148,.eq (17922,false) (17914,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18149,.eq (18148,false) (18147,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18149,.eq (18148,false) (18147,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18150,.majority (17922,false) (17914,false) (18147,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18150,.majority (17922,false) (17914,false) (18147,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18151,.eq (17923,false) (17915,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18151,.eq (17923,false) (17915,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18152,.eq (18151,false) (18150,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18152,.eq (18151,false) (18150,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18153,.majority (17915,true) (17923,true) (18150,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18153,.majority (17915,true) (17923,true) (18150,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18154,.eq (17932,false) (17924,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18154,.eq (17932,false) (17924,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18155,.and [(17932,false),(17924,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18155,.and [(17932,false),(17924,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18156,.eq (17935,false) (17927,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18156,.eq (17935,false) (17927,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18157,.eq (18156,false) (18155,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18157,.eq (18156,false) (18155,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18158,.majority (17935,false) (17927,false) (18155,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18158,.majority (17935,false) (17927,false) (18155,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18159,.eq (17938,false) (17930,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18159,.eq (17938,false) (17930,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18160,.eq (18159,false) (18158,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18160,.eq (18159,false) (18158,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18161,.majority (17938,false) (17930,false) (18158,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18161,.majority (17938,false) (17930,false) (18158,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18162,.eq (17939,false) (17931,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18162,.eq (17939,false) (17931,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18163,.eq (18162,false) (18161,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18163,.eq (18162,false) (18161,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18164,.majority (17931,true) (17939,true) (18161,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18164,.majority (17931,true) (17939,true) (18161,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18165,.eq (17948,false) (17940,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18165,.eq (17948,false) (17940,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18166,.and [(17948,false),(17940,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18166,.and [(17948,false),(17940,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18167,.eq (17951,false) (17943,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18167,.eq (17951,false) (17943,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18168,.eq (18167,false) (18166,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18168,.eq (18167,false) (18166,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18169,.majority (17951,false) (17943,false) (18166,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18169,.majority (17951,false) (17943,false) (18166,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18170,.eq (17954,false) (17946,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18170,.eq (17954,false) (17946,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18171,.eq (18170,false) (18169,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18171,.eq (18170,false) (18169,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18172,.majority (17954,false) (17946,false) (18169,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18172,.majority (17954,false) (17946,false) (18169,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18173,.eq (17955,false) (17947,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18173,.eq (17955,false) (17947,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18174,.eq (18173,false) (18172,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18174,.eq (18173,false) (18172,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18175,.majority (17947,true) (17955,true) (18172,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18175,.majority (17947,true) (17955,true) (18172,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18176,.eq (17964,false) (17956,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18176,.eq (17964,false) (17956,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18177,.and [(17964,false),(17956,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18177,.and [(17964,false),(17956,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18178,.eq (17967,false) (17959,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18178,.eq (17967,false) (17959,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18179,.eq (18178,false) (18177,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18179,.eq (18178,false) (18177,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18180,.majority (17967,false) (17959,false) (18177,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18180,.majority (17967,false) (17959,false) (18177,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18181,.eq (17970,false) (17962,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18181,.eq (17970,false) (17962,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18182,.eq (18181,false) (18180,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18182,.eq (18181,false) (18180,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18183,.majority (17970,false) (17962,false) (18180,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18183,.majority (17970,false) (17962,false) (18180,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18184,.eq (17971,false) (17963,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18184,.eq (17971,false) (17963,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18185,.eq (18184,false) (18183,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18185,.eq (18184,false) (18183,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18186,.majority (17963,true) (17971,true) (18183,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18186,.majority (17963,true) (17971,true) (18183,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18187,.eq (17980,false) (17972,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18187,.eq (17980,false) (17972,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18188,.and [(17980,false),(17972,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18188,.and [(17980,false),(17972,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18189,.eq (17983,false) (17975,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18189,.eq (17983,false) (17975,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18190,.eq (18189,false) (18188,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18190,.eq (18189,false) (18188,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18191,.majority (17983,false) (17975,false) (18188,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18191,.majority (17983,false) (17975,false) (18188,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18192,.eq (17986,false) (17978,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18192,.eq (17986,false) (17978,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18193,.eq (18192,false) (18191,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18193,.eq (18192,false) (18191,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18194,.majority (17986,false) (17978,false) (18191,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18194,.majority (17986,false) (17978,false) (18191,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18195,.eq (17987,false) (17979,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18195,.eq (17987,false) (17979,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18196,.eq (18195,false) (18194,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18196,.eq (18195,false) (18194,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18197,.majority (17979,true) (17987,true) (18194,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18197,.majority (17979,true) (17987,true) (18194,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18198,.eq (17996,false) (17988,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18198,.eq (17996,false) (17988,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18199,.and [(17996,false),(17988,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18199,.and [(17996,false),(17988,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18200,.eq (17999,false) (17991,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18200,.eq (17999,false) (17991,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18201,.eq (18200,false) (18199,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18201,.eq (18200,false) (18199,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18202,.majority (17999,false) (17991,false) (18199,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18202,.majority (17999,false) (17991,false) (18199,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18203,.eq (18002,false) (17994,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18203,.eq (18002,false) (17994,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18204,.eq (18203,false) (18202,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18204,.eq (18203,false) (18202,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18205,.majority (18002,false) (17994,false) (18202,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18205,.majority (18002,false) (17994,false) (18202,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18206,.eq (18003,false) (17995,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18206,.eq (18003,false) (17995,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18207,.eq (18206,false) (18205,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18207,.eq (18206,false) (18205,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18208,.majority (17995,true) (18003,true) (18205,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18208,.majority (17995,true) (18003,true) (18205,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18209,.eq (18012,false) (18004,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18209,.eq (18012,false) (18004,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18210,.and [(18012,false),(18004,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18210,.and [(18012,false),(18004,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18211,.eq (18015,false) (18007,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18211,.eq (18015,false) (18007,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18212,.eq (18211,false) (18210,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18212,.eq (18211,false) (18210,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18213,.majority (18015,false) (18007,false) (18210,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18213,.majority (18015,false) (18007,false) (18210,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18214,.eq (18018,false) (18010,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18214,.eq (18018,false) (18010,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18215,.eq (18214,false) (18213,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18215,.eq (18214,false) (18213,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18216,.majority (18018,false) (18010,false) (18213,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18216,.majority (18018,false) (18010,false) (18213,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18217,.eq (18019,false) (18011,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18217,.eq (18019,false) (18011,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18218,.eq (18217,false) (18216,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18218,.eq (18217,false) (18216,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18219,.majority (18011,true) (18019,true) (18216,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18219,.majority (18011,true) (18019,true) (18216,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18220,.eq (18028,false) (18020,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18220,.eq (18028,false) (18020,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18221,.and [(18028,false),(18020,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18221,.and [(18028,false),(18020,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18222,.eq (18031,false) (18023,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18222,.eq (18031,false) (18023,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18223,.eq (18222,false) (18221,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18223,.eq (18222,false) (18221,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18224,.majority (18031,false) (18023,false) (18221,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18224,.majority (18031,false) (18023,false) (18221,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18225,.eq (18034,false) (18026,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18225,.eq (18034,false) (18026,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18226,.eq (18225,false) (18224,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18226,.eq (18225,false) (18224,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18227,.majority (18034,false) (18026,false) (18224,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18227,.majority (18034,false) (18026,false) (18224,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18228,.eq (18035,false) (18027,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18228,.eq (18035,false) (18027,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18229,.eq (18228,false) (18227,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18229,.eq (18228,false) (18227,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18230,.majority (18027,true) (18035,true) (18227,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18230,.majority (18027,true) (18035,true) (18227,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18231,.eq (18055,false) (18044,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18231,.eq (18055,false) (18044,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18232,.and [(18055,false),(18044,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18232,.and [(18055,false),(18044,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18233,.eq (18058,false) (18047,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18233,.eq (18058,false) (18047,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18234,.eq (18233,false) (18232,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18234,.eq (18233,false) (18232,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18235,.majority (18058,false) (18047,false) (18232,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18235,.majority (18058,false) (18047,false) (18232,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18236,.eq (18061,false) (18050,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18236,.eq (18061,false) (18050,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18237,.eq (18236,false) (18235,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18237,.eq (18236,false) (18235,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18238,.majority (18061,false) (18050,false) (18235,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18238,.majority (18061,false) (18050,false) (18235,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18239,.eq (18064,false) (18053,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18239,.eq (18064,false) (18053,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18240,.eq (18239,false) (18238,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18240,.eq (18239,false) (18238,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18241,.majority (18064,false) (18053,false) (18238,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18241,.majority (18064,false) (18053,false) (18238,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18242,.eq (18065,false) (18054,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18242,.eq (18065,false) (18054,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18243,.eq (18242,false) (18241,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18243,.eq (18242,false) (18241,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18244,.majority (18054,true) (18065,true) (18241,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18244,.majority (18054,true) (18065,true) (18241,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18245,.eq (18077,false) (18066,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18245,.eq (18077,false) (18066,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18246,.and [(18077,false),(18066,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18246,.and [(18077,false),(18066,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18247,.eq (18080,false) (18069,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18247,.eq (18080,false) (18069,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18248,.eq (18247,false) (18246,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18248,.eq (18247,false) (18246,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18249,.majority (18080,false) (18069,false) (18246,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18249,.majority (18080,false) (18069,false) (18246,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18250,.eq (18083,false) (18072,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18250,.eq (18083,false) (18072,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18251,.eq (18250,false) (18249,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18251,.eq (18250,false) (18249,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18252,.majority (18083,false) (18072,false) (18249,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18252,.majority (18083,false) (18072,false) (18249,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18253,.eq (18086,false) (18075,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18253,.eq (18086,false) (18075,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18254,.eq (18253,false) (18252,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18254,.eq (18253,false) (18252,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18255,.majority (18086,false) (18075,false) (18252,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18255,.majority (18086,false) (18075,false) (18252,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18256,.eq (18087,false) (18076,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18256,.eq (18087,false) (18076,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18257,.eq (18256,false) (18255,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18257,.eq (18256,false) (18255,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18258,.majority (18076,true) (18087,true) (18255,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18258,.majority (18076,true) (18087,true) (18255,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18259,.eq (18099,false) (18088,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18259,.eq (18099,false) (18088,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18260,.and [(18099,false),(18088,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18260,.and [(18099,false),(18088,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18261,.eq (18102,false) (18091,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18261,.eq (18102,false) (18091,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18262,.eq (18261,false) (18260,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18262,.eq (18261,false) (18260,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18263,.majority (18102,false) (18091,false) (18260,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18263,.majority (18102,false) (18091,false) (18260,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18264,.eq (18105,false) (18094,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18264,.eq (18105,false) (18094,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18265,.eq (18264,false) (18263,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18265,.eq (18264,false) (18263,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18266,.majority (18105,false) (18094,false) (18263,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18266,.majority (18105,false) (18094,false) (18263,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18267,.eq (18108,false) (18097,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18267,.eq (18108,false) (18097,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18268,.eq (18267,false) (18266,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18268,.eq (18267,false) (18266,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18269,.majority (18108,false) (18097,false) (18266,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18269,.majority (18108,false) (18097,false) (18266,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18270,.eq (18109,false) (18098,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18270,.eq (18109,false) (18098,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18271,.eq (18270,false) (18269,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18271,.eq (18270,false) (18269,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18272,.majority (18098,true) (18109,true) (18269,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18272,.majority (18098,true) (18109,true) (18269,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18273,.eq (18121,false) (18110,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18273,.eq (18121,false) (18110,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18274,.and [(18121,false),(18110,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18274,.and [(18121,false),(18110,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18275,.eq (18124,false) (18113,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18275,.eq (18124,false) (18113,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18276,.eq (18275,false) (18274,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18276,.eq (18275,false) (18274,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18277,.majority (18124,false) (18113,false) (18274,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18277,.majority (18124,false) (18113,false) (18274,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18278,.eq (18127,false) (18116,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18278,.eq (18127,false) (18116,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18279,.eq (18278,false) (18277,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18279,.eq (18278,false) (18277,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18280,.majority (18127,false) (18116,false) (18277,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18280,.majority (18127,false) (18116,false) (18277,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18281,.eq (18130,false) (18119,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18281,.eq (18130,false) (18119,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18282,.eq (18281,false) (18280,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18282,.eq (18281,false) (18280,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18283,.majority (18130,false) (18119,false) (18280,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18283,.majority (18130,false) (18119,false) (18280,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18284,.eq (18131,false) (18120,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18284,.eq (18131,false) (18120,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18285,.eq (18284,false) (18283,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18285,.eq (18284,false) (18283,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18286,.majority (18120,true) (18131,true) (18283,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18286,.majority (18120,true) (18131,true) (18283,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18287,.eq (18143,false) (18132,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18287,.eq (18143,false) (18132,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18288,.and [(18143,false),(18132,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18288,.and [(18143,false),(18132,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18289,.eq (18146,false) (18135,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18289,.eq (18146,false) (18135,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18290,.eq (18289,false) (18288,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18290,.eq (18289,false) (18288,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18291,.majority (18146,false) (18135,false) (18288,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18291,.majority (18146,false) (18135,false) (18288,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18292,.eq (18149,false) (18138,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18292,.eq (18149,false) (18138,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18293,.eq (18292,false) (18291,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18293,.eq (18292,false) (18291,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18294,.majority (18149,false) (18138,false) (18291,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18294,.majority (18149,false) (18138,false) (18291,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18295,.eq (18152,false) (18141,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18295,.eq (18152,false) (18141,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18296,.eq (18295,false) (18294,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18296,.eq (18295,false) (18294,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18297,.majority (18152,false) (18141,false) (18294,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18297,.majority (18152,false) (18141,false) (18294,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18298,.eq (18153,false) (18142,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18298,.eq (18153,false) (18142,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18299,.eq (18298,false) (18297,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18299,.eq (18298,false) (18297,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18300,.majority (18142,true) (18153,true) (18297,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18300,.majority (18142,true) (18153,true) (18297,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18301,.eq (18165,false) (18154,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18301,.eq (18165,false) (18154,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18302,.and [(18165,false),(18154,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18302,.and [(18165,false),(18154,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18303,.eq (18168,false) (18157,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18303,.eq (18168,false) (18157,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18304,.eq (18303,false) (18302,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18304,.eq (18303,false) (18302,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18305,.majority (18168,false) (18157,false) (18302,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18305,.majority (18168,false) (18157,false) (18302,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18306,.eq (18171,false) (18160,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18306,.eq (18171,false) (18160,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18307,.eq (18306,false) (18305,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18307,.eq (18306,false) (18305,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18308,.majority (18171,false) (18160,false) (18305,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18308,.majority (18171,false) (18160,false) (18305,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18309,.eq (18174,false) (18163,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18309,.eq (18174,false) (18163,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18310,.eq (18309,false) (18308,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18310,.eq (18309,false) (18308,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18311,.majority (18174,false) (18163,false) (18308,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18311,.majority (18174,false) (18163,false) (18308,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18312,.eq (18175,false) (18164,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18312,.eq (18175,false) (18164,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18313,.eq (18312,false) (18311,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18313,.eq (18312,false) (18311,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18314,.majority (18164,true) (18175,true) (18311,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18314,.majority (18164,true) (18175,true) (18311,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18315,.eq (18187,false) (18176,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18315,.eq (18187,false) (18176,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18316,.and [(18187,false),(18176,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18316,.and [(18187,false),(18176,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18317,.eq (18190,false) (18179,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18317,.eq (18190,false) (18179,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18318,.eq (18317,false) (18316,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18318,.eq (18317,false) (18316,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18319,.majority (18190,false) (18179,false) (18316,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18319,.majority (18190,false) (18179,false) (18316,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18320,.eq (18193,false) (18182,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18320,.eq (18193,false) (18182,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18321,.eq (18320,false) (18319,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18321,.eq (18320,false) (18319,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18322,.majority (18193,false) (18182,false) (18319,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18322,.majority (18193,false) (18182,false) (18319,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18323,.eq (18196,false) (18185,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18323,.eq (18196,false) (18185,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18324,.eq (18323,false) (18322,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18324,.eq (18323,false) (18322,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18325,.majority (18196,false) (18185,false) (18322,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18325,.majority (18196,false) (18185,false) (18322,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18326,.eq (18197,false) (18186,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18326,.eq (18197,false) (18186,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18327,.eq (18326,false) (18325,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18327,.eq (18326,false) (18325,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18328,.majority (18186,true) (18197,true) (18325,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18328,.majority (18186,true) (18197,true) (18325,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18329,.eq (18209,false) (18198,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18329,.eq (18209,false) (18198,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18330,.and [(18209,false),(18198,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18330,.and [(18209,false),(18198,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18331,.eq (18212,false) (18201,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18331,.eq (18212,false) (18201,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18332,.eq (18331,false) (18330,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18332,.eq (18331,false) (18330,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18333,.majority (18212,false) (18201,false) (18330,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18333,.majority (18212,false) (18201,false) (18330,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18334,.eq (18215,false) (18204,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18334,.eq (18215,false) (18204,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18335,.eq (18334,false) (18333,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18335,.eq (18334,false) (18333,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18336,.majority (18215,false) (18204,false) (18333,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18336,.majority (18215,false) (18204,false) (18333,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18337,.eq (18218,false) (18207,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18337,.eq (18218,false) (18207,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18338,.eq (18337,false) (18336,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18338,.eq (18337,false) (18336,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18339,.majority (18218,false) (18207,false) (18336,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18339,.majority (18218,false) (18207,false) (18336,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18340,.eq (18219,false) (18208,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18340,.eq (18219,false) (18208,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18341,.eq (18340,false) (18339,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18341,.eq (18340,false) (18339,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18342,.majority (18208,true) (18219,true) (18339,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18342,.majority (18208,true) (18219,true) (18339,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18343,.eq (18220,false) (18036,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18343,.eq (18220,false) (18036,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18344,.and [(18220,false),(18036,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18344,.and [(18220,false),(18036,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18345,.eq (18223,false) (18039,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18345,.eq (18223,false) (18039,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18346,.eq (18345,false) (18344,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18346,.eq (18345,false) (18344,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18347,.majority (18223,false) (18039,false) (18344,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18347,.majority (18223,false) (18039,false) (18344,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18348,.eq (18226,false) (18042,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18348,.eq (18226,false) (18042,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18349,.eq (18348,false) (18347,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18349,.eq (18348,false) (18347,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18350,.majority (18226,false) (18042,false) (18347,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18350,.majority (18226,false) (18042,false) (18347,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18351,.eq (18229,false) (18043,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18351,.eq (18229,false) (18043,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18352,.eq (18351,false) (18350,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18352,.eq (18351,false) (18350,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18353,.majority (18229,false) (18043,true) (18350,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18353,.majority (18229,false) (18043,true) (18350,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18354,.eq (18353,false) (18230,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18354,.eq (18353,false) (18230,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18355,.and [(18230,true),(18353,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18355,.and [(18230,true),(18353,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18356,.eq (18245,false) (18231,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18356,.eq (18245,false) (18231,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18357,.and [(18245,false),(18231,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18357,.and [(18245,false),(18231,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18358,.eq (18248,false) (18234,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18358,.eq (18248,false) (18234,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18359,.eq (18358,false) (18357,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18359,.eq (18358,false) (18357,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18360,.majority (18248,false) (18234,false) (18357,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18360,.majority (18248,false) (18234,false) (18357,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18361,.eq (18251,false) (18237,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18361,.eq (18251,false) (18237,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18362,.eq (18361,false) (18360,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18362,.eq (18361,false) (18360,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18363,.majority (18251,false) (18237,false) (18360,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18363,.majority (18251,false) (18237,false) (18360,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18364,.eq (18254,false) (18240,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18364,.eq (18254,false) (18240,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18365,.eq (18364,false) (18363,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18365,.eq (18364,false) (18363,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18366,.majority (18254,false) (18240,false) (18363,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18366,.majority (18254,false) (18240,false) (18363,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18367,.eq (18257,false) (18243,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18367,.eq (18257,false) (18243,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18368,.eq (18367,false) (18366,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18368,.eq (18367,false) (18366,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18369,.majority (18257,false) (18243,false) (18366,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18369,.majority (18257,false) (18243,false) (18366,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18370,.eq (18258,false) (18244,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18370,.eq (18258,false) (18244,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18371,.eq (18370,false) (18369,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18371,.eq (18370,false) (18369,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18372,.majority (18244,true) (18258,true) (18369,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18372,.majority (18244,true) (18258,true) (18369,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18373,.eq (18273,false) (18259,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18373,.eq (18273,false) (18259,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18374,.and [(18273,false),(18259,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18374,.and [(18273,false),(18259,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18375,.eq (18276,false) (18262,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18375,.eq (18276,false) (18262,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18376,.eq (18375,false) (18374,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18376,.eq (18375,false) (18374,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18377,.majority (18276,false) (18262,false) (18374,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18377,.majority (18276,false) (18262,false) (18374,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18378,.eq (18279,false) (18265,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18378,.eq (18279,false) (18265,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18379,.eq (18378,false) (18377,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18379,.eq (18378,false) (18377,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18380,.majority (18279,false) (18265,false) (18377,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18380,.majority (18279,false) (18265,false) (18377,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18381,.eq (18282,false) (18268,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18381,.eq (18282,false) (18268,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18382,.eq (18381,false) (18380,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18382,.eq (18381,false) (18380,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18383,.majority (18282,false) (18268,false) (18380,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18383,.majority (18282,false) (18268,false) (18380,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18384,.eq (18285,false) (18271,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18384,.eq (18285,false) (18271,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18385,.eq (18384,false) (18383,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18385,.eq (18384,false) (18383,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18386,.majority (18285,false) (18271,false) (18383,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18386,.majority (18285,false) (18271,false) (18383,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18387,.eq (18286,false) (18272,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18387,.eq (18286,false) (18272,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18388,.eq (18387,false) (18386,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18388,.eq (18387,false) (18386,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18389,.majority (18272,true) (18286,true) (18386,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18389,.majority (18272,true) (18286,true) (18386,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18390,.eq (18301,false) (18287,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18390,.eq (18301,false) (18287,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18391,.and [(18301,false),(18287,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18391,.and [(18301,false),(18287,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18392,.eq (18304,false) (18290,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18392,.eq (18304,false) (18290,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18393,.eq (18392,false) (18391,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18393,.eq (18392,false) (18391,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18394,.majority (18304,false) (18290,false) (18391,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18394,.majority (18304,false) (18290,false) (18391,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18395,.eq (18307,false) (18293,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18395,.eq (18307,false) (18293,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18396,.eq (18395,false) (18394,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18396,.eq (18395,false) (18394,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18397,.majority (18307,false) (18293,false) (18394,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18397,.majority (18307,false) (18293,false) (18394,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18398,.eq (18310,false) (18296,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18398,.eq (18310,false) (18296,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18399,.eq (18398,false) (18397,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18399,.eq (18398,false) (18397,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18400,.majority (18310,false) (18296,false) (18397,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18400,.majority (18310,false) (18296,false) (18397,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18401,.eq (18313,false) (18299,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18401,.eq (18313,false) (18299,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18402,.eq (18401,false) (18400,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18402,.eq (18401,false) (18400,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18403,.majority (18313,false) (18299,false) (18400,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18403,.majority (18313,false) (18299,false) (18400,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18404,.eq (18314,false) (18300,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18404,.eq (18314,false) (18300,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18405,.eq (18404,false) (18403,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18405,.eq (18404,false) (18403,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18406,.majority (18300,true) (18314,true) (18403,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18406,.majority (18300,true) (18314,true) (18403,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18407,.eq (18329,false) (18315,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18407,.eq (18329,false) (18315,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18408,.and [(18329,false),(18315,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18408,.and [(18329,false),(18315,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18409,.eq (18332,false) (18318,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18409,.eq (18332,false) (18318,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18410,.eq (18409,false) (18408,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18410,.eq (18409,false) (18408,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18411,.majority (18332,false) (18318,false) (18408,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18411,.majority (18332,false) (18318,false) (18408,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18412,.eq (18335,false) (18321,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18412,.eq (18335,false) (18321,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18413,.eq (18412,false) (18411,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18413,.eq (18412,false) (18411,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18414,.majority (18335,false) (18321,false) (18411,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18414,.majority (18335,false) (18321,false) (18411,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18415,.eq (18338,false) (18324,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18415,.eq (18338,false) (18324,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18416,.eq (18415,false) (18414,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18416,.eq (18415,false) (18414,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18417,.majority (18338,false) (18324,false) (18414,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18417,.majority (18338,false) (18324,false) (18414,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18418,.eq (18341,false) (18327,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18418,.eq (18341,false) (18327,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18419,.eq (18418,false) (18417,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18419,.eq (18418,false) (18417,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18420,.majority (18341,false) (18327,false) (18417,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18420,.majority (18341,false) (18327,false) (18417,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18421,.eq (18342,false) (18328,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18421,.eq (18342,false) (18328,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18422,.eq (18421,false) (18420,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18422,.eq (18421,false) (18420,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18423,.majority (18328,true) (18342,true) (18420,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18423,.majority (18328,true) (18342,true) (18420,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18424,.eq (18373,false) (18356,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18424,.eq (18373,false) (18356,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18425,.and [(18373,false),(18356,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18425,.and [(18373,false),(18356,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18426,.eq (18376,false) (18359,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18426,.eq (18376,false) (18359,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18427,.eq (18426,false) (18425,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18427,.eq (18426,false) (18425,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18428,.majority (18376,false) (18359,false) (18425,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18428,.majority (18376,false) (18359,false) (18425,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18429,.eq (18379,false) (18362,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18429,.eq (18379,false) (18362,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18430,.eq (18429,false) (18428,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18430,.eq (18429,false) (18428,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18431,.majority (18379,false) (18362,false) (18428,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18431,.majority (18379,false) (18362,false) (18428,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18432,.eq (18382,false) (18365,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18432,.eq (18382,false) (18365,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18433,.eq (18432,false) (18431,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18433,.eq (18432,false) (18431,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18434,.majority (18382,false) (18365,false) (18431,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18434,.majority (18382,false) (18365,false) (18431,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18435,.eq (18385,false) (18368,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18435,.eq (18385,false) (18368,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18436,.eq (18435,false) (18434,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18436,.eq (18435,false) (18434,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18437,.majority (18385,false) (18368,false) (18434,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18437,.majority (18385,false) (18368,false) (18434,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18438,.eq (18388,false) (18371,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18438,.eq (18388,false) (18371,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18439,.eq (18438,false) (18437,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18439,.eq (18438,false) (18437,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18440,.majority (18388,false) (18371,false) (18437,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18440,.majority (18388,false) (18371,false) (18437,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18441,.eq (18389,false) (18372,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18441,.eq (18389,false) (18372,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18442,.eq (18441,false) (18440,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18442,.eq (18441,false) (18440,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18443,.majority (18372,true) (18389,true) (18440,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18443,.majority (18372,true) (18389,true) (18440,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18444,.eq (18407,false) (18390,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18444,.eq (18407,false) (18390,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18445,.and [(18407,false),(18390,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18445,.and [(18407,false),(18390,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18446,.eq (18410,false) (18393,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18446,.eq (18410,false) (18393,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18447,.eq (18446,false) (18445,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18447,.eq (18446,false) (18445,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18448,.majority (18410,false) (18393,false) (18445,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18448,.majority (18410,false) (18393,false) (18445,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18449,.eq (18413,false) (18396,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18449,.eq (18413,false) (18396,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18450,.eq (18449,false) (18448,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18450,.eq (18449,false) (18448,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18451,.majority (18413,false) (18396,false) (18448,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18451,.majority (18413,false) (18396,false) (18448,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18452,.eq (18416,false) (18399,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18452,.eq (18416,false) (18399,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18453,.eq (18452,false) (18451,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18453,.eq (18452,false) (18451,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18454,.majority (18416,false) (18399,false) (18451,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18454,.majority (18416,false) (18399,false) (18451,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18455,.eq (18419,false) (18402,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18455,.eq (18419,false) (18402,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18456,.eq (18455,false) (18454,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18456,.eq (18455,false) (18454,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18457,.majority (18419,false) (18402,false) (18454,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18457,.majority (18419,false) (18402,false) (18454,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18458,.eq (18422,false) (18405,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18458,.eq (18422,false) (18405,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18459,.eq (18458,false) (18457,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18459,.eq (18458,false) (18457,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18460,.majority (18422,false) (18405,false) (18457,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18460,.majority (18422,false) (18405,false) (18457,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18461,.eq (18423,false) (18406,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18461,.eq (18423,false) (18406,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18462,.eq (18461,false) (18460,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18462,.eq (18461,false) (18460,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18463,.majority (18406,true) (18423,true) (18460,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18463,.majority (18406,true) (18423,true) (18460,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18464,.eq (18444,false) (18424,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18464,.eq (18444,false) (18424,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18465,.and [(18444,false),(18424,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18465,.and [(18444,false),(18424,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18466,.eq (18447,false) (18427,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18466,.eq (18447,false) (18427,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18467,.eq (18466,false) (18465,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18467,.eq (18466,false) (18465,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18468,.majority (18447,false) (18427,false) (18465,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18468,.majority (18447,false) (18427,false) (18465,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18469,.eq (18450,false) (18430,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18469,.eq (18450,false) (18430,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18470,.eq (18469,false) (18468,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18470,.eq (18469,false) (18468,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18471,.majority (18450,false) (18430,false) (18468,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18471,.majority (18450,false) (18430,false) (18468,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18472,.eq (18453,false) (18433,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18472,.eq (18453,false) (18433,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18473,.eq (18472,false) (18471,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18473,.eq (18472,false) (18471,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18474,.majority (18453,false) (18433,false) (18471,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18474,.majority (18453,false) (18433,false) (18471,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18475,.eq (18456,false) (18436,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18475,.eq (18456,false) (18436,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18476,.eq (18475,false) (18474,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18476,.eq (18475,false) (18474,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18477,.majority (18456,false) (18436,false) (18474,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18477,.majority (18456,false) (18436,false) (18474,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18478,.eq (18459,false) (18439,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18478,.eq (18459,false) (18439,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18479,.eq (18478,false) (18477,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18479,.eq (18478,false) (18477,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18480,.majority (18459,false) (18439,false) (18477,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18480,.majority (18459,false) (18439,false) (18477,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18481,.eq (18462,false) (18442,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18481,.eq (18462,false) (18442,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18482,.eq (18481,false) (18480,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18482,.eq (18481,false) (18480,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18483,.majority (18462,false) (18442,false) (18480,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18483,.majority (18462,false) (18442,false) (18480,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18484,.eq (18463,false) (18443,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18484,.eq (18463,false) (18443,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18485,.eq (18484,false) (18483,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18485,.eq (18484,false) (18483,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18486,.majority (18443,true) (18463,true) (18483,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18486,.majority (18443,true) (18463,true) (18483,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18487,.eq (18464,false) (18343,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18487,.eq (18464,false) (18343,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18488,.and [(18464,false),(18343,false)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18488,.and [(18464,false),(18343,false)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18489,.eq (18467,false) (18346,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18489,.eq (18467,false) (18346,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18490,.eq (18489,false) (18488,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18490,.eq (18489,false) (18488,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18491,.majority (18467,false) (18346,false) (18488,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18491,.majority (18467,false) (18346,false) (18488,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18492,.eq (18470,false) (18349,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18492,.eq (18470,false) (18349,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18493,.eq (18492,false) (18491,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18493,.eq (18492,false) (18491,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18494,.majority (18470,false) (18349,false) (18491,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18494,.majority (18470,false) (18349,false) (18491,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18495,.eq (18473,false) (18352,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18495,.eq (18473,false) (18352,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18496,.eq (18495,false) (18494,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18496,.eq (18495,false) (18494,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18497,.majority (18473,false) (18352,false) (18494,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18497,.majority (18473,false) (18352,false) (18494,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18498,.eq (18476,false) (18354,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18498,.eq (18476,false) (18354,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18499,.eq (18498,false) (18497,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18499,.eq (18498,false) (18497,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18500,.majority (18476,false) (18354,false) (18497,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18500,.majority (18476,false) (18354,false) (18497,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18501,.eq (18479,false) (18355,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18501,.eq (18479,false) (18355,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18502,.eq (18501,false) (18500,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18502,.eq (18501,false) (18500,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18503,.majority (18479,false) (18355,true) (18500,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18503,.majority (18479,false) (18355,true) (18500,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18504,.eq (18503,false) (18482,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18504,.eq (18503,false) (18482,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18505,.and [(18482,false),(18503,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18505,.and [(18482,false),(18503,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18506,.eq (18505,false) (18485,true)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18506,.eq (18505,false) (18485,true)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18507,.and [(18485,false),(18505,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18507,.and [(18485,false),(18505,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18508,.eq (18507,false) (18486,false)⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18508,.eq (18507,false) (18486,false)⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18509,.and [(18486,true),(18507,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18509,.and [(18486,true),(18507,true)]⟩ (gates_sublist.subset hg))
    (by have hg : (⟨18510,.and [(18509,false),(18506,false),(18493,false),(18490,false),(18487,true),(18496,true),(18499,true),(18502,true),(18504,true),(18508,true)]⟩ : Gate) ∈ localGates := by native_decide
        simpa [Op.eval,val,hzero,Bool.and_assoc] using models ⟨18510,.and [(18509,false),(18506,false),(18493,false),(18490,false),(18487,true),(18496,true),(18499,true),(18502,true),(18504,true),(18508,true)]⟩ (gates_sublist.subset hg))
  simpa [sumTree,SumTree.evalBV,val,hzero] using hp

theorem source_equivalence (σ : Nat → Bool) (hzero : σ 0=true)
    (models : ∀ g ∈ roofGates, σ g.out=g.op.eval σ) :
    val σ (18510,true)=true ↔ literalWeightedValue σ terms = (-6 : Int) := by
  rw [global_equivalence σ hzero models]
  refine (sumTree_eq_correct sumTree 9 (val σ) 134 (by decide) (by decide)).trans ?_
  have hn := literal_normalization σ hzero terms
  rw [← leaves_normalized,negative_offset,true_constants] at hn
  omega

#print axioms source_equivalence
end Stick81.PBGlobalA2Fast
