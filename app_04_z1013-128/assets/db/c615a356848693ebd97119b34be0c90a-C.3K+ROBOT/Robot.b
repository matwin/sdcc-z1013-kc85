Zeichensatz UTF-8+Z1013()-CTRL()-ohne Umlaute(äöüß)

   10 O.12
   15 GOS.801
   20 A=H.(EC80)
   30 F.X=A+1TOA+30;PO.X,226;N.X
   40 F.X=A+32TOA+768STEP32;PO.X,192;N.X
   50 F.X=A+97TOA+126
   55 PO.X,226;N.X
   60 F.X=A+257TOA+286;PO.X,226;N.X
   70 F.X=A+449TOA+478;PO.X,226;N.X
   80 F.X=A+801TOA+830;PO.X,238;N.X
   90 F.X=A+63TOA+799STEP32
  100 PO.X,244
  110 N.X
  120 F.X=A+40TOA+776STEP32
  130 PO.X,161;N.X
  140 F.X=A+48TOA+784STEP32
  150 PO.X,161;N.X
  160 F.X=A+57TOA+793STEP32
  170 PO.X,161;N.X
  180 Z=INC.
  200 O.12
  205 GOS.900
  210 F.X=H.(ECA5)TOH.(EF05)STEP32
  220 PO.X,192;N.X
  225 PO.H.(ECA5),153;PO.H.(ECA6),155
  230 F.X=H.(EF26)TOH.(EF3D)
  240 PO.X,158;N.X
  245 PO.H.(EF3D),147;PO.H.(EF1D),149
  250 A=H.(EF06)
  260 PO.A,152
  270 PO.A-32,153
  280 PO.A-63,152
  290 PO.A-95,153
  300 PO.A-126,152
  310 PO.A-158,153
  320 PO.A-189,152
  330 PO.A-221,153
  340 PO.A-252,152
  350 PO.A-284,153
  360 PO.A-315,144
  370 PO.A-346,144
  380 PO.A-377,144
  390 PO.A-408,146
  400 PO.A-407,147
  410 PO.A-438,146
  420 PO.A-437,147
  430 F.X=A-436TOA-426
  440 PO.X,158;N.X
  450 F.X=H.(ED06)TOH.(ED1D)
  460 PO.X,217;N.X
  500 B=A-95
  510 GOS.1110
  520 B=A-377
  530 GOS.1110
  540 B=A-437
  550 GOS.1110
  560 Q=INC.
  565 O.12
  570 G.2000
  800 STOP
  801 TAB(34)
  802 PR."Informatik und Technologie"
  803 TAB(2)
  804 PR.""
  810 TAB(105);PR."FORMUNG WANDLUNG TRANS"
  815 Q=INC.
  820 TAB(98);PR."STOFF"
  825 Q=INC.
  830 TAB(129);PR."ENERGIE"
  835 Q=INC.
  840 TAB(193);PR."INFOR-  Sprache log.Op.  Kabel"
  850 PR." MATION"
  860 TAB(9);PR."Codier.  1+1=2   Rohr"
  870 PR." "
  880 TAB(9);PR."Telefon Computer Leit."
  890 TAB(96)
  895 RET.
  900 TAB(40)
  910 PR."WACHSTUMSGRENZEN";TAB(8)
  920 PR.""
  925 TAB(32);PR."NUTZEN"
  930 TAB(70)
  940 PR."theoret.Grenze"
  950 TAB(51)
  960 PR."Maximum"
  970 TAB(80)
  975 PR."Optimum"
  980 TAB(265)
  990 PR."Funktionalitaet"
 1000 TAB(150);PR."KOSTEN"
 1010 RET.
 1100 B=A-95
 1110 C=PE.(B)
 1120 PO.B,255
 1130 PO.B,255
 1150 RET.
 1210 Q=INC.
 1230 O.12;G.2000
 1249 G.1250
 1250 F.X=A+320TOA+336
 1260 PO.X,183;N.X;PO.A+353,255;PO.A+367,255
 1270 F.X=A+384TOA+384+31
 1280 PO.X,137;N.X
 1305 F.X=1TOB;N.X
 1306 RET.
 1310 PO.A+258,192;PO.A+290,192
 1320 F.X=A+227TOA+244;PO.X,248;N.X
 1350 F.X=1TOB;N.X
 1360 RET.
 1400 PO.A+260,192;PO.A+292,192
 1410 F.X=A+229TOA+167STEP-31
 1420 PO.X,144;N.X
 1430 F.X=A+136TOA+142
 1440 PO.X,248;N.X
 1450 F.X=A+175TOA+244STEP34
 1460 PO.X,150;PO.X+1,149
 1470 N.X
 1480 F.X=1TOB;N.X;RET.
 1500 PO.A+262,192;PO.A+294,192
 1510 F.X=A+231TOA+136STEP-63
 1520 PO.X,152;PO.X-32,153;N.X
 1530 F.X=A+105TOA+112;PO.X,248;N.X
 1540 F.X=A+145TOA+244STEP33
 1550 PO.X,145;N.X
 1560 F.X=1TOB;N.X
 1570 RET.
 1600 F.X=A+296TOA+264STEP-32;PO.X,192;N.X
 1610 F.X=A+233TOA+171STEP-31
 1620 PO.X,144;N.X
 1630 F.X=A+140TOA+81STEP-30
 1635 PO.X,146;PO.X+1,147
 1636 N.X
 1637 PO.A+80,146;PO.A+81,147
 1640 F.X=A+82TOA+244STEP65
 1650 PO.X,155;PO.X+32,156;N.X
 1660 F.X=1TOB;N.X;
 1670 RET.
 1700 F.X=A+266TOA+298STEP32
 1710 PO.X,192;N.X
 1720 F.X=A+235TOA+206STEP-30
 1730 PO.X,146;PO.X+1,147;N.X
 1740 PO.A+205,146;PO.A+206,147
 1750 F.X=A+175TOA+20STEP-31
 1760 PO.X,144;N.X
 1770 F.X=A+21TOA+245STEP32
 1780 PO.X,159;N.X
 1785 F.X=1TOB;N.X
 1790 RET.
 1999 STOP
 2000 A=H.(EE00);GOS.1249;GOS.1600;GOS.3000
 2001 TAB(96)
 2002 PR."ROBOTEREINSATZ BEIM LACKIEREN"
 2003 F.X=1TO29;PR."",;N.X
 2004 PO.A+232,65
 2005 PO.A+139,66;PO.A+49,67;PO.A+243,68
 2006 PR." ";PR." ";PR."prinzip.Aufbau:"
 2009 Q=INC.;O.12;TAB(14*32)
 2010 A=H.(EC20);GOS.1249
 2012 GOS.3000
 2014 GOS.1310
 2016 GOS.2060
 2017 GOS.3200
 2020 GOS.1400
 2025 GOS.2100
 2027 GOS.3200
 2030 GOS.1500
 2035 GOS.2110
 2036 GOS.3200
 2040 GOS.1600
 2044 GOS.3200
 2045 GOS.2120
 2050 GOS.1700
 2055 GOS.3000;GOS.2130
 2060 GOS.3000
 2061 TAB(64)
 2062 PR."Computer SPEICHERT Daten"
 2063 TAB(32)
 2070 PR."          A    B    C    D";PR." "
 2072 PR." "
 2080 PR."1.sec.   90   180  180  90"
 2090 PR." "
 2099 RET.
 2100 PR."2.sec.   135  135  150 120";PR." "
 2109 RET.
 2110 PR."3.sec.   150  120  135  135";PR." "
 2115 RET.
 2120 PR."4.sec.   135  165  90   165";PR." "
 2125 RET.
 2130 PR."5.sec.   120  200  45   180";PR." "
 2200 Q=INC.;G.4000
 3000 F.X=A+213TOA+309STEP32
 3010 PO.X,255;PO.X+4,255;N.X
 3020 F.X=A+214TOA+216
 3030 PO.X,255;PO.X+96,255;N.X
 3040 PO.A+247,82
 3050 PO.A+250,160;PO.A+282,160;PO.A+251,160;PO.A+283,160
 3055 F.X=A+220TOA+380STEP32
 3060 PO.X,198;PO.X+3,198;N.X
 3070 PO.A+286,67
 3080 F.X=A+221TOA+222
 3085 PO.X,197;PO.X+160,197
 3086 N.X
 3090 F.X=A+321TOA+353STEP32
 3094 PO.X+22,232;PO.X+23,232;N.X
 3100 RET.
 3200 F.Y=1TO30
 3210 F.X=A+253TOA+349STEP32
 3220 PO.X,185;PO.X+1,185;N.X
 3230 F.X=A+253TOA+349STEP32;PO.X,32;PO.X+1,32;N.X
 3240 N.Y;RET.
 4000 A=H.(EE00)
 4005 GOS.5799
 4010 GOS.1249;GOS.3000
 4020 GOS.1310
 4021 GOS.5900
 4025 F.O=1TO4
 4030 GOS.5310
 4040 GOS.1400
 4045 GOS.5900
 4050 GOS.5400
 4060 GOS.1500
 4065 GOS.5900
 4070 GOS.5500
 4080 GOS.1600
 4085 GOS.5900
 4090 GOS.5600
 4100 GOS.1700
 4103 GOS.5900
 4105 PO.A+213,255;PO.A+245,255
 4110 GOS.5700
 4115 PO.A+213,255;PO.A+245,255
 4120 GOS.1600
 4125 GOS.5900
 4130 GOS.5600
 4140 GOS.1500
 4145 GOS.5900
 4150 GOS.5500
 4160 GOS.1400
 4165 GOS.5900
 4170 GOS.5400
 4180 GOS.1310
 4185 GOS.5900
 4190 GOS.5310
 4200 N.O
 4300 GOS.1310;GOS.1400;GOS.1500;GOS.1600;GOS.1700
 4500 ST.
 5000 F.X=H.(EC00)TOH.(EFCF)
 5010 PO.X,255;N.X
 5020 RET.
 5310 PO.A+258,32;PO.A+290,32;F.X=A+227TOA+244;PO.X,32;N.X
 5320 RET.
 5400 PO.A+260,32;PO.A+292,32
 5410 F.X=A+229TOA+167STEP-31;PO.X,32;N.X
 5420 F.X=A+136TOA+142;PO.X,32;N.X
 5450 F.X=A+175TOA+244STEP34;PO.X,32;PO.X+1,32;N.X
 5480 RET.
 5500 PO.A+262,32;PO.A+294,32
 5510 F.X=A+231TOA+136STEP-63
 5520 PO.X,32;PO.X-32,32;N.X
 5530 F.X=A+105TOA+112;PO.X,32;N.X
 5540 F.X=A+145TOA+244STEP33;PO.X,32;N.X;RET.
 5550 ST.
 5600 F.X=A+296TOA+264STEP-32;PO.X,32;N.X
 5610 F.X=A+233TOA+171STEP-31;PO.X,32;N.X
 5630 F.X=A+140TOA+81STEP-30;PO.X,32;PO.X+1,32;N.X
 5637 PO.A+80,32;PO.A+81,32
 5640 F.X=A+82TOA+244STEP65;PO.X,32;PO.X+32,32;N.X
 5660 RET.
 5700 F.X=A+266TOA+298STEP32;PO.X,32;N.X
 5720 F.X=A+235TOA+206STEP-30;PO.X,32;PO.X+1,32;N.X
 5740 PO.A+205,32;PO.A+206,32
 5750 F.X=A+175TOA+20STEP-31;PO.X,32;N.X
 5770 F.X=A+21TOA+245STEP32;PO.X,32;N.X
 5780 RET.
 5799 O.12
 5800 TAB(64);PR."COMPUTER STEUERT ROBOTER DURCH  DATENTRANSPORT"
 5810 RET.
 5900 F.U=1TO2;F.X=A+246TOA+248;PO.X,184;PO.X+32,184;N.X
 5910 F.X=A+246TOA+248;PO.X,32 ;PO.X+32,32;N.X;N.U
 5915 F.X=A+246TOA+248;PO.X,184;PO.X+32,184;N.X
 5920 RET.
 6000 F.Q=1TO255;F.W=1TO32;O.Q;N.W;PR.Q;N.Q