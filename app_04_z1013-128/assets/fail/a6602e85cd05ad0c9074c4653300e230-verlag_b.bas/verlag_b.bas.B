Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

 1000 A=4000:GOTO 20:REM VERSLAG
 1010 REM ++++ VERSLAG.BC3 ++++
 1020 GOSUB 2010:REM INIT
 1030 REM ++++ HOOFDLOOP ++++
 1040 GOSUB 3010:REM MENU
 1050 ON ME GOSUB 4010,5010,6010,7010,8010,9010,1510
 1060 IF EV=0 THEN 1040
 1070 GOTO 950
 1080 REM  1. VERSLAG NIEUW
 1090 REM  2. VERSLAG DOORGAAN
 1100 REM  3. VERSLAG WEGZETTEN
 1110 REM  4. VERSLAG OPHALEN
 1120 REM  5. VERSLAG PRINTEN
 1130 REM  6. UITLEG
 1140 REM  7. STOPPEN
 1500 REM ++++ STOPPEN ++++
 1510 GOSUB 3310:REM KOP
 1520 JN$="WIL JE "+ME$(ME)
 1530 GOSUB 2810:REM J/N
 1540 IF JN=1 THEN EV=1
 1550 IF IV=0 THEN ME=4
 1560 IF IV=1 THEN ME=2
 1570 RETURN
 2000 REM ++++ INIT ++++
 2010 DIM ME$(7),RE$(7,6)
 2020 DIM DA$(7),MA$(12),MA(12)
 2030 GOSUB 2110:REM INIT VARIABELEN
 2040 GOSUB 2210:REM INIT MENU
 2050 GOSUB 2410:REM INIT DAGEN
 2060 GOSUB 2510:REM INIT MAANDEN
 2070 GOSUB 2720:REM INIT BEGIN
 2080 GOSUB 8510:REM INIT PRINTER
 2090 RETURN
 2100 REM ++++ INIT VARIABELEN ++++
 2110 VM=VE:HM=HO
 2120 EV=0:REM EIND VARIABELE
 2130 IV=0:REM INVOER VERSLAG
 2140 IM=0:REM INVOER MODUS
 2150 JR=1989
 2160 WK=1
 2170 SR=JR:GOSUB 300:JR$=SR$
 2180 SR=WK:GOSUB 300:WK$=SR$
 2190 RETURN
 2200 REM S+++ INIT MENU ++++
 2210 ME=6:MM=7
 2220 ME$(0)="VERLAG          "
 2230 ME$(1)="VERLAG NEU......"
 2240 ME$(2)="VERLAG DOORGAAN."
 2250 ME$(3)="VERLAG SPEICHERN"
 2260 ME$(4)="VERLAG LADEN...."
 2270 ME$(5)="VERLAG DRUCKEN.."
 2280 ME$(6)="UBER VERLAG....."
 2290 ME$(7)="PROGRAMM ENDE..."
 2300 RETURN
 2400 REM ++++ INIT DAGEN ++++
 2410 DA$(1)="    Montag"
 2420 DA$(2)="  Dienstag"
 2430 DA$(3)="   Mitwoch"
 2440 DA$(4)="Donnerstag"
 2450 DA$(5)="   Freitag"
 2460 DA$(6)="   Samstag"
 2470 DA$(7)="    Sontag"
 2480 RETURN
 2500 REM ++++ INIT MAANDEN ++++
 2510 MA(1)=31:MA$(1)="Jan"
 2520 MA(2)=28:MA$(2)="Feb"
 2530 MA(3)=31:MA$(3)="Mae"
 2540 MA(4)=30:MA$(4)="Apr"
 2550 MA(5)=31:MA$(5)="Mai"
 2560 MA(6)=30:MA$(6)="Jun"
 2570 MA(7)=31:MA$(7)="Jul"
 2580 MA(8)=31:MA$(8)="Aug"
 2590 MA(9)=30:MA$(9)="Sep"
 2600 MA(10)=31:MA$(10)="Okt"
 2610 MA(11)=30:MA$(11)="Nov"
 2620 MA(12)=31:MA$(12)="Dez"
 2630 RETURN
 2700 REM ++++ INIT BEGIN ++++
 2710 REM 1 JAN 1601 VIEL OP MAANDAG
 2720 JI=1601:REM JAAR INIT
 2730 DJ=1:REM     DAG INIT
 2740 RETURN
 2800 REM ++++ J/N ++++
 2810 JN=0:PRINT JN$;" ? J/N ";
 2820 GOSUB 210
 2830 IF IN=74 THEN JN=1:REM J
 2840 IF IN=78 THEN JN=2:REM N
 2850 IF JN=0 THEN GOSUB 250:GOTO 2820
 2860 JN$="":GOSUB 120:HO=HO-4:GOSUB 110
 2870 IF JN=1 THEN PRINT "JA "
 2880 IF JN=2 THEN PRINT "NEIN"
 2890 FOR WA=1 TO 100:NEXT WA:RETURN
 2900 REM ++++ INSTRUCTIE ++++
 2910 GOSUB 120:V1=VE:H1=HO
 2920 VE=VM-3:HO=0:GOSUB 110
 2930 PRINT "--------------------"
 2940 PRINT "  AUSWAHL = CURSOR "
 2950 PRINT "   RETURN = NEHMEN "
 2960 PRINT "--------------------";
 2970 VE=V1:HO=H1:GOSUB 110
 2980 RETURN
 3000 REM ++++ MENU ++++
 3010 FF=0
 3020 GOSUB 100
 3030 GOSUB 2910:REM INSTRUCTIE
 3040 PRINT "    HAUPTMENUE...";ME$(0)
 3050 VE=4:HO=0:GOSUB 110
 3060 FOR AA=1 TO MM
 3070 PRINT "    ";
 3080 IF AA=ME THEN SR$=ME$(AA):GOSUB 150:PRINT
 3090 IF AA<>ME THEN PRINT "   ";ME$(AA);"   "
 3100 IF(AA=3)OR(AA=5)THEN PRINT
 3110 NEXT AA
 3120 IF FF=1 THEN 3140
 3130 GOSUB 270:FF=1
 3140 GOSUB 3410:REM TOETS
 3150 ON TP GOTO 3160,3190,3220,3140
 3160 ME=ME+1
 3170 IF ME>MM THEN ME=1
 3180 GOTO 3050
 3190 ME=ME-1
 3200 IF ME<1 THEN ME=MM
 3210 GOTO 3050
 3220 RETURN
 3300 REM ++++ KOP ++++
 3310 GOSUB 100:SR$=ME$(ME):GOSUB 150
 3320 PRINT:PRINT
 3330 RETURN
 3400 REM ++++ TOETS ++++
 3410 TP=0
 3420 GOSUB 200
 3430 IF IN=0 THEN 3420
 3440 IF(IN=29)OR(IN=30)OR(IN=32)THEN TP=1
 3450 IF(IN=28)OR(IN=31)THEN TP=2
 3460 IF IN=13 THEN TP=3
 3470 IF IN=72 THEN TP=4:REM H
 3480 IF TP<>0 THEN 3500
 3490 GOSUB 250:GOTO 3420
 3500 RETURN
 4000 REM ++++ VERSLAG NIEUW ++++
 4010 GOSUB 4110:REM VERSLAG NIEUW INVOER
 4020 IF VN=1 THEN 4060
 4030 IF IV=1 THEN ME=2
 4040 IF IV=0 THEN ME=4
 4050 GOTO 4090
 4060 GOSUB 11010:REM MAAK REGELS
 4070 GOSUB 12010:REM INPUT
 4080 IV=1:ME=3:VN=0
 4090 RETURN
 4100 REM ++++ VERSLAG NIEUW INVOER ++++
 4110 VN=1:REM VERSLAG NIEUW
 4120 JO=JR:REM JAAR OUD
 4130 WO=WK:REM WEEK OUD
 4140 GOSUB 4310:REM VERSLAG NIEUW ?
 4150 IF VN=1 THEN 4190
 4160 JR=JO:SR=JR:GOSUB 300:JR$=SR$
 4170 WK=WO:SR=WK:GOSUB 300:WK$=SR$
 4180 GOTO 4280
 4190 GOSUB 4410:REM INVOER JAAR
 4200 J1=JR
 4210 GOSUB 10130:REM WEEK 1
 4220 GOSUB 4610:REM INVOER WEEK
 4230 GOSUB 10510:REM WEEK WK
 4240 GOSUB 4910:REM INVOER GOED ?
 4250 IF JN=1 THEN 4280
 4260 JR=J1:SR=JR:GOSUB 300:JR$=SR$
 4270 GOTO 4140
 4280 RETURN
 4300 REM ++++ VERSLAG NIEUW ? ++++
 4310 GOSUB 3310:REM KOP
 4320 JN$=ME$(ME)
 4330 GOSUB 2810:REM J/N
 4340 IF JN=2 THEN VN=0
 4350 RETURN
 4400 REM ++++ INVOER JAAR ++++
 4410 PRINT:PRINT
 4420 GOSUB 120
 4430 HO=0:GOSUB 110
 4440 PRINT "JAHR :";JR$;"   (+ - RETURN)";
 4450 HO=11
 4460 GOSUB 110:PRINT "?";:GOSUB 110
 4470 GOSUB 210
 4480 PRINT " ";
 4490 IF IN=13 THEN 4570
 4500 IF IN=43 THEN 4530:REM +
 4510 IF IN=45 THEN 4540:REM -
 4520 GOSUB 250:GOTO 4460
 4530 JR=JR+1:GOTO 4560
 4540 IF JR<=JI THEN GOSUB 250:GOTO#430
 4550 JR=JR-1
 4560 SR=JR:GOSUB 300:JR$=SR$:GOTO 4430
 4570 HO=0:GOSUB 110
 4580 PRINT "JAHR :";JR$;"               "
 4590 RETURN
 4600 REM ++++ INVOER WEEK ++++
 4610 PRINT
 4620 PRINT "WOCHE :";
 4630 GOSUB 4710:REM CIJFER INPUT
 4640 WK=CY
 4650 IF(WK>=1)AND(WK<=MW)THEN 4670
 4660 GOSUB 250:GOTO 4630
 4670 SR=WK:GOSUB 300:WK$=SR$
 4680 RETURN
 4700 REM ++++ CIJFER INPUT ++++
 4710 GOSUB 120
 4720 CY=0:CY$=""
 4730 PRINT "  ";
 4740 GOSUB 110
 4750 GOSUB 210
 4760 IF(IN>=48)AND(IN<=57)THEN 4790
 4770 IF IN=13 THEN 4840
 4780 GOSUB 250:GOTO 4750
 4790 IF(CY$="")AND(IN=48)THEN 4780
 4800 IF LEN(CY$)>=2 THEN 4780
 4810 CY$=CY$+IN$
 4820 GOSUB 110:PRINT CY$;
 4830 GOTO 4750
 4840 IF CY$="" THEN 4780
 4850 GOSUB 110
 4860 CY=VAL(CY$)
 4870 RETURN
 4900 REM ++++ INVOER GOED ? ++++
 4910 PRINT:PRINT:PRINT
 4920 JN$="   Eingabe Ok"
 4930 GOSUB 2810:REM J/N
 4940 RETURN
 5000 REM ++++ VERSLAG DOORGAAN ++++
 5010 IF IV=0 THEN ME=4:GOTO 5050
 5020 GOSUB 12010:REM INPUT
 5030 ME=2
 5040 IF IM=1 THEN ME=3
 5050 RETURN
 6000 REM ++++ VERSLAG WEGZETTEN ++++
 6010 IF IV=0 THEN ME=4:GOTO 6080
 6020 GOSUB 6110:REM WEGZETTEN ?
 6030 IF JN=2 THEN ME=2:GOTO 6080
 6040 GOSUB 6210:REM MAAK NF$
 6050 GOSUB 6310:REM BOODSCHAP WEGZETTEN
 6060 GOSUB 6410:REM SAVE NAAR DISK
 6070 ME=5
 6080 RETURN
 6100 REM ++++ WEGZETTEN ? ++++
 6110 GOSUB 3310:REM KOP
 6130 PRINT "VERLAG ";JR$;" - ";
 6131 IF WK<10 THEN PRINT "0"
 6140 PRINT WK$
 6150 PRINT
 6160 JN$=ME$(ME):GOSUB 2810:REM J/N
 6170 RETURN
 6200 REM ++++ MAAK NF$ ++++
 6210 NF$="V"+JR$
 6230 IF WK<10 THEN NF$=NF$+"0"
 6240 NF$=NF$+WK$
 6250 RETURN
 6300 REM ++++ BOODSCHAP WEGZETTEN ++++
 6310 BO$="GESPEICHERT"
 6320 GOSUB 7310:REM BOODSCHAP
 6330 RETURN
 6400 REM ++++ SAVE NAAR DISK ++++
 6410 NF=5:GGKUB500
 6420 FOR AA=1 TO 7
 6430 FOR BB=1 TO 6
 6440 SR$=RE$(AA,BB):GOSUB 560
 6450 PRINT SR$
 6460 NEXT BB
 6470 NEXT AA
 6480 GOSUB 580
 6490 RETURN
 7000 REM ++++ VERSLAG OPHALEN ++++
 7010 GOSUB 4110:REM VERSLAG NIEUW INVOER
 7020 IF VN=0 THEN 7100
 7030 GOSUB 11010:REM MAAK REGELS
 7040 GOSUB 6210:REM MAAK NF$
 7050 GOSUB 7210:REM BOODSCHAP OPHALEN
 7060 GOSUB 7410:REM LAAD VAN DISK
 7070 GOSUB 12010:REM INPUT
 7080 IV=1:ME=5:VN=0
 7090 IF IM=1 THEN ME=3
 7100 RETURN
 7200 REM ++++ BOODSCHAP OPHALEN ++++
 7210 BO$="GELADEN"
 7220 GOSUB 7310:REM BOODSCHAP
 7230 RETURN
 7300 REM ++++ BOODSCHAP ++++
 7310 PRINT:PRINT
 7320 PRINT "VERLAG  ";NF$;" WORT  ";BO$
 7330 PRINT "--------------------------------"
 7340 PRINT:RETURN
 7400 REM ++++ LAAD VAN DISK ++++
 7410 NF=4:GOSUB 500
 7420 FOR AA=1 TO 7
 7430 FOR BB=1 TO 6
 7440 GOSUB 540
 7450 RE$(AA,BB)=IN$
 7460 PRINT IN$
 7470 NEXT BB
 7480 NEXT AA
 7490 GOSUB 580
 7500 RETURN
 8000 REM ++++ VERSLAG PRINTEN ++++
 8010 IF IV=0 THEN 8320
 8020 GOSUB 3310:REM KOP
 8030 PRINT "VERLAG WOCHE";JR$;" - ";
 8040 IF WK<10 THEN PRINT "0";
 8050 PRINT WK$
 8060 PRINT
 8070 JN$="STAAT DRUCKER Ok"
 8080 GOSUB 2810:REMTJ/N
 8090 IF JN=2 THEN 8320
 8100 SR$=""
 8110 FOR AA=1 TO 4
 8120 GOSUB 350:GOSUB 360
 8130 NEXT AA
 8140 SR$=KL$+"WOCHE "+WK$+" "+JR$
 8150 SR$=SR$+" VERLAG/PLANUNG"
 8160 GOSUB 350:GOSUB 360
 8170 SR$="":GOSUB 350:GOSUB 360
 8180 FOR AA=1 TO 7
 8190 FOR BB=0 TO 6
 8200 SR$=KL$+RE$(AA,BB)
 8210 IF BB<>0 THEN SR$="        "+SR$
 8220 GOSUB 350:GOSUB 360
 8230 NEXT BB
 8240 NEXT AA
 8250 SR$="":GOSUB 350:GOSUB 360
 8260 SR$=PL$:GOSUB 350:GOSUB 360
 8270 SR$="    met groetjes van "
 8280 SR$=SR$+"Frans Verberkt, Nijmegen"
 8290 GOSUB 350:GOSUB 360
 8300 SR$=KL$+KL$+" --------------"
 8310 GOSUB 350:GOSUB 360
 8320 ME=4
 8330 RETURN
 8500 REM ++++ INIT PRINTER ++++
 8510 KL=10:REM KANTLIJN
 8520 KL$=""
 8530 FOR AA=1 TO KL:KL$=KL$+" ":NEXT AA
 8540 PL$=" ":REM PUNT LIJN
 8550 FOR AA=1 TO 78:PL$=PL$+".":NEXT AA
 8560 RETURN
 9000 REM ++++ UITLEG ++++
 9010 GOSUB 9110:REM INTRO
 9020 IF BP=3 THEN ME=4:GOTO 9050
 9030 GOSUB 9410:REM LEES AFDRUK
 9040 ME=1
 9050 IF IV=1 THEN ME=2
 9060 RETURN
 9100 REM ++++ INTRO ++++
 9110 GOSUB 100
 9120 PRINT "UEBER = VERLAG"
 9130 PRINT "=============="
 9140 VE=8:HO=0:GOSUB 110
 9150 PRINT "  B .. Bildschirm"
 9160 PRINT
 9170 PRINT "  P .. Drucker   "
 9180 PRINT:
 9190 PRINT "  H .. Hauptmenue..."
 9200 PRINT:PRINT "  Auswahl Bitte =>":VE=14:HO=18:GOSUB 250
 9210 GOSUB 110
 9220 BP=0:REM BEELD OF PRINTER
 9230 GOSUB 210
 9240 IF IN=66 THEN BP=1:REM B
 9250 IF IN=80 THEN BP=2:REM P
 9260 IF IN=72 THEN BP=3:REM H
 9270 IF BP=0 THEN GOSUB 250:GOTO 9230
 9280 PRINT IN$
 9290 IF BP<>2 THEN 9340
 9300 VE=15:HO=10:GOSUB 110
 9310 JN$="STAAT DRUCKER AN"
 9320 GOSUB 2810:REM J/N
 9330 IF JN=2 THEN 9110
 9340 PRINT
 9350 GOSUB 100
 9360 RETURN
 9400 REM ++++ LEES AFDRUK ++++
 9410 RT=16:REM REGELTELLER HELE BLZ.
 9420 RESTORE
 9430 READ SR$
 9440 IF SR$="Ende" THEN 9470
 9450 GOSUB 9510:REM AFDRUK
 9460 GOTO 9430
 9470 IF BP=2 THEN 9490
 9480 GOSUB 210
 9490 RETURN
 9500 REM ++++ AFDRUK ++++
 9510 ON BP GOSUB 9610,9710
 9520 RETURN
 9600 REM ++++ AFDRUK BEELDSCHERM ++++
 9610 PRINT SR$
 9620 RT=RT-1:REM REGELTELLER - 1
 9630 IF RT>0 THEN 9650
 9640 GOSUB 9810:REM VERVOLG
 9650 RETURN
 9700 REM ++++ AFDRUK PRINTER ++++
 9710 SR$=KL$+SR$:REM VOEG KANTLIJN TOE
 9720 GOSUB 350
 9730 GOSUB 360
 9740 RETURN
 9800 REM ++++ VERVOLG ++++
 9810 RT=8:REM REGELTELLER HALVE BLZ.
 9820 PRINT
 9830 PRINT "             W = Weiter  ";
 9840 GOSUB 210
 9850 IF IN=87 THEN 9870:REM V
 9860 GOSUB 250:GOTO 9840
 9870 GOSUB 120
 9880 HO=0:GOSUB 110
 9890 PRINT "                       ";
 9900 VE=VE-1:GOSUB 110
 9910 RETURN
