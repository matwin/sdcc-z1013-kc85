Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

   10 CLS
   20 PRINT AT(2,11);"SPIELAUTOMAT"
   30 PRINT AT(4,8);"*****************"
   40 PRINT AT(25,0);"Zum Programmstart beliebige"
   50 PRINT AT(26,0);"Taste druecken !":LET I=0
   60 LET I=I-1:LET A=RND(I)
   70 IF INKEY$="" THEN GOTO 60:ELSE GOTO 80
   80 LET Z$="0123456789"
   90 DIM P(3):DIM Z(3):DIM R(3)
  100 PRINT AT(9,0);"Stopp"
  101 PRINT AT(10,1);"mit"
  102 PRINT AT(11,1);">S<"
  110 FOR I=10 TO 22
  120 PRINT AT(I-4,9);""
  130 PRINT AT(I-4,23);""
  140 NEXT I
  150 PRINT AT(5,9);""
  152 PRINT AT(17,9);""
  155 PRINT AT(18,8);""
  160 PRINT AT(19,8);"Y28OH" 
  165 PRINT AT(20,8);""
  170 FOR I=10 TO 22
  180 PRINT AT(6,I);"":PRINT AT(10,I);""
  190 NEXT I:PRINT AT(7,10);"         "
  200 PRINT AT(8,10);"         "
  210 GOSUB 430
  220 PRINT AT(9,10);"         "
  230 FOR I=1 TO 3
  240 PRINT AT(8,(I+2)*4);MID$(Z$,P(I),1):LET Z(I)=P(I)
  250 NEXT I
  260 PRINT AT(25,0);"Zum Start ENTER-Taste          "
  270 PRINT AT(26,0);"druecken          "
  280 INPUT " ";W
  290 PRINT AT(25,0);"                      "
  300 PRINT AT(26,0);"         "
  310 REM
  320 GOSUB 430:GOSUB 480
  330 K=K+1
  340 PRINT AT(5+K,27);MID$(Z$,Z(1),1)
  350 PRINT AT(5+K,29);MID$(Z$,Z(2),1)
  360 PRINT AT(5+K,31);MID$(Z$,Z(3),1)
  371 IF Z(1)=Z(2) AND Z(1)=Z(3) THEN GOTO 1000
  372 IF Z(3)=1 THEN GOTO 1100
  373 IF Z(2)=Z(3) THEN GOTO 1200 ELSE GOTO 1300
  380 IF K=>20 THEN GOTO 620
  390 PRINT AT(22,0);"Weiter mit >> J <<   "
  400 IF INKEY$="N" THEN WINDOW:CLS:END
  410 IF INKEY$<>"J" THEN GOTO 400
  420 GOTO 320
  430 REM
  440 FOR I=1 TO 3
  450 LET P(I)=INT(RND(1)*10)+1
  460 NEXT I
  470 RETURN
  480 REM
  490 LET SC=1
  500 FOR I=1 TO 3:LET R(I)=0:NEXT I
  510 FOR J=0 TO 70
  520 FOR I=SC TO 3
  530 IF R(I) <>0 THEN GOTO 600
  540 LET Z(I)=Z(I)+1
  550 IF Z(I)>10 THEN LET Z(I)=1
  560 IF (J>10+10*I) AND Z(I)=P(I) THEN LET R(I)=-1:LET SC=SC+1
  570 PRINT AT(8,(I+2)*4);MID$(Z$,Z(I),1)
  580 IF INKEY$="S" THEN LET SC=SC+1
  590 IF SC=4 THEN GOTO 610
  600 NEXT I,J
  610 RETURN
  620 REM
  630 FOR I=I TO 8
  640 PRINT AT(13,10);"Spiel beendet":PAUSE 5
  650 PRINT AT(13,10);"             ":PAUSE 5
  660 NEXT I
  662 PRINT AT(22,0);"Auswertung der Spielserie:"
  663 PRINT AT(23,0);""
  664 PRINT AT(25,4);V,"  Hauptgewinn"
  666 PRINT AT(26,4);Q,"  Gewinne"
  668 PRINT AT(27,4);S,"  Mini-Gewinne"
  670 PRINT AT(28,4);P," Nieten"
  672 PRINT AT(9,0);"     "
  674 PRINT AT(10,1);"   "
  676 PRINT AT(11,1);"   "
  678 END
 1000 REM
 1010 FOR I=1 TO 8
 1020 PRINT AT(13,11);"Hauptgewinn"
 1025 PRINT AT(15,12);"*********"
 1030 PAUSE 5
 1040 PRINT AT(13,11);"           "
 1045 PRINT AT(15,12);"         "
 1050 PAUSE 5
 1060 NEXT I
 1065 V=V+1
 1070 GOTO 380
 1100 REM
 1110 FOR I=1 TO 8
 1120 PRINT AT(13,11);"Mini-Gewinn":PRINT AT(15,16);"*":PAUSE 5
 1130 PRINT AT(13,11);"           ":PRINT AT(15,16);" ":PAUSE 5
 1140 NEXT I
 1145 S=S+1
 1150 GOTO 380
 1200 REM
 1210 FOR I=1 TO 8
 1220 PRINT AT(13,11);"  Gewonnen ":PRINT AT(15,15);"***":PAUSE 5
 1230 PRINT AT(13,11);"           ":PRINT AT(15,15);"   ":PAUSE 5
 1240 NEXT I
 1245 Q=Q+1
 1250 GOTO 380
 1300 REM
 1310 FOR I=1 TO 4
 1320 PRINT AT(13,11);"   NIETE   ":PAUSE 5 
 1330 PRINT AT(13,11);"           ":PAUSE 5
 1340 NEXT I
 1345 P=P+1
 1350 GOTO 380
