Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

   10 RESTORE 8000
   12 BORDER 1:INK 8:PAPER 5
   20 FOR K=30537 TO 30759:READ B:POKE K,B:NEXT
   30 CLS:PRINT "";
   40 PRINT "";
   50 PRINT "                            ";
   60 PRINT "                    ";
   70 PRINT "                    ";
   80 PRINT "                      ";
   90 PRINT "                  ";
  100 PRINT "                      ";
  110 PRINT "                    ";
  120 PRINT "                    ";
  130 PRINT "                            ";
  140 PRINT "                            ";
  150 PRINT "                            ";
  160 PRINT "                            ";
  170 PRINT "      Taste -9- Hoch        ";
  180 PRINT "      Taste -2- Runter      ";
  190 PRINT "                            ";
  200 PRINT "                            ";
  210 PRINT "                            ";
  220 PRINT "                   >Enter<  ";
  230 PRINT "                            ";
  240 PRINT "                            ";
  250 PRINT "";
  255 PRINT AT(23,0);""
  259 IY$=INKEY$:IF IY$<>CHR$(13)THEN 259
  270 CLS
  280 DOKE 30531,0:V=3:S=1
  290 PRINT INK 2;AT(0,0);"Punkte:",DEEK(30531)
  300 PRINT INK 2;AT(0,15);"Rekord:",H
  310 PRINT AT(1,0);""
  320 PRINT AT(23,0);""
  330 POKE 30534,1:DOKE 30529,(-4390)
  340 N=200:IF S=5 THEN S=1:V=V+1
  350 IF S=2 THEN RESTORE 2000
  351 IF S=3 THEN RESTORE 3000
  352 IF S=4 THEN RESTORE 4000
  353 IF S=1 THEN RESTORE 1000
  360 READ A,B:POKE 30535,A:POKE 30536,B
  370 IF INT(RND(1)*32)=1 THEN POKE 30533,1
  380 CALL 30537:N=N-1:IF N=0 THEN S=S+1:GOTO 340
  390 PRINT AT(0,7);DEEK(30531)
  410 IF H<DEEK(30531)THEN H=DEEK(30531)
  415 PRINT AT(0,22);H
  416 IF PEEK(30534)=1 THEN 360
  420 V=V-1:IF V<0 THEN 30
  430 GOTO 310
 1000 DATA 2,21,2,21,2,21,2,21,2,21,2,21,2,20,2,20,2,20,2,20,2,20,3,18
 1010 DATA 3,18,4,17,6,15,5,15,4,16,4,16,3,16,2,17,2,16,2,16,2,14,2,13
 1020 DATA 2,10,2,9,2,9,2,10,2,12,2,13,2,13,2,13,2,14,2,16,2,17,2,17,2,18
 1030 DATA 3,17,3,17,3,18,4,17,4,17,5,16,6,16,7,15,7,15,8,14,8,14,8,15
 1040 DATA 7,16,7,16,6,17,5,17,5,15,4,15,4,13,3,14,3,15,3,15,3,12,3,13
 1050 DATA 3,13,3,12,4,19,4,19,4,19,4,19,4,19,4,19,4,19,4,19,4,19,5,18
 1060 DATA 5,18,5,3,5,3,5,3,5,4,5,4,4,6,4,6,4,6,4,6,4,10,4,12,4,14,5,13
 1070 DATA 6,12,6,12,6,12,6,12,7,11,8,10,8,9,8,10,8,8,8,10,9,6,9,9,9,7,9,9
 1080 DATA 9,8,9,9,9,9,9,10,8,11,8,11,7,10,7,7,5,9,5,9,5,5,5,5,5,5,6,3,6,3
 1090 DATA 6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,3,6,2,7,1,7,1,7,1,7,1,6,3
 1100 DATA 4,7,4,10,4,14,4,19,4,19,4,19,4,19,5,18,5,18,5,18,6,17,6,17,6,17
 1110 DATA 6,17,7,16,7,16,7,16,7,16,7,16,7,16,6,17,6,17,6,17,6,17,7,16
 1120 DATA 7,16,7,15,9,11,10,7,10,7,12,5,12,5,12,4,13,3,13,3,13,3,12,6,11,8
 1130 DATA 10,10,9,12,8,14,7,16,6,17,5,18,4,19,3,20,2,21,2,21,2,21,2,21
 1140 DATA 2,21,3,20,5,18,8,15,12,11,17,6,18,5,17,6,12,11,8,15,5,18,3,20
 1150 DATA 2,21,2,21,2,21,2,21,2,21,2,21
 2000 DATA 2,18,2,14,2,10,2,6,3,3,2,4,2,4,2,3,2,3,2,3,2,4,2,5,2,5,2,5,2,4
 2010 DATA 2,2,2,3,2,4,2,4,2,6,3,7,3,7,3,7,4,7,4,5,5,4,5,5,5,5,5,5,6,4,4,6
 2020 DATA 3,9,3,9,8,4,6,7,6,7,6,15,10,11,9,12,9,11,11,9,11,8,11,5,13,7
 2030 DATA 10,12,8,14,5,17,5,17,4,17,4,17,3,18,3,14,10,2,8,6,5,11,3,15
 2040 DATA 3,17,2,20,2,21,3,19,3,19,3,19,16,2,4,17,5,16,8,15,6,17,6,16,5,17
 2050 DATA 13,2,6,16,6,15,5,14,3,16,3,12,3,11,4,13,6,11,7,3,2,19,2,19,2,15
 2060 DATA 3,14,5,12,3,14,2,15,10,7,5,12,2,15,15,2,2,16,2,17,2,18,2,19,2,20
 2070 DATA 2,21,2,21,2,15,2,15,2,15,2,14,2,13,2,13,2,13,2,11,2,11,2,2,2,2
 2080 DATA 2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,12,2,14,2,19,2,19,2,21
 2090 DATA 2,21,2,21,2,21,3,20,5,18,7,16,8,15,10,12,11,9,12,9,14,7,15,8
 2100 DATA 15,8,16,7,17,6,17,4,17,5,17,4,18,4,18,4,18,4,17,4,16,6,15,7,13,9
 2110 DATA 10,12,7,14,4,15,2,17,2,18,3,15,4,13,4,12,5,10,5,9,6,7,6,7,7,5
 2120 DATA 8,3,7,4,5,5,5,5,4,6,3,7,3,7,3,8,2,9,2,9,2,10,2,10,2,10,2,11,2,11
 2130 DATA 2,11,2,12,2,12,2,13,2,14,2,14,2,15,2,16,2,17,2,17,2,18,2,19,2,20
 2140 DATA 2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21
 3000 DATA 2,21,2,21,13,1,11,3,11,3,11,3,11,3,11,3,11,2,11,2,11,3,11,7,11,10
 3010 DATA 11,10,11,10,13,8,14,7,14,4,14,1,11,8,9,11,5,15,4,16,7,13,10,10
 3020 DATA 14,6,14,6,19,1,11,9,13,7,18,2,16,4,16,3,17,2,11,8,11,7,7,11
 3030 DATA 5,13,5,12,5,13,6,12,10,6,12,1,10,4,10,6,9,10,7,12,4,15,4,16,6,14
 3040 DATA 6,14,6,14,8,12,19,1,18,2,18,2,18,2,15,4,13,6,10,9,8,11,6,13
 3050 DATA 4,15,3,16,3,15,4,12,6,9,7,6,9,1,8,4,6,8,4,11,4,13,3,15,2,11,2,10
 3060 DATA 2,7,2,6,2,3,2,1,2,2,2,4,2,7,2,8,2,12,2,14,3,18,3,15,4,10,6,6
 3070 DATA 8,1,7,3,5,6,8,4,8,5,9,5,10,5,11,5,12,5,13,5,14,5,15,5,16,5,17,5
 3080 DATA 17,6,14,9,12,11,8,15,7,16,5,18,4,18,4,18,5,14,5,13,6,9,8,5,8,4
 3090 DATA 8,2,7,6,6,7,3,11,3,13,3,15,3,19,3,19,3,19,3,19,3,18,3,18,13,1
 3100 DATA 3,19,5,10,3,19,12,1,3,19,12,2,3,19,4,15,13,9,3,11,8,14,3,17
 3110 DATA 10,12,3,10,11,11,3,11,6,16,3,18,13,9,3,19,3,19,3,17,15,7,3,14
 3120 DATA 8,14,3,18,16,6,3,15,17,5,3,15,13,9,3,16,7,15,17,1,3,19,15,7
 3130 DATA 3,19,17,1,3,19,8,11,3,19,15,2,3,19,13,4,3,19,14,1,3,19,11,11
 3140 DATA 3,19,13,3,3,19,15,2,3,19,11,7,3,19,6,13,3,19,4,17,3,19,3,19
 3150 DATA 2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21
 4000 DATA 2,21,2,21,2,1,2,2,2,3,2,4,3,4,4,4,5,4,6,4,7,3,8,3,9,3,9,4,10,4
 4010 DATA 11,4,12,4,13,4,14,4,15,3,16,3,17,3,17,4,18,4,19,3,20,2,21,1
 4020 DATA 20,2,19,3,18,4,17,4,17,3,16,3,15,3,14,4,13,4,12,4,11,4,10,4
 4030 DATA 9,4,9,3,8,3,7,3,6,4,5,4,4,4,3,4,2,4,2,3,2,2,2,1,2,21,2,21,2,21
 4040 DATA 2,21,2,21,2,21,2,21,4,15,7,8,9,1,8,3,6,7,6,9,5,11,5,12,4,13
 4050 DATA 12,6,3,15,3,16,4,15,4,15,5,7,5,14,6,12,8,10,9,8,10,6,12,1,11,3
 4060 DATA 9,7,9,9,8,11,8,12,7,13,16,5,6,15,6,16,7,15,7,15,8,7,8,14,9,12
 4070 DATA 12,8,13,6,15,1,14,3,12,7,12,9,11,11,11,12,10,13,19,4,9,14,9,14
 4080 DATA 10,13,10,13,11,12,11,6,12,10,14,8,15,6,16,4,18,1,17,3,17,4,18,4
 4090 DATA 18,5,19,4,20,3,21,2,22,1,21,2,20,3,19,4,18,4,16,5,15,5,13,6,11,7
 4100 DATA 8,9,6,10,4,11,3,11,2,11,2,10,2,9,2,8,2,7,2,6,2,5,2,4,2,3,2,2
 4110 DATA 2,1,2,2,2,3,2,6,3,7,3,11,5,11,4,16,7,16,5,18,4,19,10,13,6,17
 4120 DATA 8,15,13,10,12,11,5,18,16,7,10,13,7,16,19,4,18,5,15,8,22,1,18,5
 4130 DATA 16,7,12,11,12,11,11,12,6,17,4,19,2,21,2,21,2,21,2,21,2,21,2,21
 4140 DATA 2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21,2,21
 4150 DATA 2,21,2,21,2,21,2,21,2,21,2,21,2,21
 8000 DATA 42,65,119,6,4,54,32,35,16,251,229,231,4,225,17,32,0,254,57,32,3,167
 8010 DATA 237,82,254,50,32,1,25,229,33,254,238,1,224,2,17,255,238,237,184
 8020 DATA 225,6,4,43,126,254,140,32,19,17,50,0,229,42,67,119,25,34,67,119
 8030 DATA 0,0,0,0,0,225,24,8,254,32,40,4,175,50,70,119,16,221,34,65,119,54,251
 8040 DATA 35,54,255,35,54,255,35,54,195,33,32,236,17,32,0,6,23,54,199,25
 8050 DATA 16,251,33,00,236,58,71,119,71,25,16,253,58,72,119,71,54,32,25,16,251
 8060 DATA 58,69,119,254,0,40,9,175,50,69,119,167,237,82,54,140,42,67,119,35,34
 8070 DATA 67,119,58,70,119,254,1,200,22,24,33,32,236,1,224,3,126,254,255,32,4
 8080 DATA 54,32,24,6,254,32,32,2,54,255,35,13,32,237,16,235,21,32,226,62,24
 8090 DATA 245,33,223,238,1,192,2,17,255,238,237,184,6,32,33,32,236,54,32,35
 8100 DATA 16,251,1,0,4,13,32,253,16,251,241,61,32,222,201
