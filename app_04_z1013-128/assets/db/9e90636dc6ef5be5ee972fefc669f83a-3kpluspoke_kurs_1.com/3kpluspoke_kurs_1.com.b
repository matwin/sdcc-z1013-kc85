5 O.12
10 TAB(64)
30 O.13;O.13
40 PR."DER POKE-BEFEHL IM ZYKLUS"
50 PR."ùùùùùùùùùùùùùùùùùùùùùùùùù"
60 O.13
70 PR."10 FOR X = A TO B STEP C"
80 F.X=1TO2
90 PO.H.(ECF7)+32,255
95 PO.H.(ECF7)+32,32
100 N.X
105 O.13
110 PR."20 POKE X,255 ; NEXT X"
115 TAB(8*32+1);PR."-33",
117 TAB(3);PR."-32",
119 TAB(2);PR."-31"
122 TAB(5*32+1);PR." -1",
123 TAB(4);PR."0",
124 TAB(4);PR."+1"
125 TAB(4*32+1);PR."+31",
126 TAB(3);PR."+32",
127 TAB(2);PR."+33",
128 TAB(5)
129 F.X=1TO32*15;O.8;N.X
130 F.X=H.(EE00)TOH.(EE0E)
140 PO.X,255
150 PO.X+5*32,255
160 PO.X+10*32,255
170 PO.X+15*32,255
180 N.X
200 F.X=H.(EE00)TOH.(EFFF)STEP32
210 PO.X,255
220 PO.X+5,255
230 PO.X+10,255
240 PO.X+15,255
250 N.X
260 PR."C = 1"
270 C=INC.
280 F.X=H.(EF17)TOH.(EF1F)
290 PO.X,255
300 F.A=1TO500;N.A
310 N.X
320 C=INC.
330 F.X=H.(EF17)TOH.(EF1F)
340 PO.X,32;N.X
350 F.X=1TO12
360 O.8;N.X
370 PR."C = -1"
380 C=INC.
390 F.X=H.(EF17)TOH.(EF10)
490 F.X=H.(EF17)TOH.(EF10)STEP-1
500 PO.X,255
510 F.A=1TO500;N.A
520 N.X
530 C=INC.
540 F.X=H.(EF17)TOH.(EF10)STEP-1
550 PO.X,32;N.X
560 F.X=1TO12
570 O.8;N.X
580 PR."C = +32"
590 C=INC.
600 F.X=H.(EF17)TOH.(EFFF)STEP32
610 PO.X,255
620 F.A=1TO500;N.A
630 N.X
640 C=INC.
650 F.X=H.(EF17)TOH.(EFFF)STEP32
660 PO.X,32;N.X
670 F.X=1TO12;O.8;N.X;PR."C = -32"
680 C=INC.
690 F.X=H.(EF17)TOH.(EF17)-7*32STEP-32
700 PO.X,255
710 F.A=1TO500;N.A
720 N.X
730 C=INC.
740 F.X=H.(EF17)TOH.(EF17)-7*32STEP-32
750 PO.X,32;N.X
760 F.A=1TO12;O.8;N.A;PR."C = -33"
770 C=INC.
780 F.X=H.(EF17)TOH.(EE10)STEP-33
790 PO.X,255
800 F.A=1TO500;N.A
810 N.X
820 C=INC.
830 F.X=H.(EF17)TOH.(EE10)STEP-33;PO.X,32;N.X
840 F.A=1TO12;O.8;N.A;PR."C = +33"
850 C=INC.
860 F.X=H.(EF17)TOH.(EFFF)STEP33
870 PO.X,255
880 F.A=1TO500;N.A
890 N.X
900 C=INC.
910 F.X=H.(EF17)TOH.(EFFF)STEP33
920 PO.X,32;N.X
930 F.A=1TO12;O.8;N.A;PR."C = -31"
940 C=INC.
950 F.X=H.(EF17)TOH.(EE1F)STEP-31
960 PO.X,255
970 F.A=1TO500;N.A
980 N.X
990 C=INC.
1000 F.A=H.(EF17)TOH.(EE1F)STEP-31
1010 PO.A,32;N.A
1020 F.A=1TO12;O.8;N.A;PR."C = +31"
1030 C=INC.
1040 F.X=H.(EF17)TOH.(EFFF)STEP31
1050 PO.X,255
1060 F.A=1TO500;N.A;N.X
1070 C=INC.
1080 F.X=H.(EF17)TOH.(EFFF)STEP31
1090 PO.X,32;N.X
1100 O.12
1110 TAB(32)
1120 PR."POKEN VON PARALLELEN"
1130 PR."ùùùùùùùùùùùùùùùùùùùù"
1140 O.13;PR."10 FOR X = A TO B STEP C"
1150 O.13;PR."20 POKE X,200"
1160 O.13;PR."30 POKE X+2,201"
1170 O.13;PR."40 POKE X+4,202"
1180 O.13;PR."50 POKE X+6,203 ; NEXT X"
1190 O.13;O.13
1205 C=INC.
1210 F.X=H.(EE40)TOH.(EFFF)STEP32
1220 PO.X,200
1230 PO.X+2,201
1240 PO.X+4,202
1250 PO.X+6,203
1260 N.X
1270 PR."STEP32       STEP33"
1280 C=INC.
1290 F.X=H.(EE4E)TOH.(EFFF)STEP33
1300 PO.X,200
1310 PO.X+2,201
1320 PO.X+4,202
1330 PO.X+6,203
1340 N.X
1350 C=INC.
1360 O.12
1370 TAB(64)
1380 PR."POKEN VON PARALLELEN"
1390 PR."ùùùùùùùùùùùùùùùùùùùù"
1400 TAB(64)
1410 PR."10 FOR X = A TO B STEP C"
1420 O.13;PR."20 POKE X,196"
1430 O.13;PR."30 POKE X+64,197"
1440 O.13;PR."40 POKE X+128,198"
1450 O.13;PR."50 NEXT X"
1460 O.13;O.13
1470 PR."STEP 1"
1474 C=INC.
1475 TAB(7*32)
1480 F.X=H.(EE60)TOH.(EE7F)
1490 PO.X,196
1500 PO.X+64,197
1510 PO.X+128,198
1520 N.X
1530 C=INC.
1540 PR."STEP 2"
1550 F.X=H.(EE60)+8*32TOH.(EE60)+8*32+31STEP2
1560 PO.X,196
1570 PO.X+64,197
1580 PO.X+128,198
1590 N.X
1600 C=INC.
1610 O.12
1620 O.13;O.13
1630 PR."DAS LAUFBAND"
1640 PR."ùùùùùùùùùùùù"
1650 O.13;O.13
1660 PR."STRUKTUR:";O.13;O.13
1670 PR."10 FOR X=1 TO DURCHLAUFZAHL";O.13
1680 PR."20 FOR Y=ANFANG TO SCHLEIFEENDE"
1690 PR."30 POKE Y,32"
1695 GOS.5000
1699 C=INC.;O.12
1700 F.X=1TO7
1710 F.Y=H.(EE00)TOH.(EE1F);PO.Y,255;N.Y
1720 F.Z=H.(EE00)TOH.(EE1F);PO.Z,32;N.Z
1750 F.Y=H.(EC10)TOH.(EFFF)STEP32;PO.Y,255;N.Y
1760 F.Z=H.(EC10)TOH.(EFFF)STEP32
1770 PO.Z,32;N.Z
1775 F.Z=H.(EC00)TOH.(EFFF)STEP33;PO.Z,255;N.Z
1780 F.Y=H.(EC00)TOH.(EFFF)STEP33;PO.Y,32;N.Y
1810 F.Y=H.(EC1F)TOH.(EFFF)STEP31;PO.Y,255;N.Y
1820 F.Z=H.(EC1F)TOH.(EFFF)STEP31;PO.Z,32;N.Z
1830 F.Y=H.(EE1F)TOH.(EE00)STEP-1;PO.Y,255;N.Y
1840 F.Z=H.(EE1F)TOH.(EE00)STEP-1;PO.Z,32;N.Z
1850 F.Y=H.(EFF0)TOH.(EC10)STEP-32;PO.Y,255;N.Y
1860 F.Z=H.(EFF0)TOH.(EC10)STEP-32;PO.Z,32;N.Z
1870 N.X
1880 O.12;C=INC.
1890 TAB(64);PR."POKEN VON BLINKZEICHEN"
1900 PR."ùùùùùùùùùùùùùùùùùùùùùù"
1910 O.13;O.13
1915 O.13;PR." 5 X = ADRESSE"
1916 O.13
1920 PR."10 FOR A=1 TO BLINKANZAHL"
1930 O.13;PR."20 POKE X,ZEICHENCODE"
1940 O.13;PR."30 POKE X,32"
1950 O.13;PR."40 NEXT A"
1960 O.13;O.13;PR."BEISPIEL:"
1961 C=INC.
1965 X=H.(EE49);Y=197
1966 Y=23
1970 F.A=1TO11
1975 F.B=1TO50
1977 PO.X,32
1980 PO.X,Y
1990 N.B
2000 X=X+2;Y=Y+1
2010 N.A
2020 C=INC.;O.12
2030 TAB(64);PR."POKEN EINES WANDERNDEN PUNKTES"
2040 PR."ùùùùùùùùùùùùùùùùùùùùùùùùùùùùùù"
2050 TAB(64)
2060 PR."10 FOR A=WEGBEGINN TO WEGENDE"
2070 O.13;PR."20 POKE A,ZEICHENCODE"
2080 O.13;PR."30 POKE A,32"
2090 O.13;PR."40 NEXT A"
2095 C=INC.;O.12
2100 F.A=1TO8
2110 F.X=H.(EE00)TOH.(EE1F)
2120 PO.X,255
2130 PO.X,32;N.X
2131 F.R=H.(EC10)TOH.(EFF0)STEP32;PO.R,255;PO.R,32;N.R
2140 F.Y=H.(EE1F)TOH.(EE00)STEP-1;PO.Y,255;PO.Y,32;N.Y
2160 F.S=H.(EFF0)TOH.(EC10)STEP-32;PO.S,255;PO.S,32;N.S
2170 N.A
2180 C=INC.
2200 TAB(64)
2210 PR."      GRAPHIK IM RELATIVEN"
2215 PR."      ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶"
2220 PR."         ADRESSENBEREICH"
2225 PR."         ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶"
2230 O.13;O.13;PR."IM POKE-BEFEHL (POKE X,Y) WURDE"
2240 PR."DIE ADRESSE DES BILDSCHIRM-"
2250 PR."SPEICHERPLATZES BISHER DURCH"
2260 PR."EINE FESTE HEX-ADRESSE ANGEGBEN"
2270 O.13;PR."BEISPIEL: POKE H.(EE00),255"
2280 O.13;O.13
2290 PR."WIRD NUN DER SPEICHERPLATZ EC00"
2300 PR."DURCH EINE VARIABLE DEFINIERT"
2310 PR."KANN JEDER PUNKT DES BILD-"
2320 PR."SCHIRMS DURCH ADDITION EINER"
2330 PR."DEZIMALZAHL ERREICHT WERDEN"
2340 O.13;PR."BEISPIEL:"
2350 O.13;PR."10 A=H.(EC00)"
2360 O.13;PR."20 POKE A+32,255"
2370 O.13;O.13;PR."NAECHSTES BILD ZEIGT DEN BILD-  AUFBAU"
2380 C=INC.;O.12
2390 F.A=0TO32
2394 F.X=1TO31
2395 PR.A,"           ",A+31;A=A+32
2396 N.X
2397 N.A
2398 PR."   992             1023",C=INC.
2400 GOS.5099
4999 ST.
5000 PR."40 NEXT Y"
5010 O.13;PR."50 FOR Z=ANFANG TO SCHLEIFEENDE"
5020 PR."60 POKE Z,255"
5030 PR."70 NEXT Z"
5040 O.13;PR."80 NEXT X"
5045 TAB(160)
5050 RET.
5099 O.12
5100 PR."BEISPIEL:"
5110 PR."ùùùùùùùùù"
5120 O.13;O.13
5130 PR."10 A=H.(EC00)"
5140 O.13;PR."20 PO.A+158,203"
5150 F.A=1TO50;PO.H.(EC9E),32;PO.H.(EC9E),203;N.A
5160 C=INC.
5170 O.13;O.13;PR."O D E R :"
5190 O.13;PR."10 A=H.(EF00);GOSUB 100"
5200 O.13;PR."20 A=H.(EF40);GOSUB 100"
5210 O.13;PR."30 A=H.(EF60);GOSUB 100"
5220 O.13;PR."STOP"
5230 O.13;PR."100 FOR X=A TOA+32"
5240 O.13;PR."110 POKE A,255"
5250 O.13;PR."120 NEXT X"
5260 O.13;PR."130 RETURN"
5265 TAB(3*32)
5270 C=INC.
5280 F.X=H.(EF00)TOH.(EF1F)
5290 PO.X,255;PO.X+64,255;PO.X+128,255;N.X
5300 RET.
