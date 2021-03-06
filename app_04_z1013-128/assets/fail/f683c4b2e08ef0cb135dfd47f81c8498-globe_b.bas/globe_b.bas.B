Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

 1000 A=500:GOTO 20:REM  GLOBE
 1010 P1=3.141592653589:REM  PI
 1020 S1=5:REM  STAP IN GRADEN
 1030 DIM SN(360/S1):REM  SIN-WAARDEN
 1040 DIM CS(360/S1):REM  COS-WAARDEN
 1050 PS=.75:REM  NAMAAKPIXELS BASICODE
 1060 AM=2.1:REM  ASMAAT
 1070 R=PS/AM:REM  PROJECTIEGETAL
 1080 DIM BR(162):REM HOEKEN BREEDTES
 1090 GOSUB 100:REM  SCHERM SCHOON
 1100 PRINT "Dieses Programm zeichnet einen Globus."
 1110 PRINT
 1120 PRINT "Die Draufsicht kann frei gewaehlt werden."
 1130 PRINT "Linien am Aussenrand werden"
 1140 PRINT "weggelassen."
 1150 PRINT
 1160 PRINT
 1170 PRINT "Bitte etwas Geduld...";
 1180 FOR HK=0 TO 360 STEP S1:REM  TABEL
 1190 SN(HK/S1)=SIN(HK*P1/180):REM  SINUS
 1200 CS(HK/S1)=COS(HK*P1/180):REM  COSINUS
 1210 NEXT HK
 1220 SD=50:GOSUB 450
 1230 GOSUB 100:REM  SCHERM SCHOON
 1240 PRINT "Geographische Breite des Betrachters?"
 1250 PRINT
 1260 PRINT "+90 = Noordpool"
 1270 PRINT " 52 = Nederland"
 1280 PRINT " 41 = New York"
 1290 PRINT " 19 = Bombay"
 1300 PRINT " -1 = Nairobi"
 1310 PRINT "-14 = Sydney"
 1320 PRINT "-51 = Falkland eilanden"
 1330 PRINT "-90 = Zuidpool"
 1340 PRINT
 1350 INPUT F
 1360 F=90-F:REM HOEK UIT NOORDPOOL
 1370 SF=SIN(F*P1/180):REM  SINUS
 1380 CF=COS(F*P1/180):REM  COSINUS
 1390 PRINT
 1400 PRINT "Geographische Laenge des Betrachters?"
 1410 PRINT
 1420 PRINT "  0 = Greenwuch"
 1430 PRINT "  5 = Nederland"
 1440 PRINT " 37 = Nairobi"
 1450 PRINT " 73 = Bombay"
 1460 PRINT "140 = Tokyo"
 1470 PRINT "151 = Sydney"
 1480 PRINT "238 = San Francisco"
 1490 PRINT "300 = Falkland Eilanden"
 1500 PRINT "343 = Dakar"
 1510 PRINT
 1520 INPUT T
 1530 SU=SIN(T*P1/180):REM  SINUS
 1540 CU=COS(T*P1/180):REM  COSINUS
 1550 XK=SF*CU:REM  X VAN KIJKPLAATS
 1560 YK=SF*SU:REM  Y VAN KIJKPLAATS
 1570 ZK=CF:REM     Z VAN KIJKPLAATS
 1580 CN=0:CC(0)=4:REM  VOORGRONDKLEUR
 1590 GOSUB 600:REM  GRAFISCH SCHERM
 1600 REM
 1610 REM  BREEDTECIRKELS
 1620 REM
 1630 SS=10:REM  HOOGSTE CIRKEL
 1640 SB=20:REM  TUSSENRUIMTE
 1650 SE=171:REM  LAAGSTE CIRKEL
 1660 FOR BR=SS TO SE STEP SB
 1670 B=0:REM  NAAR BEGINPUNT
 1680 SW=SIN(BR*P1/180):REM  SIN BREEDTE
 1690 CW=COS(BR*P1/180):REM  COS BREEDTE
 1700 Z=CW:REM  Z VAN PUNT
 1710 FOR HK=0 TO 360/S1
 1720 X=SW*CS(HK):REM  X VAN PUNT
 1730 Y=SW*SN(HK):REM  Y VAN PUNT
 1740 GOSUB 2080:REM  TEKENBAAR PUNT
 1750 NEXT HK:REM  VERDER MET BREEDTECIRKEL
 1760 NEXT BR:REM  VOLGENDE BREEDTECIRKEL
 1770 REM
 1780 REM  LENGTECIRKELS
 1790 REM
 1800 SS=0:REM  EERSTE HALVE CIRKEL
 1810 SL=20:REM  TUSSENRUIMTE
 1820 SE=350:REM  LAATSTE HALVE CIRKEL
 1830 FOR LT=SS TO SE STEP SL
 1840 B=0:REM  NAAR BEGINPUNT
 1850 SW=SIN(LT*P1/180):REM  SIN LENGTE
 1860 CW=COS(LT*P1/180):REM  COS LENGTE
 1870 FOR HK=0 TO 180/S1
 1880 X=CW*SN(HK):REM  X VAN PUNT
 1890 Y=SW*SN(HK):REM  Y VAN PUNT
 1900 Z=CS(HK):REM  Z VAN PUNT
 1910 GOSUB 2080:REM  TEKENBAAR PUNT
 1920 NEXT HK:REM  VERDER MET LENGTECIRKEL
 1930 NEXT LT:REM  VOLGENDE LENGTECIRKEL
 1940 REM
 1950 REM  OMTREKCIRKEL
 1960 REM
 1970 B=0:REM  NAAR BEGINPUNT
 1980 FOR HK=0 TO 360/S1
 1990 XP=R*CS(HK):REM  XP VAN PUNT
 2000 YP=R*SN(HK):REM  YP VAN PUNT
 2010 GOSUB 2120:REM  TEKENBAAR PUNT
 2020 B=1:REM  OM OP AAN TE SLUITEN
 2030 NEXT HK:REM  VERDER MET OMTREKCIRKEL
 2040 GOTO 2210
 2050 REM
 2060 REM  SUBROUTINE PROJECTIE
 2070 REM
 2080 IP=X*XK+Y*YK+Z*ZK:REM  INPRODUKT
 2090 IF IP<0 THEN B=0:GOTO 2170:REM  ACHTER
 2100 XP=(-X*SU+Y*CU)*R
 2110 YP=(-X*CU*CF-Y*SU*CF+Z*SF)*R
 2120 HO=.5+XP
 2130 VE=.5-YP*4/3
 2140 IF B=0 THEN GOSUB 620:REM  PUNT
 2150 IF B=1 THEN GOSUB 630:REM  LIJNTJE
 2160 B=1:REM  OM OP AAN TE SLUITEN
 2170 RETURN
 2180 REM
 2190 REM VASTLEGGEN BREEDTES
 2200 REM
 2210 FOR I=67 TO 162:REM LAGE BREEDTES: MERCATOR
 2220 BR(I)=-2*ATN(EXP((I-162)/73.5))+P1/2
 2230 NEXT I:REM VOLGENDE BREEDTE
 2240 BR(4)=82*P1/180
 2250 FOR I=4 TO 67:REM HOGE BREEDTES: LINEAIR
 2260 BR(I)=BR(4)+(BR(67)-BR(4))*(I-4)/63
 2270 NEXT I:REM VOLGENDE BREEDTE
 2280 REM
 2290 REM TEKENEN WERELDDELEN
 2300 REM
 2310 B=0:REM LAAT GAT
 2320 READ LT,BT:REM EERSTE LENGTE-, BREEDTECODE
 2330 IF LT=999 THEN 2550:REM AFSLUITING
 2340 GOSUB 2630:REM TEKEN VANAF CODE
 2350 READ TX$:REM TEKSTCODERING
 2360 FOR I=1 TO LEN(TX$):REM LOOP TEKST DOOR
 2370 T$=MID$(TX$,I,1):REM ISOLEER TEKEN
 2380 IF T$=" " THEN 2490:REM NIETS
 2390 IF T$="L" THEN LT=LT-1:GOTO 2480
 2400 IF T$="R" THEN LT=LT+1:GOTO 2480
 2410 IF T$="U" THEN BT=BT-1:GOTO 2480
 2420 IF T$="D" THEN BT=BT+1:GOTO 2480
 2430 IF T$="E" THEN LT=LT+1:BT=BT-1:GOTO 2480
 2440 IF T$="F" THEN LT=LT+1:BT=BT+1:GOTO 2480
 2450 IF T$="G" THEN LT=LT-1:BT=BT+1:GOTO 2480
 2460 IF T$="H" THEN LT=LT-1:BT=BT-1:GOTO 2480
 2470 IF T$="Q" THEN 2490:REM KLAAR
 2480 GOSUB 2630:REM TEKEN VANAF CODE
 2490 NEXT I:REM VOLGENDE TEKEN
 2500 IF T$="Q" THEN 2310:REM GAT NAAR VOLGENDE
 2510 GOTO 2350:REM VOLGENDE TEKST
 2520 REM
 2530 REM KLAAR MET ALLES
 2540 REM
 2550 HO=.8:VE=.95:REM RECHTS ONDER
 2560 SR$="klaar>"
 2570 GOSUB 650:REM PLAATS TEKST
 2580 GOSUB 210:REM WACHT OP TOETS
 2590 GOTO 950:REM STOP
 2600 REM
 2610 REM SUBROUTINE TEKEN PUNT VAN KUSTLIJN
 2620 REM
 2630 HK=((LT/639)*2+1/3)*P1:REM LENGTE RADIALEN
 2640 B9=BT:IF BT>162 THEN B9=324-BT:REM IN ARRAY
 2650 HB=BR(B9)*SGN(162-BT):REM BREEDTE RADIALEN
 2660 Z=SIN(HB):REM Z-WAARDE
 2670 Z1=COS(HB):REM COMPLEMENT
 2680 X=Z1*COS(HK):REM X-WAARDE
 2690 Y=Z1*SIN(HK):REM Y-WAARDE
 2700 GOSUB 2080:REM TEKEN GEPROJECTEERD
 2710 RETURN
