Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

   10 REM   P A R T Y
   20 OUTCHAR 12
   30 FOR I=1 TO 12
   40 PRINT
   50 NEXT I
   55 PRINT"  M O E C H T E N    S I E"
   60 PRINT;PRINT"  A N   E I N E R  P A R T Y"
   65 PRINT;PRINT"  T E I L N E H M E N  ? ?
   67 FOR I=1 TO 12;PRINT;NEXT I
   70 P=HEX(ED00);Q=HEX(ED1F)
   75 R=HEX(EE80);S=HEX(EE9F)
   80 FOR A=P TO Q;POKE A,'';NEXT A
   85 FOR A=R TO S;POKE A,'';NEXT A
   90 W=1;D=1;N=6000
   95 GOSUB 800
  100 OUTCHAR 12
  105 PRINT;PRINT;N=4000
  110 PRINT"KLOPFEN SIE AN DIE TUER !";GOSUB 800
  120 PRINT"SIND SIE EINGELADEN ?";GOSUB 810
  130 IF B=1 GOTO 180
  140 PRINT;PRINT;PRINT"KOENNEN SIE SICH"
  145 PRINT;PRINT"TROTZDEM EINSCHMEICHELN ?"
  150 GOSUB 810
  160 IF B=1 GOTO 180
  170 PRINT;PRINT;GOTO 110
  180 PRINT;PRINT;PRINT"TRETEN SIE EIN !";GOSUB 800
  190 PRINT"IST EIN NETTES MAEDCHEN"
  195 PRINT;PRINT"ZU SEHEN ?";GOSUB 810
  200 IF B=1 GOTO 240
  210 PRINT; PRINT;PRINT;PRINT
  220 PRINT"NEHMEN SIE IHREN",#3,D,". DRINK !"
  225 D=D+1;GOSUB 800
  230 GOTO 190
  240 PRINT;PRINT;PRINT"HAT SIE EINEN KERL DABEI ?";GOSUB 810
  250 IF B=1 GOTO 210
  260 PRINT;PRINT;PRINT"HABEN SIE AUSREICHEND MUT ?";GOSUB 810
  270 IF B=0 GOTO 210
  280 PRINT;PRINT;PRINT"BITTEN SIE SIE"
  285 PRINT;PRINT"UM DEN NAECHSTEN TANZ !"
  290 GOSUB 800
  300 PRINT"WILL SIE ?";GOSUB 810
  310 IF B=0 GOTO 210
  320 IF B=1 PRINT;PRINT
  325 PRINT"TANZEN SIE !"
  330 GOSUB 800
  340 GOTO 390
  350 PRINT;PRINT;PRINT"BIETEN SIE IHR EINEN DRINK AN !"
  355 GOSUB 800
  360 PRINT"WILL SIE ?";GOSUB 810
  370 PRINT;PRINT;PRINT"NEHMEN SIE IHREN",#3,D,". DRINK !";D=D+1
  380 GOSUB 800
  390 PRINT"VERSUCHEN SIE,SIE ZU KUESSEN !"
  400 GOSUB 800;PRINT"WILL SIE ?";GOSUB 810
  410 IF B=1 GOTO 430
  420 GOTO 350
  430 PRINT;PRINT;PRINT"VERSUCHEN SIE ZU FUMMELN !";GOSUB 800
  440 PRINT"WILL SIE ?";GOSUB 810
  450 IF B=0 GOTO 350
  460 PRINT;PRINT;PRINT"TRAGEN SIE SIE NACH OBEN !";GOSUB 800
  470 PRINT"WILL SIE ?";GOSUB 810
  480 IF B=0 GOTO 210
  490 PRINT;PRINT;PRINT"WILLST DU DENN AUCH ?";GOSUB 810
  500 IF B=0 GOTO 210
  510 PRINT;PRINT;PRINT"MOMENT. FRAG SIE,"
  515 PRINT;PRINT"OB SIE DIE PILLE NIMMT !";GOSUB 810
  520 IF B=0 GOTO 860
  530 OUTCHAR 12
  535 PRINT"                    "
  540 PRINT"                   "
  550 FOR I=1 TO 5
  560 PRINT"                   "
  570 NEXT I
  580 PRINT"                   "
  590 PRINT"                    "
  600 PRINT"                     "
  610 PRINT"                               "
  615 PRINT"                     "
  620 PRINT"                    "
  630 PRINT"                    "
  640 PRINT"DAS",#3,W,". MAL          ";W=W+1
  645 FOR I=1 TO 13
  647 PRINT;NEXT I
  650 GOSUB 1000
  660 PRINT;PRINT;PRINT"LAEUFT DIE PARTY NOCH ?";GOSUB 810
  670 IF B=1 GOTO 760
  680 D=D-1;W=W-1
  690 PRINT;PRINT
  700 PRINT"DU HAST",#3,D," DRINKS GENOMMEN"
  705 PRINT;PRINT"UND",#3,W," MAL GENASCHT."
  710 PRINT;PRINT;PRINT"SCHER DICH NACH HAUSE -"
  715 PRINT;PRINT"DEINE FRAU ERWARTET DICH  !!!!!"
  720 FOR I=1 TO 6000;NEXT I
  725 PRINT;PRINT;PRINT
  730 PRINT"======== ENDE DER PARTY ========"
  740 FOR I=1 TO 6000;NEXT I
  745 OUTCHAR 12
  750 STOP
  760 PRINT;PRINT;PRINT"KANNST DU DENN NOCH ?";GOSUB 810
  770 IF B=0 GOTO 1200
  780 PRINT;PRINT;GOTO 470
  800 PRINT;PRINT;FOR I=1 TO N;NEXT I;RETURN
  810 PRINT;INPUT"ANTWORT (JA=1 ; NEIN=0) "B
  815 PRINT
  820 IF B=1 PRINT"==== JA ====";RETURN
  830 IF B=0 PRINT"==== NEIN ====";RETURN
  840 PRINT"BLOEDE EINGABE !!"
  845 GOTO 810
  850 STOP
  860 OUTCHAR 12
  870 FOR I=1 TO 13
  880 PRINT;NEXT I
  890 PRINT"MACH, DASS DU FORTKOMMST -"
  895 PRINT;PRINT"DU BIST AUF DER"
  900 PRINT;PRINT"F A L S C H E N   P A R T Y  !!!"
  910 FOR I=1 TO 6000;NEXT I
  920 OUTCHAR 12
  930 STOP
 1000 J=1
 1005 J=J+1
 1010 POKE HEX(EEAD),'o'
 1015 POKE HEX(EECD),'|'
 1020 POKE HEX(EECE),' '
 1022 POKE HEX(EECF),'_'
 1025 POKE HEX(EED0),'_'
 1027 POKE HEX(EED1),'o'
 1032 POKE HEX(EEED),'|'
 1035 POKE HEX(EEEE),'|'
 1036 POKE HEX(EEEF),' '
 1037 POKE HEX(EEF0),'|'
 1045 FOR I=1 TO 60;N=N+1;NEXT I
 1050 POKE HEX(EECD),' '
 1055 POKE HEX(EECE),'\'
 1060 POKE HEX(EEED),' '
 1065 POKE HEX(EEEE),'/'
 1070 POKE HEX(EEEF),')'
 1080 FOR I=1 TO 60;NEXT I
 1085 IF J=10 GOTO 1100
 1090 GOTO 1005
 1100 PRINT"MMM .... AHHH !!!"
 1105 GOSUB 800
 1110 OUTCHAR 12
 1120 RETURN
 1200 POKE HEX(EEAD),'o'
 1210 POKE HEX(EECD),'|'
 1220 POKE HEX(EECF),'_'
 1230 POKE HEX(EED0),'_'
 1240 POKE HEX(EED1),'o'
 1250 POKE HEX(EEED),'|'
 1260 POKE HEX(EEEE),'|'
 1270 POKE HEX(EEF0),'|'
 1300 FOR I=1 TO 2000;NEXT I
 1310 POKE HEX(EEAB),'o'
 1320 POKE HEX(EEAC),'/'
 1330 POKE HEX(EEAD),' '
 1340 POKE HEX(EECC),'\'
 1350 POKE HEX(EECD),' '
 1360 POKE HEX(EEED),'\'
 1370 POKE HEX(EEEE),'/'
 1380 POKE HEX(EEF0),'/'
 1400 FOR I=1 TO 1000;NEXT I
 1410 POKE HEX(EEAB),' '
 1420 POKE HEX(EEAC),' '
 1430 POKE HEX(EECC),' '
 1440 POKE HEX(EECF),' '
 1450 POKE HEX(EED0),' '
 1460 POKE HEX(EED1),' '
 1470 POKE HEX(EEEA),'o'
 1480 POKE HEX(EEEB),'_'
 1490 POKE HEX(EEEC),'_'
 1500 POKE HEX(EEED),'_'
 1510 POKE HEX(EEEE),' '
 1520 POKE HEX(EEEF),'_'
 1530 POKE HEX(EEF0),'_'
 1540 POKE HEX(EEF1),'_'
 1550 POKE HEX(EEF2),'o'
 1600 GOSUB 800
 1610 OUTCHAR 12
 1620 FOR I=1 TO 7
 1630 PRINT;NEXT I
 1640 GOTO 680