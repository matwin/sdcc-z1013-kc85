Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

   10 GOSUB 2390
   20 PRINT STRING$(32,""):PRINT "ML-Software ............. Z 1013"
   30 PRINT STRING$(32,""):PRINT "     Mario Lippert presents"
   40 PRINT:PRINT " A intelligent Computer - Match":PRINT:PRINT STRING$(64,"=");
   50 PRINT "==                            ==";
   60 PRINT "==     G O  -  1 0 * 1 0      ==";
   70 PRINT "==                            ==";:PRINT STRING$(128,"=")
   80 PAUSE 10
   90 PRINT AT(27,4);"Press a Key to beginn !":BEEP:
  100 POKE 4,0:X$=INKEY$:IF X$=""THEN 100:ELSE PRINT AT(27,3);STRING$(30," ")
  110 PRINT TAB(12);"MOMENT"
  120 DIM A(12,12),I4(10),J4(10),C$(10),D$(3)
  130 S2=2:W=1:B=-1
  140 D$(B+2)=CHR$(140)
  150 D$(0+2)=CHR$(217)
  160 D$(W+2)=CHR$(207)
  170 FOR K=1 TO 10
  180 READ I4(K)
  190 NEXT K
  200 DATA 0,-1,-1,-1,-1,0,1,1,1,1
  210 FOR K=1 TO 10
  220 READ J4(K)
  230 NEXT K
  240 DATA 1,1,0,-1,-1,-1,-1,-1,0,1
  250 FOR K=1 TO 10
  260 READ C$(K)
  270 NEXT K
  280 DATA "A","B","C","D","E","F","G","H","I","J"
  290 FOR I=1 TO 11  
  300 FOR J=1 TO 11
  310 A(I,J)=0
  320 NEXT J
  330 NEXT I
  340 A(6,6)=W
  350 A(7,7)=W
  360 A(6,7)=B
  370 A(7,6)=B
  380 C1=2
  390 H1=2
  400 N1=4
  410 Z=0
  420 WINDOW 20,31,1,31
  430 PRINT "WAEHLE DEINE STEINE !":PRINT
  440 PRINT "  ";CHR$(140);" TASTE: X":PRINT:PRINT "  ";CHR$(207);" TASTE: 0"
  450 C=W:WINDOW 26,31,1,31
  460 H=B
  470 X$=INKEY$:IF X$=""THEN 470:ELSE BEEP
  480 PRINT " GEWAEHLT: ";X$
  490 IF X$="X"THEN FS$=CHR$(140):FF$=CHR$(207):GOTO 540:ELSE:FS$=CHR$(207)
  500 IF X$<>"X"THEN FF$=CHR$(140)
  510 IF X$<>"0"THEN 470
  520 C=B
  530 H=W
  540 PRINT
  550 PRINT "WILLST DU ANFANGEN ?";
  560 X$=INKEY$:IF X$=""THEN 560
  570 IF X$><"J"AND X$><"N"THEN 560 ELSE:WINDOW:BEEP
  580 CLS:PRINT AT(27,1);"SPIELER : ",FS$:PRINT AT(29,0);"COMPUTER : ",FF$
  590 PRINT AT(27,13);H1:PRINT AT(29,13);C1
  600 IF X$="N"THEN GOSUB 2280:GOTO 630
  610 GOSUB 2280
  620 GOTO 1070
  630 B1=-1
  640 I3=0:PRINT AT(27,17);" ":PRINT AT(29,17);">"
  650 J3=0
  660 T1=C
  670 T2=H
  680 FOR I=2 TO 11:FOR J=2 TO 11
  690 IF A(I,J)<>0 THEN 830
  700 GOSUB 1960
  710 IF F1=0 THEN 830
  720 U=-1
  730 GOSUB 2030
  740 IF S1=0 THEN 830
  750 IF(I-2)*(I-9)<>0 THEN 770
  760 S1=S1+S2
  770 IF(J-2)*(J-9)<>0 THEN 790
  780 S1=S1+S2
  790 IF S1<B1 THEN 830
  800 IF S1>B1 THEN 820
  810 R=RND(1):IF R>.5 THEN 830
  820 B1=S1:I3=I:J3=J
  830 NEXT:NEXT
  840 BEEP
  850 IF B1>0 THEN 910
  860 PRINT AT(29,18);"SETZE AUS    ":PRINT AT(31,6);"          "
  870 BEEP
  880 IF Z=1 THEN 1600
  890 Z=1
  900 GOTO 1070
  910 Z=0
  920 PRINT AT(31,6);"              "
  930 PRINT AT(29,18);"GESETZT : ",(C$(J3-1)),I3-2
  940 PRINT AT(27,18);"             "
  950 I=I3
  960 J=J3
  970 U=1
  980 GOSUB 2030
  990 C1=C1+S1+1
 1000 H1=H1-S1
 1010 N1=N1+1
 1020 PRINT AT(31,8);"( +",S1," )"
 1030 GOSUB 2280
 1040 PRINT AT(27,13);H1:PRINT AT(29,13);C1
 1050 IF H1=0 THEN 1600
 1060 IF N1=>100 THEN 1600
 1070 T1=H
 1080 T2=C
 1090 PRINT AT(27,17);">":PRINT AT(29,17);" "
 1100 X$=INKEY$:IF X$=""THEN 1100:ELSE:BEEP:PAUSE 3
 1110 PRINT AT(29,18);"             ":PRINT AT(27,18);"GESETZT : ",X$,"  "
 1120 PRINT AT(31,8);"              "
 1130 II$=INKEY$:IF II$=""THEN 1130:ELSE I=VAL(II$):I=I+1:BEEP
 1140 IF ASC(X$)<65 OR ASC(X$)>74 THEN 1150:ELSE:GOTO 1240
 1150 PRINT AT(31,0);"WILLST DU AUSSETZEN ?"
 1160 X$=INKEY$:IF X$=""THEN 1160
 1170 PRINT AT(31,0);"                      "
 1180 PRINT AT(27,18);"            "
 1190 BEEP:IF X$><"J"THEN PRINT AT(27,18);"          ":PAUSE 4:GOTO 1100
 1200 PRINT AT(27,18);"SETZE AUS   "
 1210 IF Z=1 THEN 1600
 1220 Z=1
 1230 GOTO 630
 1240 PRINT AT(29,18);"            "
 1250 PRINT AT(27,18);"GESETZT : ",X$,I-1:FOR Q=1 TO 10
 1260 IF C$(Q)=X$ THEN 1290
 1270 NEXT Q
 1280 GOTO 1100
 1290 J=Q
 1300 I=I+1
 1310 J=J+1
 1320 IF A(I,J)=0 THEN 1370
 1330 PRINT AT(27,18);"BESETZT !    "        
 1340 PRINT AT(29,18);"NEUER VERSUCH":BEEP:PAUSE 20:PRINT AT(27,18);"           "
 1350 PRINT AT(29,18);"             ":PRINT AT(31,11);"      "
 1360 GOTO 1100
 1370 GOSUB 1960
 1380 IF F1=1 THEN 1420
 1390 PRINT AT(31,0);"UNSINN !  NEUER VERSUCH !":BEEP:PAUSE 30
 1400 PRINT AT(31,0);"                            "
 1410 GOTO 1100
 1420 U=-1
 1430 GOSUB 2030
 1440 IF S1>0 THEN 1480
 1450 PRINT AT(31,0);"ACHTUNG !  KEINE LINIE"
 1460 PAUSE 22:BEEP:PRINT AT(31,0);STRING$(30," ")
 1470 GOTO 1100
 1480 Z=0
 1490 U=1
 1500 GOSUB 2030
 1510 PRINT AT(31,8);"( +",S1," )"
 1520 H1=H1+S1+1
 1530 C1=C1-S1
 1540 N1=N1+1
 1550 GOSUB 2280
 1560 PRINT AT(27,13);H1:PRINT AT(29,13);C1
 1570 IF C1=0 THEN 1600
 1580 IF N1=>100 THEN 1600
 1590 GOTO 630
 1600 BEEP 2
 1610 WINDOW 24,31,0,31:CLS:PRINT "DU HAST";H1;"UND ICH";C1;
 1620 PRINT "STEINE." 
 1630 PRINT:IF H1=C1 THEN 1670
 1640 IF H1>C1 THEN 1690
 1650 PRINT "ICH HABE GEWONNEN !"
 1660 PRINT:GOTO 1700
 1670 PRINT "UNENTSCHIEDEN !":PRINT
 1680 GOTO 1700
 1690 PRINT "DU HAST GEWONNEN !!":PRINT
 1700 C1=C1-H1
 1710 IF C1>0 THEN 1730
 1720 C1=-C1
 1730 C1=(100*C1)/N1
 1740 PRINT "DAS WAR EIN";
 1750 IF C1<14 THEN 1870
 1760 IF C1<35 THEN 1850
 1770 IF C1<49 THEN 1830
 1780 IF C1<63 THEN 1810
 1790 PRINT " PERFEKTES SPIEL !!"
 1800 GOTO 1880
 1810 PRINT " UEBERLEGENER SIEG !"
 1820 GOTO 1880
 1830 PRINT " KAMPF !!"
 1840 GOTO 1880
 1850 PRINT " HEISSES SPIEL !!"
 1860 GOTO 1880
 1870 PRINT " MISTSPIEL !!"
 1880 PRINT
 1890 PRINT "WILLST DU EIN NEUES SPIEL ?(J/N)";
 1900 X$=INKEY$:IF X$=""THEN 1900
 1910 WINDOW:CLS:IF X$="J"THEN 290
 1920 IF X$><"N"THEN 1900
 1930 PRINT AT(11,1);"VIELEN DANK FUER DAS SPIEL !"
 1940 CLEAR 256
 1950 END
 1960 F1=0
 1970 FOR I1=-1 TO 1
 1980 FOR J1=-1 TO 1
 1990 IF A(I+I1,J+J1)=T2 THEN F1=1
 2000 NEXT J1
 2010 NEXT I1
 2020 RETURN
 2030 S1=0
 2040 FOR K=1 TO 10
 2050 I5=I4(K)
 2060 J5=J4(K)
 2070 I6=I+I5
 2080 J6=J+J5
 2090 S3=0
 2100 IF A(I6,J6)><T2 THEN 2260
 2110 S3=S3+1
 2120 I6=I6+I5
 2130 J6=J6+J5
 2140 IF A(I6,J6)=T1 THEN 2170
 2150 IF A(I6,J6)=0 THEN 2260
 2160 GOTO 2110
 2170 S1=S1+S3
 2180 IF U><1 THEN 2260
 2190 I6=I
 2200 J6=J
 2210 FOR K1=0 TO S3
 2220 A(I6,J6)=T1
 2230 I6=I6+I5
 2240 J6=J6+J5
 2250 NEXT K1
 2260 NEXT K
 2270 RETURN
 2280 WINDOW
 2290 PRINT "      A B C D E F G H I J":PRINT "    " 
 2300 PRINT "                         ":FOR I=2 TO 11
 2310 PRINT I-2;:PRINT TAB(4);" ";
 2320 FOR J=2 TO 11
 2330 PRINT D$(A(I,J)+2);" ";
 2340 NEXT J:PRINT " ";I-2
 2350 PRINT "                         " 
 2360 NEXT I 
 2370 PRINT "    ":PRINT "      A B C D E F G H I J"
 2380 RETURN
 2390 WINDOW:CLS
 2400 PRINT AT(2,7);"Mario Lippert":PRINT AT(3,7);"Niederviebig 54"
 2410 PRINT AT(4,7);"EBERSDORF / Sa.":PRINT AT(5,7);"8 7 0 1"
 2420 PRINT AT(6,7);"Tel.: Loebau 3592"
 2430 PAUSE 40:CLS:RETURN