10000 REM ++++ WEEK 1 ++++
10010 REM
10020 REM  DAGTELLER = DT
10030 REM
10040 REM  MAANDAG   = 1
10050 REM  DINSDAG   = 2
10060 REM  WOENSDAG  = 3 SJ-| 53 WEKEN
10070 REM  DONDERDAG = 4 ---/
10080 REM  VRIJDAG   = 5
10090 REM  ZATERDAG  = 6
10100 REM  ZONDAG    = 7
10110 REM
10120 REM ++++ MINIMAAL JAARTAL ++++
10130 IF JR>=JI THEN 10170
10140 JR=JI
10150 SR=JR:GOSUB 300:JR$=SR$
10160 REM ++++ 1 JAN JR$ ++++
10170 JV=JR-JI:REM JAAR VERSCHIL
10180 SJ=INT(JV/4):REM SCHRIKKEL JAREN
10190 EJ=INT(JV/100):REM EEUW JAREN
10200 E4=INT(JV/400):REM ELKE 4 EEUWEN
10210 RV=JV+SJ-EJ+E4:REM REKEN VERSCHIL
10220 DV=RV-INT(RV/7)*7:REM DAG VERSCHIL
10230 DT=DJ+DV:REM DAGTELLER
10240 IF DT>7 THEN DT=DT-7:REM 1 JAN JR$
10250 REM ++++ FEB 28/29 DAGEN ++++
10260 MA(2)=28
10270 IF RIGHT$(JR$,2)<>"00" THEN 10290
10280 IF JR/400<>INT(JR/400)THEN 10320
10290 IF JR/4<>INT(JR/4)THEN 10320
10300 MA(2)=29
10310 REM ++++ MAXIMALE WEEK ++++
10320 MW=52:REM MAX WEEK
10330 IF(DT=3)AND(MA(2)=29)THEN MW=53
10340 IF DT=4 THEN MW=53
10350 REM ++++ MAANDAG WEEK 1 ++++
10360 IF DT=1 THEN D1=1
10370 IF DT=2 THEN D1=0
10380 IF DT=3 THEN D1=-1
10390 IF DT=4 THEN D1=-2
10400 IF DT=5 THEN D1=4
10410 IF DT=6 THEN D1=3
10420 IF DT=7 THEN D1=2
10430 RETURN
10500 REM ++++ MAANDAG WEEK WK ++++
10510 DA=D1+1*(WK-1)
10520 FOR AA=1 TO 12
10530 IF DA>MA(AA)THEN 10550
10540 MA=AA:AA=12:GOTO 10560
10550 DA=DA-MA(AA)
10560 NEXT AA
10570 IF DA>=1 THEN 10620
10580 DA=MA(12)+DA
10590 MA=12
10600 JR=JR-1
10610 SR=JR:GOSUB 300:JR$=SR$
10620 RETURN
11000 REM ++++ MAAK REGELS ++++
11010 FOR AA=1 TO 7
11020 SR=DA:GOSUB 300
11030 RE$(AA,0)=DA$(AA)+" "
11040 IF DA<10 THEN RE$(AA,0)=RE$(AA,0)+" "
11050 RE$(AA,0)=RE$(AA,0)+SR$+" "
11060 RE$(AA,0)=RE$(AA,0)+MA$(MA)+" "+JR$
11070 FOR BB=1 TO 6
11080 RE$(AA,BB)="-"
11090 NEXT BB
11100 DA=DA+1
11110 IF DA<=MA(MA)THEN 11160
11120 MA=MA+1:DA=1
11130 IF MA<13 THEN 11160
11140 JR=JR+1:MA=1
11150 SR=JR:GOSUB 300:JR$=SR$
11160 NEXT AA
11170 IF(WK>50)AND(MA=1)THEN JR=JR-1
11180 SR=JR:GOSUB 300:JR$=SR$
11190 RETURN
12000 REM ++++ INPUT ++++
12010 IM=0:REM INVOER MODUS
12020 KD=0:REM KEUZE DATA
12030 GOSUB 12510:REM KEUZE DATA
12040 IF TP=4 THEN 12070
12050 GOSUB 13010:REM INVOER DATUMREGELS
12060 GOTO 12030
12070 RETURN
12500 REM ++++ KEUZE DATA ++++
12510 GOSUB 100
12520 PRINT "WOCHE ";WK$;" ";JR$
12530 VE=11:HO=0:GOSUB 110
12540 PRINT "      --------------------------"
12550 PRINT "      KIES DATUM EN MAAK VERSLAG"
12560 PRINT "      --------------------------"
12570 GOSUB 2910:REM INSTRUCTIE
12580 VE=VM:GOSUB 110
12590 PRINT "   H......= HAUPTMENUE ";
12600 GOTO 12680
12610 VE=3:HO=0:GOSUB 110
12620 FOR AA=1 TO 7
12630 IF AA=KD THEN SR$=RE$(AA,0):GOSUB 150:PRINT
12640 IF AA<>KD THEN PRINT "   ";RE$(AA,0);"   "
12650 NEXT AA
12660 GOSUB 3410:REM TOETS
12670 REM+++ ONTP GOTO12680,12710,L2740,12740 +++
12672 IF TP=1 THEN GOTO 12680
12674 IF TP=2 THEN GOTO 12710
12676 IF TP=3 THEN GOTO 12740
12678 IF TP=4 THEN GOTO 12740
12680 KD=KD+1
12690 IF KD>7 THEN KD=1
12700 GOTO 12610
12710 KD=KD-1
12720 IF KD<1 THEN KD=7
12730 GOTO 12610
12740 RETURN
13000 REM ++++ INVOER DATUMREGELS ++++
13010 GOSUB 100
13020 PRINT "WOCHE ";WK$;" ";RE$(KD,0):PRINT
13030 GOSUB 120
13040 FOR AA=1 TO 6
13050 PRINT RE$(KD,AA):PRINT
13060 NEXT AA
13070 GOSUB 110
13080 ID=0:REM INVOER DATUMREGEL
13090 FOR AA=1 TO 6
13100 PRINT RE$(KD,AA);
13110 IF RE$(KD,AA)<>"-" THEN 13130
13120 ID=AP:AA=6:GOTO 13140
13130 PRINT:PRINT
13140 NEXT AA
13150 IF ID=0 THEN 13280
13160 GOSUB 120:V1=VE:H1=HO
13170 VE=VM-1:HO=0:GOSUB 110
13180 PRINT "   #ttpE (RETURN) = ENDE EINGABE ###";
13190 VE=V1:HO=H1:GOSUB 110
13200 INPUT ID$
13210 IF ID$="" THEN GOSUB 250:GOTO 13010
13220 IF(ID$<>"E")AND(ID$<>"e")THEN 13240
13230 GOSUB 110:PRINT "  ";:GOTO 13280
13240 IM=1
13250 IF LEN(ID$)<=60 THEN 13270
13260 ID$=LEFT$(ID$,60)
13270 RE$(KD,ID)="- "+ID$:GOTO 13010
13280 VE=VM-2:HO=0:GOSUB 110
13290 PRINT "     --------------------------------"
13300 JN$="     wil je nog iets wijzigen"
13310 GOSUB 2810:REM J/N
13320 IF JN=2 THEN 13630
13330 GOSUB 100
13340 PRINT "WOCHE ";WK$;" ";RE$(KD,0)
13350 PRINT
13360 PRINT ".........wijzigen....."
13370 PRINT
13380 FOR AA=1 TO 6
13390 PRINT AA;" ";RE$(KD,AA)
13400 PRINT
13410 NEXT AA
13420 PRINT "------------------------------"
13430 PRINT "welke regel wil je wijzigen ? ";
13440 GOSUB 210
13450 IF(IN>=49)AND(IN<=54)THEN 13470
13460 GOSUB 250:GOTO 13440
13470 ID=VAL(IN$)
13480 GOSUB 100
13490 PRINT "WOCHE ";WK$;" ";RE$(KD,0)
13500 PRINT
13510 PRINT ".........wijzigen.....REGEL ";ID
13520 PRINT:PRINT
13530 GOSUB 120
13540 PRINT RE$(KD,ID)
13550 PRINT:PRINT
13560 PRINT "-------------------"
13570 PRINT "toets regel goed in"
13580 PRINT "-------------------"
13590 HO=1:GOSUB 110
13600 INPUT ID$
13610 IF ID$="" THEN RE$(KD,ID)="-":GOTO 13010
13620 GOTO 13240
13630 RETURN
25000 REM ++++ DATAREGELS ++++
25010 DATA "                 Nijmegen  21 mei 1989"
25020 DATA ""
25030 DATA "UEBER VERLAG"
25040 DATA "------------"
25050 DATA ""
25060 DATA "Af en toe is het best wel eens handig"
25070 DATA " om een verslag te maken over hetgeen"
25080 DATA " wat je gedaan hebt of moet doen."
25090 DATA ""
25100 DATA "Uw eigen overzicht is meestal de week"
25110 DATA " die geweest is en de week die komt."
25120 DATA ""
25130 DATA "Uw computer kan met dit programma de"
25140 DATA " gegevens opslaan, zodat u na verloop"
25150 DATA " van (zelfs jaren) de belangrijkste"
25160 DATA " gebeurtenissen nog voor de geest kan"
25170 DATA " halen."
25180 DATA ""
25440 DATA ""
25450 DATA "PROGRAMMA UITLEG"
25460 DATA "--------- ------"
25470 DATA "U tikt het jaar en weeknummer in"
25480 DATA " en de computer geeft u de kalender "
25490 DATA " van deze week."
25500 DATA ""
25510 DATA "Per dag mag u 6 regels van maximaal"
25520 DATA " 60 karakters invullen en wijzigen."
25530 DATA ""
25540 DATA "Als u de aankomende week als PLANNING"
25550 DATA " invult en eind volgende week wijzigt"
25560 DATA " houdt u een prima VERSLAG en tevens"
25570 DATA " een inzicht wat u nog moet doen in de"
25580 DATA " week daarop."
25590 REM ++++ DATAREGELS A#ZENDER ++++
25600 DATA ""
25610 DATA ""
25620 DATA "met groetjes van Frans Verberkt"
25630 DATA "                 Hillekensacker 12 - 10"
25640 DATA "                 6546 KG NIJMEGEN"
25650 DATA ""
25660 DATA "                 tel. 080-779555"
25670 DATA ""
25680 DATA "      Tot ziens"
25690 DATA ""
25700 REM ++++ DATAREGEL END ++++
25710 DATA "ENDE"
30000 REM
32000 REM VERSLAG 21 MEI 1989
32010 REM
32020 REM GEMAAKT OP APPLE
32030 REM GETEST  OP MSX...CHRIS POTHOF
32040 REM
32050 REM FRANS VERBERKT
32060 REM HILLEKENSACKER 12-10
32070 REM 6546 KG NIJMEGEN
32080 REM
32090 REM  TELEFOON 080-779555
32100 REM
32110 REM TROS-RADIO DD 891206
