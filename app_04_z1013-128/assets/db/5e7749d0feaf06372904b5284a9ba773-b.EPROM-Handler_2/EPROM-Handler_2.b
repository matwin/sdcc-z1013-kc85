Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

    9 OUTCHAR 12
   10 PRINT;PRINT"********************************"
   20 PRINT;PRINT;PRINT"      EPROM-Handler"
   25 PRINT
   30 PRINT;PRINT"********************************"
   40 PRINT;PRINT;PRINT
   50 PRINT"Typauswahl"
   60 PRINT;PRINT
   70 PRINT;PRINT"    U555.........1"
   80 PRINT;PRINT"    2708.........2"
   90 PRINT;PRINT"    2716.........3"
  100 PRINT;PRINT"    2732.........4"
  110 PRINT;PRINT"    2764.........5"
  120 PRINT;PRINT;INPUT"Kennziffer"K
  130 IF K<1 GOTO 9
  140 IF K>5 GOTO 9
  150 OUT(15)=207;REM PORT B BITBETRIEB
  160 OUT(15)=128;REM D0-6 AUSGABE D7 EINGABE
  165 OUT(14)=33
  166 PRINT;PRINT"EPROM aufstecken";A=INCHAR
  170 IF K=1 Z=50;Y=1024
  180 IF K=2 Z=100;Y=1024
  190 IF K=3 Z=1;Y=2048
  200 IF K=4 Z=1;Y=4096
  210 IF K=5 Z=1;Y=8192
  300 OUTCHAR 12;REM CLS
  310 PRINT;PRINT;PRINT"Mode"
  315 OUT(14)=33
  320 PRINT;PRINT;PRINT"     Lesen.........1"
  330 PRINT;PRINT"     Programmieren.2"
  340 PRINT;PRINT"     Vergleichen...3"
  350 PRINT;PRINT"     Loeschtest....4"
  360 PRINT;PRINT;INPUT"Kennziffer"M
  365 PRINT;PRINT
  370 IF M<1 GOTO 300
  380 IF M>4 GOTO 300
  390 GOSUB(M*300+200)
  400 GOTO310
  500 REM EPROM->RAM
  510 INPUT"nach Adresse"A
  520 OUT(13)=127;REM BYTEEINGABE
  530 OUT(14)=41;OUT(14)=45;REM   RESET
  540 FOR I=A TO A+Y
  550 POKE I,IN(12)
  560 OUT(14)=44;OUT(14)=45
  570 NEXT I;RETURN
  800 REM PROGRAMMIEREN
  805 INPUT"von Adresse"A
  810 GOSUB 1400;REM LOESCHKONTR.
  820 PRINT;PRINT
  830 IF F=1 PRINT"trotzdem weiter? (J/N):",;T=INCHAR
  840 IF F=1 IF T#'J' RETURN
  860 FOR I=1 TO Z
  870 OUTCHAR 12
  880 PRINT;PRINT;PRINT"Pr.-Zyklus:",I
  890 GOSUB1600
  900 NEXT I
  910 REM PRUEFLESEN
  920 PRINT;PRINT;PRINT"Prueflesen";PRINT
  930 OUT(13)=127;OUT(14)=45;OUT(14)=41;OUT(14)=45;REM RESET
  940 F=0;FOR I=A TO A+Y-1
  950 IF IN(12)#PEEK(I) F=I;I=A+Y-1
  960 OUT(14)=44;OUT(14)=45;NEXT I
  970 IF F#0 PRINT"Zelle ",
  975 IF F#0 WORD(F-A);PRINT" des EPROM Fehler"
  980 RETURN
 1100 INPUT"Anfangsadr.des Vergleichsspei-  cherbereichs"A
 1110 GOTO 910
 1400 PRINT;PRINT"Loeschkontrolle";PRINT
 1410 OUT(13)=127;REM BYTEEINGABE
 1420 OUT(14)=41;OUT(14)=45;REM ZAELERRESET
 1430 F=0;REM FLAG LOESCHEN
 1440 FOR I=1 TO Y
 1450 IF IN(12)#255 F=1;I=Y
 1460 OUT(14)=44;OUT(14)=45;REM WEITERZAELEN
 1470 NEXT I
 1480 PRINT;PRINT"EPROM",
 1490 IF F=1 PRINT" nicht",
 1495 PRINT" geloescht"
 1500 RETURN
 1600 REM EIN PR.ZYKLUS
 1610 OUT(14)=41;OUT(14)=25;OUT(14)=29;REM Upp ZUSCHALTEN/RESET
 1620 OUT(13)=15;REM BYTEAUSG.
 1630 FOR J=A TO A+Y-1
 1640 OUT(12)=PEEK(J)
 1650 OUT(14)=93;OUT(14)=29
 1655 IF IN(14)#29 GOTO 1655
 1657 OUT(14)=28;OUT(14)=29
 1660 NEXT J;OUT(14)=33
 1670 RETURN
