Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

    2 K$="UVWNSQEFG"
   18 WINDOW:CLS
   90 GOTO 1000
  120 PRINT;AT(30+EV,24+EV);">ENTER<":T$=INKEY$ 
  122 IF INKEY$=CHR$(13)THEN RETURN:ELSE 122
 1000 WINDOW:CLS:DIM W(10,2),Z(20):VB=1:VW=1:EV=1:Z=1:SP=1
 1020 PRINT:INPUT "RUNDENZAHL (1...10):";R
 1025 IF R<>INT(R)OR R<1 OR R>10 THEN PRINT CHR$(11):GOTO 1020
 1085 DIM P(R+1)
 1090 FOR RU=1 TO R
 1095 WINDOW:CLS:I=RND(Z)
 1110 PRINT AT(27,2);"RUNDE:   ; PUNKTE:"
 1111 PRINT AT(29,2);"BILD :   ; PUNKTE:"
 1120 PRINT AT(0,0);"",STRING$(30,""),"":FOR I=1 TO 20:PRINT AT(I,0);""
 1125 PRINT AT(I,31);"":NEXT I:PRINT AT(21,0);"",STRING$(30,""),""
 1130 FOR I=1 TO 45-5*G:PRINT;AT(INT(20*RND(1)+1),INT(30*RND(1)+1));"":NEXT I
 1135 FOR I=0 TO 8
 1140 W(I,1)=INT(20*RND(1)+1):W(I,2)=INT(30*RND(1)+1)
 1145 IF I=0 THEN 1165
 1150 F=0:FOR J=0 TO I-1:IF W(I,1)=W(J,1)AND W(I,2)=W(J,2)THEN F=1:J=I
 1155 NEXT J:IF F=1 THEN 1140
 1160 PRINT;AT(W(I,1),W(I,2));"$"
 1165 NEXT I:N=0:B=0
 1170 PRINT;AT(W(0,1),W(0,2));"*"
 1175 PRINT AT(27,9);MID$(STR$(RU),2,1)
 1180 PRINT AT(27,21);RIGHT$("   "+MID$(STR$(P(RU)),2),4)
 1195 PRINT;AT(29,8);RIGHT$(" "+MID$(STR$(G+1),2),2)
 1200 PRINT;AT(29,21);RIGHT$("   "+MID$(STR$(P),2),4)
 1205 IF N=3 THEN 1270
 1210 PRINT AT(25,20);"RICHTUNG ?":FOR I=1 TO 50:PRINT;AT(25,17);""
 1215 PAUSE 1:A$=INKEY$:IF A$=""THEN 1220:ELSE A=INSTR(A$,K$):IF A<>0 THEN I=100
 1220 PRINT;AT(25,17);"":PAUSE 1:NEXT I
 1225 PRINT AT(25,17);STRING$(13," "):IF A=0 OR A=5 THEN 1400
 1230 N=0:X=W(0,1)+(A>6)-(A<4)
 1235 Y=W(0,2)+(A=1 OR A=4 OR A=7)-(A=3 OR A=6 OR A=9)
 1240 PRINT AT(W(0,1),W(0,2));" ":A=PEEK(-5120+X*32+Y):IF A=36 THEN 1430
 1245 IF A=204 THEN 1420
 1250 IF A<>32 THEN 1425
 1255 B=B+1
 1260 IF X<>W(0,1)AND Y<>W(0,2)THEN B=0
 1265 W(0,1)=X:W(0,2)=Y:PRINT;AT(X,Y);"*"
 1270 W=0:H=1:C=0:FOR I=1 TO 8:X=W(I,1):Y=W(I,2):IF X=0 THEN 1370
 1275 IF H=0 THEN W=1:GOTO 1370
 1280 PRINT AT(X,Y);" ":L=W(0,1):S=W(0,2):W=W+1:IF RND(1)<.25 THEN 1325
 1285 IF RND(1)<.5 THEN 1305
 1290 X=X+(L<X)-(L>X)
 1295 Y=Y+(S<Y)-(S>Y)
 1300 GOTO 1335
 1305 IF G=0 THEN 1290
 1310 IF ABS(L-X)=ABS(S-Y)THEN 1290
 1315 IF ABS(L-X)>ABS(S-Y)THEN X=X+SGN(L-X):ELSE Y=Y+SGN(S-Y)
 1320 GOTO 1335
 1325 IF G<2 THEN 1285
 1330 X=X+SGN(2*RND(1)-1):Y=Y+SGN(2*RND(1)-1)
 1335 A=PEEK(-5120+X*32+Y):IF A=204 THEN 1495
 1340 IF A=36 THEN 1505
 1345 IF A=42 THEN H=0
 1350 IF A<>32 AND A<>42 THEN 1500
 1355 IF ABS(L-X)+ABS(S-Y)=1 THEN C=C+1
 1360 PRINT;AT(X,Y);"$"
 1365 W(I,1)=X:W(I,2)=Y
 1370 NEXT I
 1375 IF H=0 THEN 1435
 1380 IF W=0 THEN 1525
 1385 IF C=0 THEN B=0
 1390 IF B+SGN(C)>4 THEN 1440
 1395 GOTO 1205
 1400 N=N+1:IF N=2 THEN PRINT AT(23,0);"NICHT EINSCHLAFEN!":PAUSE 20
 1405 IF N=2 THEN PRINT AT(23,0);STRING$(26," ")
 1410 IF N=3 THEN PRINT;AT(25,0);"EINGESCHLAFEN"
 1415 GOTO 1270
 1420 A$="HASE GEGEN BAUM GEPRALLT !":GO=1:GOTO 1445
 1425 A$="HASE GEGEN MAUER GELAUFEN !":GO=2:GOTO 1445
 1430 A$="UAAAAAAH  GENAU IN DEN RACHEN !":GO=3:GOTO 1445
 1435 A$="HASE LEIDER GEFRESSEN !":GO=4:GOTO 1445 
 1440 A$="GERADEAUS SIND WIR SCHNELLER !"
 1445 PRINT AT(23,0);STRING$(32," "):PRINT;AT(23,0);A$ 
 1450 WINDOW 1,20,1,30:CLS:PRINT;AT(0,0);""
 1455 IF VW=2 THEN 1465
 1460 P(RU)=P(RU)+P
 1465 IF G=0 THEN PRINT AT(8,4);"IM ERSTEN BILD VERLOREN !":GOTO 1570
 1470 IF VW=1 THEN PRINT AT(8,4);"SIE ERREICHTEN",P(RU),"PUNKTE":GOTO 1570
 1475 PRINT AT(6,6);"SCHADE SIE HABEN ZU VIEL"
 1480 PRINT AT(8,12);"RISKIERT !!!"
 1485 PRINT AT(12,3);"SIE HAETTEN",P(RU),"PUNKTE GEHABT"
 1490 P(RU)=0:GOTO 1570
 1495 PRINT;AT(23,0);"WOLF GEGEN BAUM!":GOTO 1510
 1500 PRINT;AT(23,0);"WOLF AN DIE MAUER!":GOTO 1510
 1505 PRINT;AT(23,0);"WOLF FRISST WOLF!"
 1510 W(I,1)=0:P=P+INT(10+(3*RND(1)*(G+1))):W=W-1
 1515 PRINT;AT(29,21);RIGHT$("   "+MID$(STR$(P),2),4):PAUSE 10
 1520 PRINT AT(23,0);STRING$(26," "):GOTO 1370
 1525 WINDOW 1,20,1,30:CLS:PRINT;AT(5,3);"H U R R A A A A A A !"
 1530 PRINT;AT(0,0);"":P(RU)=P(RU)+P:P=0
 1535 PRINT;AT(8,6);"EIN GANZES RUDEL WOELFE":PRINT;AT(10,13);"BESIEGT
 1540 PRINT AT(23,0);STRING$(32," ")
 1545 PRINT AT(1,1);" ":G=G+1:IF VW=1 THEN PAUSE 50:WINDOW:CLS:GOTO 1110
 1550 PAUSE 20:PRINT;AT(14,3);"VERSUCHEN SIE NOCH EIN BILD ?"
 1555 PRINT;AT(23,24);"J/(N)":A$=INKEY$
 1560 A$=INKEY$:IF A$<>"J"AND A$<>"N"THEN 1560
 1565 IF A$="J"THEN WINDOW:CLS:GOTO 1110
 1570 PRINT AT(1,1);" ":GOSUB 120
 1575 G=0:P=0
 1580 WINDOW 22,31,0,31:CLS:PRINT AT(23,0);STRING$(36," "):WINDOW 1,20,1,30
 1585 CLS:PRINT AT(1,1);" ":PRINT;AT(3,6);"RUNDENWERTUNG",RU
 1595 PRINT;AT(6,9);P(RU):PRINT;AT(6,14);"PUNKTE"
 1600 GOSUB 120:NEXT RU
 1610 WINDOW:CLS:PRINT;AT(0,0);"ENDAUSWERTUNG"
 1615 PRINT;AT(1,0);STRING$(13,""):PRINT;AT(3,0);"RUNDE"
 1625 FOR I=1 TO R:PRINT;AT(I+4,1);I
 1630 PRINT;AT(I+4,7);P(I):P(R+1)=P(R+1)+P(I):NEXT I:I=I+5
 1635 PRINT;AT(I,0);"SUMME":PRINT;AT(I,7);P(R+1)
 1640 PRINT;AT(19,21);">ENTER<"
 1645 GOSUB 120:CLS:END