25000 REM AZIE TOT ARABIE
25010 DATA 84,26
25020 DATA "RFREFRFREFRFRDGGGLHGLLGDGFRERERRRERRREREE"
25030 DATA "RRRRFFRRERRRERRFRRDFFFRREERFRREERRDDFDFRR"
25040 DATA "FRERFRERRFRRERRFFRFRFERFRFERFRERFREURFRER"
25050 DATA "FRERFREERRDFRFFFFRERFRREREURFRFRERRDFFRFR"
25060 DATA "FDFERERDFFRDFDHLGLHLLGLHHHLLLUHGLGDFFGLGD"
25070 DATA "GLHLLGDGLLGDGLGFDLLLLLGGLGGDGDFDGLHLGDGFF"
25080 DATA "LGGGGGLHHUEHUUEUHEEERERREREEUHUHHLHLGLHGL"
25090 DATA "GFDLLLGGLLLLLLGGLHLLGLHLGLGLGDGGGLGGGGLGD"
25100 DATA "FERFRFREFRDFRGDGGGDGGLGDGLLGLLGLGDGGDFRFD"
25110 DATA "FRGDGLGGLLHUEHLREUHLLHLHHREUHLGLLGLHLGDGL"
25120 DATA "GLHLHGGLGDFFERERFREFRDLGLGGFFFG G GG LGGG"
25130 DATA "GGLLHLGDGLLG LGFFFF FERF   FFFFRFFDG GLLG"
25140 DATA "LLLHHHLGLGDFFFDDGLGDHLUHLHUEUUHHHHGLLHHLL"
25150 DATA "HHHHHLHGGLHHHHLGGLLUUUHLLHGGGGGDGLGDGLLGD"
25160 DATA "GDFGDFGDGFLGLGLLUHLUUHHUHEHHHHHHHHUHHUHHL"
25170 DATA "LHHGLLHHHLGGLHHL"
25180 REM ARABIE, AFRIKA, EUROPA
25190 DATA "LHLHLGLHH"
25200 DATA "LHHLGFFDFFRFERFRFFRRDLGDGGLHLGGLGLGLGGLGD"
25210 DATA "LHLUEHHHHUHLLHHUHLUHHLLUHLUHHLGLLGFDFFFFF"
25220 DATA "DFRDFFRRFRDFFFDFRFDFFFRERFERREERRGDFLGDGG"
25230 DATA "LGDGLLGGGLGDGGLGGGGGGGGLLG  G GF  FFFFFDL"
25240 DATA "GDGLHGDLGDFRDFRDFRGDLLGDGLLGDLGLGLGGGDLLG"
25250 DATA "GGGLLGDGLGLLGLHLGLHGGGLHUHLHUHUUREUHLHUUU"
25260 DATA "UHLHHH EHHHHUH  E HEUREUE HUEREUUHUHEUHHH"
25270 DATA "LHUHHUEUHUEUHLHLGLHGLHHGGLLLHGLHLGLHUHHHL"
25280 DATA "UHUHGLHUUHHHHHUREUEHUEUEREUREEUEUREEUHERE"
25290 DATA "EEERERERFERRERRFREFREFRDFREERFRDFRDFFFRRE"
25300 DATA "RFRRERFEUEREURFRFDFRERFFFRFRERFRDFRFRRERE"
25310 DATA "UREUHUEUUEHUHHLGLGLLHLHLLUUHEUHHUHLHLGGDF"
25320 DATA "RDGLHLUEHUHLHHHLLUHLUHLLGLHGGFFRFFFFFFFRD"
25330 DATA "LLHGGGGGGLGUREUREHUHHHHHLGLUHLLUHLLLLLGDL"
25340 DATA "GDGLHHGGLGDLGLGDGGLGGGLGLGLHGLUUUHLGLHUEH"
25350 DATA "UEHUHUERFRERFRFREREUHUHHHLRRFREUHUFRFEERR"
25360 DATA "EUREREURERERFRFRREREUHLUUEEERRFDGFFFFRERF"
25370 DATA "RREERFRFREURERERREUEUEUEREFRERREHUHLGDUHL"
25380 DATA "EUHHUEREHHHHLLGDDGLGLGDGLGDFDDGDDGDLGGGGL"
25390 DATA "LGHLUEHHHLHHUHGLHLUEUEUEREEEUEFRRFEUEUUER"
25400 DATA "EURFEEEUEUREURFFRREURREURE"
25410 DATA "FFFERRRFEERFRFFERRFRFRERFFDGDGLHLGDFRFRER"
25420 DATA "FREREREUEREURRFREERREUFRFDFEERRRRR"
25430 REM NOORDWESTKUST AZIE
25440 DATA " REERERE REERFRRFDLGDF"
25450 DATA "DGLGDGLGFRREEEEE E REEEREERE ERRRFRRREUEE"
25460 DATA "RFRRFRREUERREUEEERRRFFFREEEREERFFRRFRRERR"
25470 DATA "ERREFREEQ"
25480 REM IERLAND
25490 DATA 515,77
25500 DATA "RFRFRDGDDGLGLHEUUHUEUQ"
25510 REM ENGELAND
25520 DATA 522,68
25530 DATA "RRGFFRDDFRFFRFFFFFDGLGLGHLHLLGLGLLEUHUEEH"
25540 DATA "UEHHLLUEHUEREQ"
25550 REM KASPISCHE ZEE
25560 DATA 628,112
25570 DATA "EEHHUEREHHHHUEREHUHLGLLHLGGLLGGFRDDFFRFR"
25580 DATA "DDDGFFRFRRQ"
25590 REM ZWARTE ZEE
25600 DATA 591,101
25610 DATA "RERFFRFERFREFREREUHLLUHLUHLUHLHHLGLHHLGG"
25620 DATA "DGGDLGGFFRFFREQ"
25630 REM NOORD JAPAN
25640 DATA 154,96
25650 DATA "RRFDGLHLUEQ"
25660 REM ZUID JAPAN
25670 DATA 153,101
25680 DATA "FDHGDDGDGGGGLGLLGGGGHHREUREEREUREEEEUERFE"
25690 DATA "UQ"
25700 REM AMERIKA
25710 DATA 315,42
25720 DATA "RRFFRDDFRDFFFREEFEERREUFDFDFRDFEUUERFGDFR"
25730 DATA "EURFEUERFDDFFRREUURRERFRREDFEERRFRRRDFRDF"
25740 DATA "RDFRERFRDFRDFRDDGGGDGGDGLGDDFDFRLGDFGFFRD"
25750 DATA "FRRRRRRDDFFREEEUUEEEEUHUEUEREUUUUUUUUUEER"
25760 DATA "RFRRFFRRFDDDDDFEREFRDFDFRFDFRDFRDGGLLGLLG"
25770 DATA "DDGLHLGLGGLHLGLGLGDLGDFERERDFFRFRGLGLGLGL"
25780 DATA "GDGLLGFFDLGDGGDLGDGDDDFRFFDFFDFLGHLHHUHUH"
25790 DATA "HHLLLUHLLLLLLLGDLLLLLLGLHLLLGGDLGGDGGDFDG"
25800 DATA "DFDDFFRDFFRERRREURREURRERFDGDDDDFFRRRRRDD"
25810 DATA "DDFFREEFRFREHFRERFERREUEUFFEFRERFRDFEREFR"
25820 DATA "FERFRRRRFDFRFRFDFRFRFRERFRFRGFDLGLGFRRRRE"
25830 DATA "URDFDGFREUEEFRFEFRFRERRRFRFRFFFFGDFDGDGGD"
25840 DATA "LGLLGGLGGLGLGGGGGLGDGLGLGDGGGLGDGDGDGGDGL"
25850 DATA "HLHGLLGFRFFDLGGGGGGDLGDGLGGGDDGGGFDDGGLGF"
25860 DATA "RFDGLGDGDFFRFDGFDLUHGLHLHLHHGLHHUHHUHUREU"
25870 DATA "HUEUHUREUHUREUEUEUUUUUUEUEUUUUEUHUEHHUEUE"
25880 DATA "UHUHHUHUUEUUUEEHHHUHLUHHLLHHHHHHUEHUHHUEU"
25890 DATA "HUREEEREUHUEUHLHLGLGLGLHHHLLUHLHLLHLGLHLL"
25900 DATA "GLHLHLLHLLLHLUHHHLUHUHUUHLHUHLHUHHHLLHHHU"
25910 DATA "HLLGDDDFRDDFFDFFDDFFFFFHHLHLHUHHHHHHHHHHU"
25920 DATA "HLUHHHLHLUUHLHUHEUUUHLHUEUEHHHHUEUHRRRRRR"
25930 DATA "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR"
25940 DATA "RRRRRRRRRRRRRRRRRRRFRRLLGGFRERFRFRGDGDFER"
25950 DATA "EUEERFDLGFFREUEEREREUHLGLGUHLHLLHLHGHLLLL"
25960 DATA "HLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL"
25970 DATA "LLLLLLLLLLLLLLLLLLLLLLLLLLUHHUEUHHLHUHGHH"
25980 DATA "LUHGHUHLHLHLHLLGLHHLHLLGLHLHLLLLLLLLLLLLL"
25990 DATA "LLLUHLGDLLGLGDGLGDLLGLGLGLGLLGHLGLLLGLGHL"
26000 DATA "LLERRFEERRERFERERERREUREEEREHLLHLLLHHGLHH"
26010 DATA "UUREUHHLUREREREHLHLHREREERRFRERRRERERERFR"
26020 DATA "ERERFFRRRRRFRFRERFRFRERFRFRERFFRRRRRRREEE"
26030 DATA "URRFRREEURFDFREUEEEQ"
26040 REM GROENLAND
26050 DATA 467,4
26060 DATA "DFFRFREERRFRRRFRFRRRFRRERRFRRDGLLGLGDGGFD"
26070 DATA "GDFFDGLGDLGDLGDGFRDGGFRLGFRRFRFRGLLLGLGLL"
26080 DATA "LGLGGLGFDGDLLGLLGDGLGDGLHGLGDGGLGLGGLGEHL"
26090 DATA "LLHHUHUHLHHHHEREREEEHLHLUHHHUUHLUHUHHLHLL"
26100 DATA "UHHLLHLLLLGLHLLHLLLUEUHHLHHLUERRRRRRRRRRE"
26110 DATA "EHHHLLHEERRREEREFRRFRREUREERRRERRRFFRREEE"
26120 DATA "RRFFRRRRREERRFFRREERREEQ"
26130 REM CUBA
26140 DATA 396,134,"FRRRRFRRRFLLLLHLLLLLHLLERRQ"
26160 REM HAITI
26170 DATA 412,139,"GUURRRLGQ"
26190 REM AUSTRALIE
26200 DATA 100,190
26210 DATA "RERERREREUEREEUERERFDFEREEUERRERFRFRGLGGF"
26220 DATA "RFRFRFRFFREREEUEUUEUERFDFRFDDFRFDFDFRDFRR"
26230 DATA "DFFDFDFDFDFGDDGGDDLGGDDLGGLGGLLHLLHHHHUUE"
26240 DATA "UHLGGDHHUHLLHLLGLGGLGLLLLGLLHLLGLGLGLHLLL"
26250 DATA "GLGLLLHHHUUHUHUUHUUHUHUEUEEEREQ"
26260 REM ZUIDPOOL
26270 DATA 0,278
26280 REM 60-70 OL,
26290 DATA "RRRRFRRRRFRRRRFRR"
26300 REM 70-80 OL,
26310 DATA "RFRFRFRREREREREEER"
26320 REM 80-90 OL,
26330 DATA "RRERERERRRRRRRRRRR"
26340 REM 90-100 OL,
26350 DATA "RRRRRRRRRRRRRRRRRR"
26360 REM 100-110 OL,
26370 DATA "RRRRRRRRRRRRRRRRRR"
26380 REM 110-120 OL,
26390 DATA "REEEEEERRRFFFFFFR"
26400 REM 120-130 OL,
26410 DATA "RREEERRRRRRRRRRRRR"
26420 REM 130-140 OL,
26430 DATA "RRRFRRFRRFRRFRRFRR"
26440 REM 140-150 OL,
26450 DATA "RRRFRRFRRFRRFRRFRR"
26460 REM 150-160 OL,
26470 DATA "RRRFRRFRRFRRFRRFRR"
26480 REM 160-170 OL,
26490 DATA "RRRFRRFRRFRRFRRFRR"
26500 DATA "DGDGDGDGDGDGDGDGDG"
26510 DATA "RRRRRRRRR"
26520 REM 170-180 OL,
26530 DATA "RRRRRRRRRRRRRRRRRR"
26540 REM 180-170 WL,
26550 DATA "RRRRRRRRRRRRRRRRRR"
26560 REM 170-160 WL,
26570 DATA "RRRRRRRRRRRRRRRRRR"
26580 REM 160-150 WL,
26581<<TOKEN:7d>>0 DATA "RRERRERRERRERRERRE"
26600 REM 150-140 WL,
26610 DATA "RRERRERRERRERRERRE"
26620 REM 140-130 WL,
26630 DATA "RRERRERRERRERRERRE"
26640 REM 130-120 WL,
26650 DATA "RRRRRRRRRRRRRRRRRR"
26660 REM 120-110 WL,
26670 DATA "RRRRRRRRRRRRRRRRRR"
26680 REM 110-100 WL,
26690 DATA "RRRRRRRRRRRRRRRHHH"
26700 REM 100-90 WL,
26710 DATA "RRRRRRRRRRRRRRRRR"
26720 REM 90-80 WL,
26730 DATA "RRRRRRRRRRRRRRRRRR"
26740 REM 80-70 WL,
26750 DATA "RRRRRRRRRRRRRRRRRR"
26760 REM 70-60 WL,
26770 DATA "EUUUEUUUEUUUEUUEEREEREERRRERRE"
26780 DATA "RRRRRERRRGGGDGGDGGDDDGDDGDD"
26790 DATA "DDGDDGDDGDDDGDDG"
26800 REM 60-50 WL,
26810 DATA "RRRFRRRFRRRFRRRRFRRRR"
26820 REM 50-40 WL,
26830 DATA "RRFRRRFRRFRRRFRRRR"
26840 REM 40-30 WL,
26850 DATA "RERRERRERRERRERRER"
26860 REM 30-20 WL,
26870 DATA "RRERERERRRERRRERRR"
26880 REM 20-10 WL,
26890 DATA "RRRERRRRRERRRRRERR"
26900 REM 10-0 WL,
26910 DATA "RRERRRRERRRRRERRRR"
26920 REM 0-10 OL,
26930 DATA "ERERRRRRRRRRRRRRRR"
26940 REM 10-20 OL,
26950 DATA "RRRRRRRRRRRRRRRRRR"
26960 REM 20-30 OL,
26970 DATA "RFRFFRREERERRRRRRR"
26980 REM 30-40 OL,
26990 DATA "RRERRERRERRERRERRR"
27000 REM 40-50 OL,
27010 DATA "RRERRERRRERRERRERR"
27020 REM 50-60 OL,
27030 DATA "RRUUEEERRRRFFFDDRRRRRRQ"
27040 REM MADAGASCAR
27050 DATA 620,178
27060 DATA "FFFDGDGDGDGDGDGDGGGG"
27070 DATA "HUHUHUEEHUUUURREEREREUUUQ"
27080 REM EINDE
27090 DATA 999,999
30000 REM
30010 REM  LITERATUUR:
30020 REM
30030 REM  OVER DE TEKENWIJZE:
30040 REM  AARDE EN KOSMOS 7/1985,
30050 REM  BLADZIJDE 494
30060 REM
30070 REM  A&K INFORMATICA, 7/87,
30080 REM  1 OKTOBER - 15 NOVEMBER
30090 REM
32000 REM
32010 REM  BASICODE-3:
32020 REM
32030 REM  PIM VAN TEND
32040 REM  RENKUM / NIEDERLANDE
32050 REM
32060 REM  COPYRIGHT (C) 1987
32070 REM  STICHTING MENS EN
32080 REM  WETENSCHAP
32090 REM  HUIZEN NH
32100 REM
32110 REM TROS-RADIO DD 871118
32120 REM
32130 REM ERSTAUSSTRAHLUNG RADIO DDR
32140 REM 891213
