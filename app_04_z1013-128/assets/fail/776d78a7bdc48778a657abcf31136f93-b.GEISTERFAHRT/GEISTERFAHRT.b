Zeichensatz UTF-8+Z1013()-CTRL()-ohne Umlaute(äöüß)

    1 A=INC.
    5 O.12
    8 @(20)=0;@(10)=0;@(11)=0
    9 GOS.6000
   10 T.(1024)
   20 B=H.(EE0F)
  190 PO.H.(F0),H.(CD)
  200 PO.H.(F1),H.(30)
  210 PO.H.(F2),H.(F1)
  220 PO.H.(F3),H.(32)
  230 PO.H.(F4),H.(E0)
  240 PO.H.(F5),H.(00)
  250 PO.H.(F6),H.(C9)
  260 G.4000
 3000 @(20)=@(20)+1
 3005 F.W=1TO4
 3010 PO.B,42
 3020 PO.B+2,42
 3030 PO.B-64,42
 3040 PO.B-127,42
 3050 PO.B-32,42
 3060 PO.B-3,42
 3070 PO.B+63,42
 3080 PO.B-1,42
 3090 PO.B+32,42
 3100 PO.B-1,42
 3110 PO.B,32
 3120 PO.B+67,42
 3130 PO.B+32,32
 3140 PO.B+96,42
 3170 PO.B,140
 3180 PO.B+1,128
 3190 PO.B+32,130
 3200 PO.B-1,129
 3210 PO.B-32,131
 3240 PO.B,32
 3250 PO.B-65,174
 3260 PO.B-63,173
 3270 PO.B+63,171
 3280 PO.B+65,172
 3300 N.W
 3301 GOS.10000
 3303 GOS.5000
 3310 O.12;T.(335)
 3311 P.#4,M*10+D-20," P U N K T E"
 3315 @(10)=M*10+D-20
 3316 @(11)=@(11)+@(10)
 3318 PR."GESAMTPUNKTE:",@(11)
 3319 PR."UNFAELLE    :",@(20)
 3320 F.A=1TO6000;N.A
 3333 T.(96)
 3340 IF@(20)=10G.20000
 3999 G.4000
 4000 G.4001
 4001 O.12;T.(1024)
 4005 GOS.12000
 4006 J=0
 4010 P." ",
 4018 F.M=1TO2000
 4019 F.D=1TO10
 4020 A=2+RND(28)
 4025 PO.H.(EFC0),198;PO.H.(EFDF),198
 4030 T.(32-A);PO.B,42;P.""
 4031 F.C=1TO10
 4040 C.H.(F0)
 4050 K=PE.(H.(E0))
 4060 IFK=8J=1
 4070 IFK=9J=-1
 4075 IFK=32J=0
 4080 K=PE.(B-J)
 4081 PO.B-J,42;PO.B,42
 4090 IFK#32G.3000
 4101 PO.B-J,206
 4102 B=B-J;N.D
 4103 PO.B,42;P.#4,M*(D-1)
 4104 PO.B,206
 4120 N.M
 4130 PO.B,32
 4140 P."O.K."
 4150 PO.B,206
 4160 F.D=1TO4000;N.D
 4177 G.10
 5000 REM EX
 5001 GOS.5010;G.5500
 5010 PO.B,140;PO.B,141
 5020 PO.B-32,131;PO.B+32,131
 5030 PO.B-1,129;PO.B+1,128
 5040 PO.B-32,32;PO.B+32,32
 5050 PO.B-1,32;PO.B+1,32;PO.B,32
 5060 RET.
 5500 PO.B+2,128;PO.B-2,129
 5510 PO.B+64,130;PO.B-64,131
 5520 GOS.5010
 5530 PO.B+33,172;PO.+31,132
 5540 PO.B+66,134
 5550 F.W=1TO444
 5555 N.W
 5560 PO.B+2,32;PO.B+34,42
 5570 PO.B+30,42;PO.B+64,32
 5580 PO.B-2,32;PO.B+31,32
 5590 PO.B+63,42;PO.B+63,32
 5600 PO.B+95,42
 5700 PO.B+33,32;PO.B+65,42
 5710 PO.B-64,32;PO.B-32,42
 5720 PO.B-32,32;PO.B,42
 5730 PO.B,32;PO.B+32,42
 5800 RET.
 6000 O.12;T.(320)
 6001 P."          G E I S T E R"
 6002 T.(4*32)
 6003 P."           F A H R E R"
 6010 T.(96)
 6015 F.B=1TO5
 6020 F.A=H.(ECE5)TOH.(ECFA)
 6030 PO.A,199
 6040 PO.A+11*32,199
 6050 N.A
 6060 F.A=H.(ECE5)TOH.(EE45)STEP32;PO.A,199;PO.A+21,199;N.A
 6100 F.A=H.(EE45)TOH.(EE5A)
 6110 PO.A,205
 6120 PO.A,184
 6130 N.A
 6150 F.A=H.(EE5A)TOH.(ECFA)STEP-32;PO.A,185;N.A
 6200 F.A=H.(ECFA)TOH.(ECE5)STEP-1;PO.A,184;N.A
 6300 F.A=H.(ECE5)TOH.(EE45)STEP32;PO.A,185;N.A
 6998 N.B
 7000 T.(3*32);P."EINE GEFAEHRLICHE SITUATION !!"
 7010 F.A=1TO10000;N.A;O.12
 7020 O.13;P."DU FAEHRST IN FALSCHER FAHRT-"
 7030 O.13;P."RICHTUNG AUF DER AUTOBAHN"
 7040 O.13;P."DEIN AUTO KANN ABER 10 UNFAELLE"
 7050 O.13;P."UEBERSTEHEN."
 7060 O.13;P."VERSUCHE SOLANGE WIE MOEGLICH"
 7070 O.13;P."ZU FAHREN !"
 7080 O.13;P."DU BEKOMMST FUER 100 METER"
 7090 O.13;P."10 PUNKTE,DIE SICH ADDIEREN"
 7100 O.13;P."DEIN AUTO KANN NACH"
 7110 O.13;P."LINKS = PFEIL LINKS"
 7120 P."RECHTS = PFEIL RECHTS"
 7130 P."GERADE =TASTE DAZWISCHEN"
 7140 O.13;P."GELENKT WERDEN"
 7200 O.13;O.13;PR."LOS MIT ENTER"
 7220 A=INC.
 7999 RET.
 8000 G.8010
 8010 G.8999
 8999 RET.
