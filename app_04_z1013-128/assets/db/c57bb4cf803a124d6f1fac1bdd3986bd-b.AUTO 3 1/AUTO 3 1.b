Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

    1 O.12;TAB(999);P."ein tpe-Programm";FORI=0TO999;NE.I;GOSUB10000
    2 A=0
    3 GOTO 3000
   10 FOR I=0 TO 999
   15 IF@(I)=2Z=1;B=B+@(I-1);GOTO60
   20 IF@(I)=0GOTO80
   50 B=B+@(I)
   60 IF B<0 B=0
   70 IF B>22 B=22
   80 TAB(B)
  100 CALLHEX(3E00)
  110 E=PEEK(15888)
  115 IFE=0GOTO142
  120 F=-1
  125 IFE=9F=1
  130 IFE=32F=0
  142 C=C+F
  143 IF PEEK(C+32)#32 GOTO 2000
  150 POKEL,32
  153 IFZ=1Z=0;P."   ";GOTO160
  155 P."    "
  160 POKE C,206
  170 L=C
  210 NEXT I
  215 Q=0
  220 FOR J=0 TO ABS(20-S)
  230 TAB(B)
  240 CALLHEX(3E00)
  245 E=PEEK(15888)
  250 IF E=8 F=-1
  255 IF E=9 F=1
  260 IF E=32 F=0
  262 C=C+F
  264 IF PEEK(C+32)#32 GOTO 2000
  266 POKEL,32
  267 IFQ#1P."";Q=1;GOTO270
  268 P."    "
  270 POKEC,206
  272 L=C
  274 NEXT J
  275 FORR=0TO100;NEXTR
  276 POKEL,32
  277 POKEC+32,206
  278 FORR=0TO100;NEXTR
  279 POKEC+32,250
  280 POKEC+64,206
  283 R=10
  284 C=C+64
  285 FOR I=0 TO 5
  286 FOR J=0TOR
  287 NEXT J
  288 R=R+12
  289 POKEC,32;POKEC+32,206
  290 C=C+32
  292 NEXT I
  300 FOR R=0 TO 2311
  310 N.R
  315 P=1000
  320 O.12;TAB(96)
  330 P."Das gelingt nur den Besten. Sie "
  340 P."haben die Teststrecke ueber     "
  350 P."1000 Meter bestanden !"
  360 P.;P.;P.
  362 P."Sie erhalten ",#1,P*S," Punkte. "
  364 IF P*S>MM=P*S;P.;P."Das ist neuer Rekord !"
  366 P.;P.
  370 P."Wollen Sie noch einmal ueber    "
  380 P."diese Strecke ?"
  390 P.;P.
  400 P."                           J/N"
  410 R=INCHAR
  420 IF R='J' GOTO 1030
  430 TAB(64)
  440 P."Moechten Sie eine neue Piste    "
  450 P."oder lieber aufhoeren ?"
  460 P.;P."                      NEU/STOP"
  470 R=INCHAR
  480 IF R='N'TAB(96);P."Bitte etwas Geduld !";GOTO 1000
  490 O.12
  500 STOP
 1000 M=0
 1001 B=0
 1004 FOR I=0 TO 999 STEP 5
 1005 @(I)=B
 1006 @(I+1)=B
 1007 @(I+2)=B
 1008 @(I+3)=B
 1009 @(I+4)=B
 1010 R=RND(1000)
 1011 B=0
 1012 IFR<385B=-1
 1013 IFR>615B=1
 1015 NEXT I
 1020 FOR R=0 TO (RND(30)+40)
 1022 Z=RND(1000)
 1024 @(Z-1)=2
 1026 NEXT R
 1029 M=0
 1030 B=12
 1050 FOR I=0 TO 1
 1060 @(I)=0
 1070 NEXT I
 1090 L=C
 1100 G=0
 1110 O.12
 1140 F=0
 1145 IF A=1 GOTO 1500
 1150 P."AUTO-RENNEN....................."
 1155 A=1
 1160 P.""
 1170 P.;P.
 1180 P."Sie muessen Ihren Rennwagen () "
 1190 P."ueber die 1000 Meter lange Test-"
 1200 P."strecke lenken. Dazu verwenden  "
 1210 P."Sie die Tasten fuer die Kursor- "
 1220 P."bewegung (links/rechts) und die "
 1230 P."Taste 'Leerzeichen' fuer gerade."
 1240 P.;P.
 1250 P."Fuer jeden gefahrenen Meter gibt"
 1260 P."es einen Punkt, diese werden mit"
 1270 P."dem von Ihnen zu waehlenden     "
 1280 P."Schwierigkeitsgrad multipliziert"
 1290 P."und ergeben Ihre Punktzahl !"
 1300 P.
 1310 P."                         ENTER"
 1320 R=INCHAR
 1330 O.12;TAB(96)
 1340 P."Die Teststrecke wird vom Compu- "
 1350 P."ter immer neu entwickelt, so    "
 1360 P."dass stets fuer Abwechslung ge- "
 1370 P."sorgt ist."
 1380 TAB(64)
 1390 P."Es besteht darueber hinaus die  "
 1400 P."Moeglichkeit, z.B. fuer Wettbe- "
 1410 P."werbe, dieselbe Strecke zu ver- "
 1420 P."wenden.";P.
 1430 P.
 1440 P."Der Punkterekord fuer die je-   "
 1450 P."weilige Strecke wird gespeichert"
 1460 P."und bei der Wertung angezeigt.  "
 1462 P."Hindernissen ist auszuweichen ! "
 1470 P.;P."                         Enter"
 1490 R=INCHAR
 1500 O.12;TAB(160)
 1510 P."Welche Schwierigkeitsstufe trau-"
 1520 P."en Sie sich zu ?"
 1530 TAB(96)
 1540 INPUT"1 ... 20 "S
 1550 IF S<1 GOTO 1580
 1560 IF S>20 GOTO 1580
 1570 GOTO 1600
 1580 P.;P.;P."Bitte ueberlegen Sie !!!"
 1590 GOTO 1530
 1600 C=HEX(EC10)+(S+9)*32
 1610 O.12
 1620 TAB((S+9)*32)
 1800 Z=0
 1900 GOTO 10
 2000 V=0;IFPEEK(C+32)=206 V=1
 2001 POKEC+1,221
 2002 POKEC-1,215
 2003 POKEC-33,217
 2004 POKEC-31,209
 2005 POKEC-32,213
 2006 POKEC-63,210
 2007 POKEC+31,212
 2008 POKEC+33,211
 2009 POKEC+32,222
 2010 POKEC,208
 2020 FOR R=0TO20;N.R
 2030 POKEC,205
 2040 IFV=1POKEC+31,206
 2050 FOR R=0 TO 2000
 2055 NEXT R
 2060 O.12;TAB(128)
 2061 P=I-20+S
 2065 P."Sie haben ",#1,P," Meter von 1000"
 2066 P.
 2070 P."geschafft und erhalten dadurch";P.
 2075 P.#1,P*S," Punkte.";P.;P.
 2080 IFP*S<MP."Der Rekord liegt bei ",#1,M," ."
 2082 IFP*S=MP."Sie haben den Rekord egalisiert."
 2084 IFP*S>MP."Das ist neuer Rekord !";M=P*S
 2090 TAB(160)
 2092 P."                         Enter"
 2094 R=INCHAR
 2100 O.12
 2110 TAB(160)
 2120 P."Wollen Sie noch einen Versuch   "
 2130 P."auf der alten Teststrecke oder  "
 2140 P."moechten Sie eine neue Piste ?  "
 2150 P.
 2155 P."Oder moechten lieber aufhoeren ?"
 2160 P.
 2165 P."ALT/NEU/STOP ?"
 2170 R=INCHAR
 2180 IF R='A' GOTO 1030
 2190 IF R='N' TAB(96);P."Einen kleinen Moment Geduld !";G.1000
 2200 O.12
 2210 STOP
 2400 FOR R=0TO2000
 2410 NEXT R
 3000 O.12;TAB(192)
 3005 P."             "
 3010 P."              "
 3015 P."             "
 3020 P."               "
 3025 P.
 3030 P."             "
 3035 P."         "
 3036 P."          "
 3037 P."           "
 3038 TAB(96)
 3039 P."   "
 3040 P."         "
 3045 P." 8    "
 3050 P."    8      \"
 3055 P."  I          "
 3060 P."  I  Marlboro  "
 3065 P."    "
 3070 P.""
 3075 P.""
 3080 POKEHEX(EF60),32
 3100 GOTO1000
10000 W=HEX(3E00)
10010 POKEW,HEX(CD)
10020 POKEW+1,HEX(30)
10030 POKEW+2,HEX(F1)
10040 POKEW+3,HEX(32)
10050 POKEW+4,HEX(10)
10060 POKEW+5,HEX(3E)
10070 POKEW+6,HEX(C9)
10080 RETURN