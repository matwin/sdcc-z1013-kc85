Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

    1 WINDOW:CLS:PRINT:PRINT:POKE-4152,48:GOSUB 2000
   10 GOTO 1000
  120 PRINT AT(22,31);">ENTER<"
  122 T$=INKEY$:IF T$=""THEN 122 
  124 IF T$=CHR$(13)THEN RETURN:ELSE 122
 1000 WINDOW:CLS:DIM B(3,4),F(3,4):R=1
 1005 WINDOW 0,23,5,31:PRINT STRING$(23,CHR$(10))
 1010 PRINT AT(4,0);"":PRINT AT(6,0);""
 1015 PRINT AT(5,0);"   "
 1020 PRINT AT(7,1);" ":PRINT AT(8,1);" "
 1025 PRINT AT(1,0);"RUNDE":PRINT AT(2,2);"1"
 1030 S$="         ":PRINT S$
 1035 PRINT "  START       START":PRINT S$
 1040 V=18:P=0:O=32:N=71:Z=0:M=0:F=0
 1045 I=0:Z=Z+1:IF Z=101 THEN 1315
 1050 I=I+1:IF F>0 THEN 1075
 1052 I$=INKEY$:C=0
 1053 IF I$=CHR$(8)THEN C=-1
 1054 IF I$=CHR$(9)THEN C=1
 1055 U=V+C
 1060 IF PEEK(-4896+U)<>32 THEN F=1:GOTO 1145
 1065 IF F=-1 THEN 1180
 1070 PRINT AT(6,V);" ":POKE-4960+V,O:POKE-4960+V,N
 1075 IF F<>4 THEN 1090
 1080 PRINT:BEEP:FOR J=0 TO 3:FOR K=0 TO 4:POKE-5058+U+J*32+K,B(J,K)
 1085 POKE-5058+U+J*32+K,F(J,K):NEXT K:NEXT J:F=5
 1090 IF F<>3 THEN 1120
 1095 PRINT:BEEP
 1100 PRINT AT(4,U-2);"":PRINT AT(5,U-2);" "
 1105 PRINT AT(6,U-2);"":F=4
 1110 BEEP:IF P>50 THEN P=P-50:ELSE P=0
 1115 PRINT AT(5,1);RIGHT$("  "+MID$(STR$(P),2),3)
 1120 IF F<>2 THEN 1140
 1125 PRINT:BEEP
 1130 PRINT AT(5,U-2);"   ":PRINT AT(6,U-2);" "
 1135 PRINT AT(7,U-2);"  ":F=3
 1140 IF F<>1 THEN 1180
 1145 O=PEEK(-4832+V):N=PEEK(-4832+V):IF R=3 THEN BEEP:GOTO 1315
 1150 IF PEEK(-4960+V)=196 THEN PRINT AT(5,V);" ":PRINT AT(6,V);" "
 1155 BEEP:FOR J=0 TO 3:FOR K=0 TO 4:B(J,K)=PEEK(-4930+U+J*32+K)
 1160 F(J,K)=PEEK(-4930+U+J*32+K):NEXT K:NEXT J:F=2
 1165 PRINT:PRINT AT(5,U-2);"  "
 1170 PRINT AT(6,U-1);"":PRINT AT(7,U-1);""
 1175 PRINT AT(8,U);""
 1180 IF F>0 THEN 1200
 1185 O=PEEK(-4928+U):N=PEEK(-4928+U):PRINT
 1190 PRINT AT(5,U);"":PRINT AT(6,U);CHR$(34):V=U
 1195 IF F=-1 THEN F=0
 1200 IF F=5 THEN F=-1
 1205 IF G=0 THEN Y=INT(10*RND(1))*2+8
 1210 IF G=0 AND P>390 THEN W=INT(4*RND(1))*2+3:ELSE IF G=0 THEN W=0
 1215 IF G=0 AND Y+W>28 THEN W=0
 1220 IF G=0 AND RND(1)<P/500 AND I<14 THEN G=1
 1225 IF G=1 OR G=2 THEN PRINT AT(23,Y);""
 1230 IF(G=1 OR G=2)AND P>390 THEN PRINT AT(23,Y+W);""
 1235 IF G=1 OR G=2 THEN G=G+1
 1240 IF G=4 THEN PRINT AT(23,Y);""
 1245 IF G=4 AND P>390 THEN PRINT AT(23,Y+W);""
 1250 IF G=4 THEN G=0
 1255 IF G=3 THEN G=4
 1260 IF I<>17 THEN 1050
 1265 J=P
 1270 IF V=X+1 OR(V=X+2 AND P<310)THEN P=P+10
 1275 IF P>M THEN M=P
 1280 IF(J<>P OR P=0)AND R<>3 THEN 1290
 1285 PRINT " ";STRING$(26,"");
 1290 IF R=1 THEN PRINT AT(23,28);101-Z
 1292 X=INT(15*RND(1)+8)
 1295 PRINT AT(5,1);RIGHT$("  "+MID$(STR$(P),2),3)
 1300 PRINT AT(22,X);"  ":PRINT AT(22,X+2-(P<300));""
 1305 PRINT AT(23,X);"  ":PRINT AT(23,X+2-(P<300));""
 1310 GOTO 1045
 1315 CLS
 1320 PRINT AT(5,18);"":PRINT AT(6,18);CHR$(34)
 1325 PRINT STRING$(20,CHR$(10)):PRINT S$
 1330 PRINT "  ZIEL       ZIEL":PRINT S$;
 1335 FOR I=1 TO 20:PRINT AT(5,18);" ":PRINT AT(6,18);" ":PRINT
 1340 PRINT AT(5,18);"":PRINT AT(6,18);CHR$(34):PAUSE 1:NEXT I
 1345 IF R=3 THEN 1570
 1350 PRINT AT(10,6);"IN DER QUALIFIKATIONSRUNDE"
 1355 PRINT AT(12,6);"WURDEN",M,"PUNKTE ERREICHT"
 1360 PAUSE 30:IF M>490 THEN 1415
 1365 PRINT AT(16,6);"SIE MUESSEN NOCH TRAINIE-"
 1370 PRINT AT(18,6);"REN, UM DIE ZWISCHENRUNDE"
 1372 PRINT AT(20,6);"ZU ERREICHEN"
 1375 PRINT AT(22,20);">ENTER<":A$=INKEY$
 1380 A$=INKEY$:IF A$<>CHR$(13)THEN 1380
 1385 WINDOW:CLS:PRINT AT(20,1);"STARTEN SIE NOCH EINMAL (J)/N ?"
 1390 A$=INKEY$
 1395 A$=INKEY$:IF A$=""THEN 1395
 1400 IF A$<>"N"THEN CLEAR:GOTO 1000
 1405 CLS:PRINT AT(10,6);"AUF WIEDERSEHEN!"
 1410 PAUSE 50:CLS:END
 1415 PRINT AT(16,6);"SIE ERREICHEN DIE ZWISCHEN"
 1416 PRINT AT(17,6);"RUNDE"
 1420 F=INT((M-500)/10)+2
 1425 PRINT AT(18,6);"MIT FEHLERGUTSCHRIFT",F:PAUSE 50:CLS
 1430 PRINT AT(2,2);"2":R=2
 1435 PRINT AT(5,1);RIGHT$("  "+MID$(STR$(F),2),3)
 1440 WINDOW 0,23,20,20:PRINT STRING$(22,CHR$(10))
 1445 V=19:Z=0:U=21:I=0:GOTO 1455
 1446 I$=INKEY$:C=0
 1447 IF I$=CHR$(8)THEN C=-1
 1448 IF I$=CHR$(9)THEN C=1
 1450 U=V+C
 1455 IF U=20 AND V=21 THEN U=19 
 1460 IF U=20 AND V=19 THEN U=21
 1465 IF U<>V THEN PRINT AT(4,V);" ":PRINT AT(5,V);" "
 1470 IF U<>V THEN PRINT AT(4,U);"":PRINT AT(5,U);CHR$(34):V=U
 1475 O=PEEK(-4972):IF(O=143 OR O=159)AND U<>20 THEN 1510 
 1480 IF(O=190 OR O=192)AND U<>20 THEN 1510
 1485 IF I<>0 THEN I=I-1:PRINT:GOTO 1446
 1490 I=INT(5*RND(1)+3):Z=Z+1
 1495 IF Z/2=INT(Z/2)THEN A$="":B$="":N=6:ELSE A$="":B$="":N=3   
 1500 PRINT AT(21,20);A$:PRINT AT(22,20);B$
 1505 PRINT:GOTO 1446
 1510 F=F-1:PRINT AT(5,1);RIGHT$("  "+MID$(STR$(F),2),3)
 1515 BEEP:IF F<>0 AND Z<10 THEN 1485
 1520 WINDOW 0,23,0,31:CLS:PRINT AT(10,1);"IN DER ZWISCHENRUNDE WURDEN"
 1525 PRINT AT(12,2);Z,"FAEHNCHEN GUELTIG PASSIERT":PAUSE 30
 1530 IF Z>99 THEN 1550
 1535 PRINT AT(16,1);"DAMIT ERREICHEN SIE LEIDER DIE"
 1540 PRINT AT(18,1);"FINALRUNDE NOCH NICHT"
 1545 GOTO 1375
 1550 M1=M:Z1=Z:PRINT AT(16,1);"SIE SIND IN DER FINALRUNDE! DER"
 1555 F1=F:PRINT AT(18,1);"ERSTE FEHLER BEENDET DEN LAUF"
 1560 PRINT AT(5,1);"  0":PRINT AT(2,2);"3":R=3
 1565 PAUSE 50:CLS:PRINT STRING$(23,CHR$(10)):GOTO 1030
 1570 PRINT AT(10,1);"IN DER FINALRUNDE HABEN SIE"
 1575 PRINT AT(12,1);"SICH",P,"PUNKTE GESICHERT":PAUSE 50
 1580 WINDOW:CLS:WINDOW 1,22,1,31:CLS
 1585 PRINT AT(4,12);"GESAMT-WERTUNG":PRINT AT(5,12);STRING$(14,"")
 1590 PRINT AT(9,8);"RUNDE 1 :",M1,"PUNKTE"
 1595 Z=(Z1-100+F1)*5:PRINT AT(11,8);"RUNDE 2 :",Z,"PUNKTE"
 1600 P=P*2:PRINT AT(13,8);"RUNDE 3 :",P,"PUNKTE"
 1605 Z1=M1+Z+P:PRINT AT(17,8);"GESAMT  :",Z1,"PUNKTE"
 1610 PAUSE 100:CLS:END
 2000!
 2020 PRINT AT(5,5);" S L A L O M "
 2030 PRINT AT(6,5);" ~~~~~~~~~~~ "
 2050!
 2110 PRINT AT(10,1);">DRUECKEN SIE EINE TASTE<"
 2120 IF INKEY$=""THEN 2120:ELSE RETURN