10000 PO.27,H.(0);PO.28,H.(34)
10010 PO.29,H.(0);PO.30,H.(36)
10020 PO.35,H.(0);PO.36,H.(01)
10030 C.H.(F51D)
10040 G.11000
10050 PO.S+4,H.(1E)
10060 PO.S+5,H.(01)
10070 PO.S+6,H.(4B)
10080 PO.S+7,H.(EE)
10090 PO.S+8,H.(80)
10100 PO.S+9,H.(D3)
10110 PO.S+10,H.(02)
10120 PO.S+11,H.(42)
10130 PO.S+12,H.(10)
10140 PO.S+13,H.(FE)
10150 PO.S+14,H.(EE)
10160 PO.S+15,H.(80)
10170 PO.S+16,H.(D3)
10180 PO.S+17,H.(02)
10190 PO.S+18,H.(C9)
10200 RET.
11000 PO.27,H.(0);PO.28,H.(35)
11010 PO.29,H.(0);PO.30,H.(34)
11020 PO.35,H.(0);PO.36,H.(01)
11030 C.H.(F51D);C.H.(3200)
11040 PO.27,0;PO.28,H.(36);PO.29,0;PO.30,H.(34)
11050 PO.35,0;PO.36,H.(01);C.H.(F51D)
11060 RET.
12000 F.M=H.(EC00)TOH.(EFE0)STEP32
12010 PO.M,198;PO.M+31,198
12020 N.M;RET.
20000 IF@(11)>0IF@(11)<1000G.21000
20010 IF@(11)>1000IF@(11)<1500G.22000
20020 IF@(11)>1500IF@(11)<2000G.23000
21000 PR."DU BIST DER KATASTROPHENFAHRER  DES JAHRES"
21010 PR."KAUF DIR LIEBER EINEN ROLLER !";G.24000
22000 PR."DINOSAURIER REAGIEREN SCHNELLER"
22010 PR."STEIGE AUF PANZER UM";G.24000
23000 PR."DU HAST EINE AUSGEZEICHNETE     REAKTION"
23010 PR."BERUFSVORSCHLAG:FLIEGENFAENGER";G.24000
24000 F.A=1TO10000;N.A;G.1
12336 00;N.A;G.1
15169 G.1
15169 G.1
    0 ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      HSAVE"GEI⇘
      STERFAHRT"
20539 .""
11858 ""
13362 000
15138 G.24000
 3362 "
20027 .A
46518 
 3562 ⇘
      ⇘
      ⇘
      @ ?⇘
      ???`!4~N#~(,2#
60704 !3oV#~OBBBB
59680 n⇘
      ⇘
      x'p/j4e:`?[CVIOPD⇘
       :⇘
      ⇘
      ⇘
      ````⇘
      ``` ~#w0000000000⇘
      00`000000000000000⇘
      ` ~#w⇘
      ```````⇘
       ~#w000000000000`00⇘
      0000000000000` ~#⇘
      w``⇘
      ````` ~#w000⇘
      000000000`0000000⇘
      00000000` ~#w⇘
      x'p/j4e:`?[CVIOPD :⇘
      ⇘
      ⇘
      ⇘
      ``````⇘
      ` ~#w000000000000`⇘
      000000000000000`⇘
       ~#w⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      ⇘
      