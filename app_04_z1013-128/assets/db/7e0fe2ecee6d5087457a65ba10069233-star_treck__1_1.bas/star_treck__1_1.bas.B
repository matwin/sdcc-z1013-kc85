Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

    1 GOSUB 0 9800
   10 WINDOW:CLS
   30 PRINT AT(2,0);"STERNTAG CONDITION:  TAGE "
   40 PRINT AT(3,0);"                          "
   50 PRINT AT(4,1);"      "
   90 PRINT AT(5,1);"SC      "
  100 PRINT AT(6,1);"EN      "
  110 PRINT AT(7,1);"TORP.   "
  120 PRINT AT(8,1);"KLING   "
  130 PRINT AT(9,1);"BASIS   "
  150 PRINT AT(6,11);""
  160 PRINT AT(5,11);" STERNBILD:        "
  174 PRINT AT(14,18);"ZENTRAL-"
  176 PRINT AT(16,18);"PROJEKTIONS-"
  178 PRINT AT(18,18);"SCHIRM"
  180 PRINT AT(7,11);""
  190 FOR I=8 TO 26:PRINT AT(I,11);"":PRINT AT(I,31);"":NEXT
  250 PRINT AT(27,11);""
  260 PRINT AT(28,12);"QUADRANT          "
  265 PRINT AT(28,11);""
  270 PRINT AT(29,11);"                  "
  280 PRINT AT(30,11);"                  "
  290 PRINT AT(31,11);"                  "
  310 PRINT AT(19,1);"TELEKOM-"
  330 PRINT AT(21,1);" SCHIRM"
  340 PRINT AT(12,0);""
  350 PRINT AT(12,2);"KOMMANDO"
  370 PRINT AT(13,0);""
  410 FOR I=0 TO 10:PRINT AT(14,I);"":PRINT AT(31,I);"":PRINT AT(15+I,0);"":NEXT
  430 FOR I=25 TO 30:PRINT AT(I,0);"":NEXT:GOTO 5000
 1000 L3=1:IF Z5>4 THEN L3=2
 1050 L3=L3+2*Z4-2:RESTORE 5250:FOR I=1 TO L3:READ G2$:NEXT:L3=Z5:IF L3>4 THEN L3=Z5-4
 1180 RETURN
 1300 E=E-N-10:IF E>=0 THEN RETURN
 1330 PRINT:PRINT "SCHIRM-   ENERGIE   FUER AN-  TRIEB  AB-GEZOGEN!":S=S+E:E=0
 1350 IF S<=0 THEN S=0
 1360 RETURN
 1500!
 1520 XY=INT(Z1+0.5)*8+INT(Z2+0.5)-8
 1540 Z$=MID$(Z$,1,XY-1)+A$+MID$(Z$,XY+1)
 1545 IF D(1)<0 THEN RETURN
 1550 IF A$="."THEN 1600
 1560 IF A$=""THEN 1600
 1570 IF A$=""THEN 1600
 1580 RETURN
 1600 PRINT AT(8+2*INT(Z1+0.5),13+2*INT(Z2+0.5));A$
 1610 RETURN
 2000!
 2010 Z1=INT(RND(1)*8+1)
 2020 Z2=INT(RND(1)*8+1)
 2030 A$="."
 2050 GOSUB 2100
 2060 IF Z3=0 THEN 2010
 2070 RETURN
 2100!
 2110 XY=INT(Z1+0.5)*8+INT(Z2+0.5)-8
 2120 Z3=0
 2140 IF MID$(Z$,XY,1)<>A$ THEN RETURN 
 2150 Z3=1:RETURN
 2400!
 2410 RESTORE 5220
 2420 FOR J=0 TO R1
 2430 READ D0$
 2440 NEXT
 2450 RETURN
 2500!
 2510 FOR I=S1-1 TO S1+1
 2520 FOR J=S2-1 TO S2+1
 2530 IF INT(I+0.5)=B4 AND INT(J+0.5)=B5 AND B4<>0 THEN 2630
 2610 NEXT J,I
 2620 D0=0:GOTO 2660
 2630 D0=1:E=3000:P=10
 2635 PRINT AT(3,12);"CONNECTED!
 2640 PRINT:PRINT "DEFLECTOR OFF!
 2650 S=0:GOTO 2710
 2660 IF K3>0 THEN 2690
 2670 IF E<E0*.1 THEN 2700
 2680 PRINT AT(3,14);"GREEN!  ":GOTO 2710
 2690 PRINT AT(3,12);"   RED!   ":GOTO 2710
 2700 PRINT AT(3,14);"YELLOW!"
 2710 WINDOW 9,26,14,29
 2720 IF D(1)>=0 THEN 2768
 2730 CLS:PRINT:PRINT
 2760 PRINT:PRINT "  NAH-SENSOREN"
 2762 PRINT:PRINT "  AUSGEFALLEN!"
 2765 GOTO 2900
 2768 PRINT CHR$(2)
 2770 FOR I=0 TO 7:FOR J=1 TO 8
 2772 PRINT " ";
 2774 A$=MID$(Z$,8*I+J,1)
 2775 IF A$="."THEN 2784
 2776 IF A$=""THEN 2784
 2777 IF A$=""THEN 2784
 2778 IF A$=""AND D0=0 THEN 2784
 2779 IF A$=""AND D0=1 THEN 2784
 2784 PRINT A$;
 2790 NEXT J
 2800 PRINT " ";CHR$(2)
 2810 NEXT I
 2900 PRINT AT(3,2);"      " :PRINT AT(3,2);INT(T+0.5)
 2905 PRINT AT(3,25);"    ":PRINT AT(3,25);INT(((T0-T+T9)*10)+0.5)/10
 2910 PRINT AT(28,20);Q1," - ",Q2
 2915 PRINT AT(5,4);"      ":PRINT AT(5,4);S
 2920 PRINT AT(6,4);"      ":PRINT AT(6,4);INT(E+0.5)
 2925 PRINT AT(7,7);"   ":PRINT AT(7,6);P
 2930 PRINT AT(8,7);"  " :PRINT AT(8,6);K9
 2935 PRINT AT(9,7);B9
 2940 WINDOW 8,8,15,30
 2945 PRINT "1 2 3 4 5 6 7 8";
 2950 WINDOW 10,26,13,13
 2954 PRINT "1 2 3 4 5 6 7 8";
 2990 WINDOW 15,30,1,10
 2994 IF K9<=0 OR T>T0+T9 THEN 3190
 2995 RETURN
 3000!
 3002 IF K3<=0 THEN RETURN
 3004 FOR I=0 TO K3-1
 3006 IF K(I,2)<=0 THEN 3018
 3008 A$=".":Z1=K(I,0):Z2=K(I,1)
 3010 GOSUB 1500
 3012 GOSUB 2000
 3014 A$="":K(I,0)=Z1:K(I,1)=Z2
 3016 GOSUB 1500
 3018 NEXT I
 3020 IF D0<>0 THEN PRINT "STARBASE- DEFLECTOR AKTIV!!":RETURN
 3030 FOR I=0 TO 2
 3040 IF K(I,2)<=0 THEN 3170
 3050 H=INT((K(I,2)/FN D(D))*(2+RND(1)))
 3060 S=S-H
 3075 PRINT "TREFFER-  ENERGIE: ";H
 3080 IF S<0 THEN 3180
 3087 IF H<20 THEN 3170
 3090 IF RND(1)>0.6 THEN 3170
 3100 IF H/S<=0.02 THEN 3170
 3110 D2=H/S+0.5*RND(1)
 3120 R1=INT(RND(1)*8)
 3130 D(R1)=D(R1)-D2
 3150 GOSUB 2400
 3160 PRINT D0$:PRINT "BESCHAE-  DIGT!"
 3170 NEXT I
 3174 PRINT
 3175 RETURN
 3180 PRINT AT(3,9);" ENTERPRISE ZERSTOERT!
 3181 FOR I=1 TO 14
 3182 WINDOW 4+I,5+I,0,31:PRINT STRING$(32,"");
 3183 WINDOW 31-I,32-I,0,31:PRINT STRING$(32,"");
 3184 NEXT
 3190 WINDOW 5,31,0,31:CLS
 3191 FOR I=0 TO 7:FOR J=0 TO 7
 3192 A$=STR$(G(I,J)):A$=RIGHT$(A$,4)
 3193 PRINT SPC(4-LEN(A$))A$;
 3194 NEXT J
 3195 PRINT:PRINT
 3196 NEXT I
 3197 IF K9<=0 THEN 3220
 3200 PRINT "NOCH :";K9;"KLINGONEN - ENDE!";
 3210 INPUT "";A$:GOTO 20000
 3220 PRINT "GLUECKWUNSCH,CAPTIAN!"
 3230 PRINT "IHRE EFFEKTIVITAETSRATE:";((K7/(T-T0))*1000);"!":PAUSE:END
 5000!
 5020 Z$=STRING$(64,".")
 5040 DIM G(7,7),C(8,1),K(2,2),D(7)
 5050 T=INT(RND(1)*20+21)*100
 5060 T0=T:T9=30:D0=0:E0=3000:E=E0:P=10:P0=P:S9=200:S=0:B9=0:K9=0
 5070 DEF FN D(D)=SQR((K(I,0)-S1)^2+(K(I,1)-S2)^2)
 5080!
 5090 Q1=INT(RND(1)*8+1)
 5100 Q2=INT(RND(1)*8+1)
 5110 S1=INT(RND(1)*8+1)
 5120 S2=INT(RND(1)*8+1)
 5160 C(1,0)=-1:C(2,0)=-1:C(3,0)=-1
 5170 C(3,1)=-1:C(4,1)=-1:C(5,1)=-1
 5180 C(0,1)=1:C(1,1)=1:C(5,0)=1:C(6,0)=1:C(7,0)=1:C(7,1)=1:C(8,1)=1
 5220 DATA ANTRIEB  ,NAHSENSOR,F.-SENSOR,PHASER   ,TORPEDO  
 5230 DATA SYSTEM   ,DEFLECTOR,BORDCOMP.,
 5250 DATA ANTARES,SIRIUS,RIGEL,DENEB,PROCYON,CAPELLA,WEGA
 5260 DATA BETEIGEUZE,CANOPUS,ALDEBARAN,ATAIR,REGULUS
 5270 DATA SAGITTARIUS,ARCTURUS,POLLUX,SPICA
 5290!
 5300 FOR I=0 TO 7:FOR J=0 TO 7
 5310 R1=RND(1)
 5320 IF R1>.98 THEN 5360
 5330 IF R1>.95 THEN 5370
 5340 IF R1>.8 THEN 5380
 5350 K3=0:GOTO 5390
 5360 K3=3:K9=K9+3:GOTO 5390
 5370 K3=2:K9=K9+2:GOTO 5390
 5380 K3=1:K9=K9+1
 5390 R1=RND(1)
 5400 IF R1>.95 THEN 5420
 5410 B3=0:GOTO 5430
 5420 B3=1:B9=B9+1
 5430 S3=INT(RND(1)*8+1)
 5440 G(I,J)=K3*100+B3*10+S3
 5450 NEXT:NEXT
 5480 K7=K9
 5490 IF B9<>0 THEN 5550
 5500 I=INT(6*RND(1)+1):J=INT(6*RND(1)+1)
 5510 IF G(I,J)>=200 THEN 5540
 5520 G(I,J)=G(I,J)+100:K9=K9+1
 5540 G(I,J)=G(I,J)+10:B9=1
 5550 IF B9<>1 THEN PRINT AT(9,5);"EN"
 5610!
 5620 Z4=Q1:Z5=Q2:K3=0:B3=0:S3=0
 5630 D4=INT(10*RND(1)+3)/10
 5640 IF Q1<1 OR Q1>8 THEN 5860
 5660 IF Q2<1 OR Q2>8 THEN 5860
 5680 GOSUB 1000
 5700 PRINT AT(6,17) ;STRING$(11," ")
 5710 PRINT AT(6,17);G2$:PRINT AT(6,28);L3
 5740 G(Q1-1,Q2-1)=INT(G(Q1-1,Q2-1)+1000.2)
 5750 X=G(Q1-1,Q2-1)*0.01
 5760 K3=INT(X)
 5770 B3=INT((X-K3)*10.1)
 5780 S3=INT(G(Q1-1,Q2-1)-100*K3-10*B3)
 5790 K3=K3/10:K3=INT((K3-INT(K3))*10.1)
 5830 FOR I=0 TO 2:FOR J=0 TO 1
 5840 K(I,J)=0
 5850 NEXT J,I
 5860 FOR I=0 TO 2
 5870 K(I,2)=0
 5880 NEXT I
 5890 Z$=STRING$(64,".")
 5900!
 5910 A$="
 5920 Z1=S1:Z2=S2
 5930 GOSUB 1500
 5935 IF K3=0 THEN 6005
 5940 FOR I=0 TO K3-1
 5950 GOSUB 2000
 5960 A$=""
 5980 GOSUB 1500
 5990 K(I,0)=Z1:K(I,1)=Z2:K(I,2)=S9
 6000 NEXT I
 6005 IF B3=0 THEN B4=0:B5=0:GOTO 6080
 6010 FOR I=0 TO B3-1
 6020 GOSUB 2000
 6030 A$=""
 6050 GOSUB 1500
 6060 B4=Z1:B5=Z2
 6070 NEXT I
 6080 FOR I=0 TO S3-1
 6090 GOSUB 2000
 6100 A$="*"
 6120 GOSUB 1500
 6130 NEXT I
 6140 GOSUB 2500
 6150 IF S+E<=10 THEN 6180
 6160 IF E>10 OR D(6)>=0 THEN 6200
 6180 PRINT "BLACK OUT!":PAUSE 50
 6190 GOTO 3190
 6200 WINDOW 13,13,1,10:CLS
 6204 GOSUB 9700:EI=ASC(A$)
 6206 WINDOW 15,30,1,10:CLS
 6220 IF EI=75 THEN PRINT AT(13,1);"KURS":GOTO 6400
 6230 IF EI=78 THEN PRINT AT(13,1);"NAHSENSOR":GOTO 6140
 6240 IF EI=70 THEN PRINT AT(13,1);"FERNSENSOR":GOTO 7470
 6250 IF EI=80 THEN PRINT AT(13,1);"PHASER":GOTO 7660
 6260 IF EI=84 THEN PRINT AT(13,1);"TORPEDOS":GOTO 8040
 6270 IF EI=68 THEN PRINT AT(13,1);"DEFLEKTOR":GOTO 8600
 6280 IF EI=66 THEN PRINT AT(13,1);"BORDCOMP.":GOTO 8990
 6290 IF EI=83 THEN PRINT AT(13,1);"SYSTEME":GOTO 8730
 6300 IF EI=65 THEN PRINT AT(13,1);"ABBRUCH":GOTO 3190
 6310 IF EI=13 THEN PRINT AT(13,1);"MENU":GOTO 6330
 6320 GOTO 6200
 6330 PRINT:PRINT "KURS":PRINT:PRINT "NAHSENSOR
 6335 PRINT:PRINT "F.-SENSOR":PRINT:PRINT "PHASER
 6340 PRINT:PRINT "TORPEDOS":PRINT:PRINT "DEFLEKTOR
 6350 PRINT:PRINT "BORDCOMP.":PRINT:PRINT "SYSTEM";
 6370 GOTO 6200
 6400!
 6405 C1=0:W1=0
 6410 INPUT "NEUER KURS(1-9):";C1
 6420 IF C1>=1 AND C1<=9 THEN 6450
 6430 PRINT "SULU:DATENINKOREKT, SIR!
 6440 GOTO 6410
 6450 IF C1=9 THEN C1=1
 6460 INPUT "SCHUB(0-8):";W1 
 6470 IF W1>0 AND W1<=8 THEN 6500
 6480 PRINT "SCOT:'WERTINKOREKT, SIR!'
 6490 GOTO 6150
 6500 IF D(0)>=0 OR W1<=0.2 THEN 6540
 6510 PRINT "ANTRIEBS- SYSTEM BE-SCHAEDIGT,";
 6520 PRINT "MAXIMAL-  SCHUB=0.2
 6530 GOTO 6410
 6540 N=INT(W1*8+0.5)
 6550 IF E-N>=0 THEN 6715
 6560 PRINT "SCOT:'FUERSCHUB";W1
 6570 PRINT "ZU WENIG  ENERGIE!'
 6580 IF S<N-E OR D(6)<0 THEN 6150
 6590 PRINT "SCHIRM-   KONTROLLE MELDET:
 6600 PRINT S;"EIN.
 6610 PRINT "SOFORT    VERFUEGBAR!":GOTO 8600
 6715 CLS
 6720 GOSUB 3000
 6730 D1=0:D6=W1
 6740 IF W1>=1 THEN D6=1
 6750!
 6760 FOR R1=0 TO 7
 6770 IF D(R1)>=0 THEN 6840
 6780 D(R1)=D(R1)+D6
 6790 IF D(R1)<0 THEN 6840
 6800 IF D1=1 THEN 6820:ELSE D1=1
 6810 PRINT "SYSTEM-    ZUSTAND:
 6820 GOSUB 2400
 6830 PRINT D0$:PRINT "- O.K.!
 6840 NEXT R1
 6850!
 6860 IF RND(1)>0.2 THEN 6970
 6870 R1=INT(RND(1)*8)
 6880 IF RND(1)>=0.6 THEN 6940
 6890 D(R1)=D(R1)-(RND(1)*5+1)
 6910 GOSUB 2400
 6920 PRINT D0$:PRINT "VERSCHLE- CHTERT!
 6930 GOTO 6970
 6940 D(R1)=D(R1)+(RND(1)*3+1)
 6950 GOSUB 2400
 6960 PRINT D0$:PRINT "VERBESSERT!
 6970!
 6980 Z1=S1:Z2=S2:A$="."
 7000 X1=C(C1-1,0)+(C(C1,0)-C(C1-1,0))*(C1-INT(C1))
 7010 X2=C(C1-1,1)+(C(C1,1)-C(C1-1,1))*(C1-INT(C1))
 7020 X=S1:Y=S2
 7030 FOR I=1 TO N
 7040 S1=S1+X1:S2=S2+X2
 7050 IF S1<1 OR S1>=8.5 THEN 7240
 7060 IF S2<1 OR S2>=8.5 THEN 7240
 7070 Z1=S1:Z2=S2:A$="."
 7080 GOSUB 2100
 7090 IF Z3=1 THEN 7135
 7100 S1=S1-X1:S2=S2-X2
 7110 PRINT:PRINT "NAVIGA-   TIONS --  FEHLER!
 7120 PRINT "ANTRIEB   STOP!
 7130 GOTO 7170
 7135 A$="":GOSUB 1500
 7136 Z1=S1-X1:Z2=S2-X2:A$="."
 7137 GOSUB 1500
 7140 NEXT I
 7170 GOSUB 1300
 7180 IF W1>=1 THEN T8=1:GOTO 7200
 7190 T8=INT(10*W1)/10
 7200 T=T+T8
 7210 S1=INT(S1+0.5):S2=INT(S2+0.5)
 7230 GOTO 6140
 7240!
 7241 FOR I=0 TO 6 STEP 2:FOR J=0 TO 6 STEP 2
 7242 PRINT AT(10+I,15+J);"":PRINT AT(10+I,29-J);"
 7243 PRINT AT(24-I,15+J);"":PRINT AT(24-I,29-J) ;"
 7244 NEXT J,I 
 7245 PRINT AT(29,13);STRING$(16," ")
 7246 PRINT AT(30,13);STRING$(16," ")
 7247 PRINT AT(31,13);STRING$(16," ")
 7250 X=8*Q1+X+N*X1
 7260 Y=8*Q2+Y+N*X2
 7270 Q1=INT(X/8)
 7280 Q2=INT(Y/8)
 7290 S1=INT(X-Q1*8+0.5)
 7300 S2=INT(Y-Q2*8+0.5)
 7305 X5=0
 7310 IF S1=0 THEN Q1=Q1-1:S1=8
 7320 IF S2=0 THEN Q2=Q2-1:S2=8
 7330 IF Q1<1 THEN Q1=1:S1=1:X5=1
 7340 IF Q1>8 THEN Q1=8:S1=8:X5=1
 7350 IF Q2<1 THEN Q2=1:S2=1:X5=1
 7360 IF Q2>8 THEN Q2=8:S2=8:X5=1
 7370 IF X5=0 THEN 7430
 7380 PRINT AT(10,14) ;"LTN.UHURA MELDET
 7385 PRINT AT(12,14) ;"'KEINE ERLAUBNIS
 7390 PRINT AT(14,14);"FUER UEBERSCHREI
 7393 PRINT AT(16,14) ;"TUNG D.GALACTIC-
 7396 PRINT AT(18,14) ;"GRENZEN, SIR!'  
 7398 PRINT AT(20,14) ;STRING$(16,"")
 7400 PRINT AT(22,14) ;"SCOT MELDET:    
 7410 PRINT AT(24,14) ;"'MASCHINEN STOP'
 7430 T=T+1
 7450 GOSUB 1300
 7460 GOTO 5620
 7470!
 7480 IF D(2)>=0 THEN 7510
 7490 PRINT "F.-SENSOR AUSGE-    FALLEN!
 7500 GOTO 6150
 7510 PRINT:PRINT "STRUKTUR:":PRINT "ZKBS":PRINT "---------";
 7513 PRINT:PRINT "ZUGRIFFE
 7514 PRINT:PRINT "KLINGONEN
 7515 PRINT:PRINT "STARBASE
 7516 PRINT:PRINT "STARS
 7520 WINDOW 29,31,12,30
 7530 FOR I=Q1-1 TO Q1+1:FOR J=Q2-1 TO Q2+1
 7570 IF I<1 OR I>8 OR J<1 OR J>8 THEN PRINT "      ";:GOTO 7600
 7574 IF G(I-1,J-1)>1000 THEN 7580
 7575 G(I-1,J-1)=INT(G(I-1,J-1)+1000.1)
 7580 PRINT G(I-1,J-1);
 7600 NEXT J
 7610 IF I<Q1+1 THEN PRINT
 7620 NEXT I
 7650 GOTO 6150
 7660!
 7670 IF K3>0 THEN 7700
 7680 PRINT "SPOCK MEL-DET:      'LAUT SEN-SOR KEINE KLINGONEN!'
 7690 GOTO 6150
 7700 IF D(3)>=0 THEN 7730
 7710 PRINT "PHASER DE-FEKT!
 7720 GOTO 6150
 7730 IF D(7)>=0 THEN 7780
 7740 PRINT "COMPUTER- STOERUNGBEEINFLUSST PHASER-   STEUERUNG!
 7780 INPUT "PHASER-   LEISTUNG  :";X
 7790 IF X<=0 THEN 6150
 7800 IF E-X<=0 THEN 7780
 7805 E=E-X
 7810 GOSUB 3000
 7820 IF D(7)<0 THEN X=X/(RND(1)/2+1)
 7825 H1=INT(X/K3+0.5)
 7830 FOR I=0 TO 2
 7840 IF K(I,2)<=0 THEN 8020
 7841 Q4=188-K(I,0)*16:Q5=156+K(I,1)*16
 7842 PRINT "Z:";K(I,0);"/";K(I,1)
 7850 H=INT((H1/FN D(D))*(RND(1)+2))
 7860 IF H>0.15*K(I,2)THEN 7890
 7870 PRINT "TREFFERWIRKUNG=0!
 7880 GOTO 8020
 7890 K(I,2)=K(I,2)-H
 7920 IF K(I,2)<=0 THEN 7950
 7930 PRINT "SENSOR-   MELDUNG:  RESTENRG.:";K(I,2)
 7940 GOTO 8020
 7950 PRINT "KLINGONE  ZERSTOERT!
 7960 K3=K3-1:K9=K9-1
 7980 G(Q1-1,Q2-1)=G(Q1-1,Q2-1)-100
 7990 A$=".":Z1=K(I,0):Z2=K(I,1)
 8000 GOSUB 1500
 8010 IF K9<=0 THEN 6140
 8020 NEXT I
 8030 GOTO 6140
 8040!
 8050 IF D(4)>=0 THEN 8080
 8060 PRINT "TORPEDO-  BLOCK AUS- GEFALLEN!
 8070 GOTO 6150
 8080 IF P>0 THEN 8110
 8090 PRINT "ALLE TOR- PEDOS ABGEFEUERT
 8100 GOTO 6150
 8110 C1=0:PRINT "TORPEDO-":INPUT "KURS:";C1
 8120 IF C1>=1 AND C1<=9 THEN 8145
 8130 PRINT "CHEKOV:IN-KORREKTE  DATEN,SIR
 8140 GOTO 6150
 8145 W1=0:E=E-2:P=P-1:PRINT "TORPEDO   AUF KURS"
 8150 IF C1=9 THEN C1=1
 8160 X1=C(C1-1,0)+(C(C1,0)-C(C1-1,0))*(C1-INT(C1))
 8170 X2=C(C1-1,1)+(C(C1,1)-C(C1-1,1))*(C1-INT(C1))
 8180 X=S1:Y=S2
 8200 X=X+X1:Y=Y+X2
 8210 X3=INT(X+0.5):Y3=INT(Y+0.5)
 8220 IF X3<1 OR X3>=9 OR Y3<1 OR Y3>=9 THEN 8570
 8225 IF W1<>0 THEN 8240
 8230 PRINT AT(8+2*X3,13+2*Y3);"
 8240 A$=".":Z1=X:Z2=Y
 8250 GOSUB 2100
 8260 IF Z3<>0 THEN PRINT AT(8+2*X3,13+2*Y3);"":GOTO 8200
 8270 A$=""
 8280 GOSUB 2100
 8290 IF Z3=0 THEN 8380
 8295 IF W1<>0 THEN 9540
 8300 PRINT "KLINGONE  ANNIHI-   LIERT!
 8310 K3=K3-1:K9=K9-1
 8340 FOR I=0 TO 2
 8350 IF X3=K(I,0)AND Y3=K(I,1)THEN K(I,2)=0
 8360 NEXT I
 8370 GOTO 8530
 8380 A$="*"
 8390 GOSUB 2100
 8400 IF Z3=0 THEN 8430
 8405 PRINT AT(8+2*X3,13+2*Y3);"*
 8407 IF W1<>0 THEN 9560
 8410 PRINT "STERN IM  SEKTOR:   ";X3;"/";Y3;"AB- SORBIERTE TORPEDO!"
 8420 GOTO 8580
 8430 A$=""
 8440 GOSUB 2100
 8450 IF Z3=0 THEN D3=1:GOTO 8260
 8455 IF W1<>0 THEN 9560
 8460 PRINT "STARBASE ANNIHI-LIERT!"
 8470 B3=B3-1:B9=B9-1
 8480 IF B9>0 THEN 8510
 8490 PRINT "DAS WARS! IHNEN WIRD D. KOMMANDO ENTZOGEN!":PAUSE 60
 8500 GOTO 3190
 8510 PRINT "DAS STERNFLOTTEN-KOMMANDO ERWAR-TET AUSWERTUNG!"
 8520 D0=0
 8530 X3=188-X3*16:Y3=156+Y3*16
 8531 FOR I=3 TO 10
 8533 NEXT I
 8535 FOR I=4 TO 10
 8537 NEXT I
 8538 A$="."
 8540 GOSUB 1500
 8550 G(Q1-1,Q2-1)=K3*100+B3*10+S3
 8560 GOTO 8580
 8570 PRINT "TORPEDO   AUSSER    KONTROLLE!
 8580 GOSUB 3000
 8590 GOTO 6140
 8600!
 8610 IF D(6)>=0 AND D0=0 THEN 8640
 8620 PRINT "DEFLECTOR UNVERAEN- DERBAR!
 8630 GOTO 6150
 8640 PRINT "VORHANDEN.ENERGIE":PRINT ":";E+S:PRINT
 8650 INPUT "NEUER WERT:";X
 8660 IF X>=0 AND S<>X THEN 8690
 8670 PRINT "DEFLECTOR UNVERAEN- DERT!
 8680 GOTO 6150
 8690 IF E+S-X<0 THEN 8640
 8700 E=E+S-X:S=X
 8710 GOSUB 2900
 8720 IF A$="K"THEN 6715:ELSE GOTO 6150
 8730!
 8740 D3=0
 8750 FOR I=0 TO 7
 8760 IF D(I)<0 THEN D3=D3+0.1
 8770 NEXT I
 8780 IF D0=1 OR D(5)>=0 THEN 8820
 8790 PRINT "SYSTEM    UNMOEGLICH
 8800 IF D3>0 THEN PRINT "INSTANDSETZUNGSARBEITEN NOETIG!
 8810 GOTO 6150
 8820 IF D3=0 THEN 8970
 8830 PRINT AT(13,1);"SYSTEME
 8840 FOR R1=0 TO 7
 8850 GOSUB 2400
 8860 PRINT D0$:PRINT ":";100+INT(100*D(R1))/10;"%";
 8865 IF R1<7 THEN PRINT
 8870 NEXT R1
 8875 GOSUB 9700:PRINT:PRINT
 8880 D3=D3+D4 :IF D0=0 THEN D3=D3+2+INT(40*RND(1))/10
 8890 IF D3>=1 AND D0=1 THEN D3=0.9
 8900 PRINT "ZEITAUF-  WAND:";D3;"TAGE!
 8910 INPUT "ARBEITEN  AUSFUEHREN(Y/N):";A$
 8920 IF A$<>"Y"THEN 6150
 8930 FOR I=0 TO 7
 8940 IF D(I)<0 THEN D(I)=0:GOTO 8950
 8945 IF D(I)>1 THEN D(I)=1
 8950 NEXT I
 8960 T=T+D3
 8970 PRINT "SYSTEME OK"
 8975 GOSUB 2900
 8980 GOTO 6150
 8990!
 9000 IF D(7)>=0 THEN I=3:GOTO 9030
 9010 PRINT "SYSTEM OFF-LINE!
 9020 GOTO 6150
 9030 PRINT AT(15,2);" 
 9040 GOSUB 9700:EI=ASC(A$)
 9050 IF EI=75 THEN 9120
 9060 IF EI=84 THEN 9190
 9070 IF EI=82 THEN 9250
 9080 IF EI=71 THEN 9600
 9090 IF EI=65 THEN 6150
 9100 PRINT:PRINT "K: KURS   T: TORPEDO";
 9104 PRINT "R: BASIS  G: GALAK.
 9106 PRINT "A: KEINE     ANFRAGE"
 9110 PAUSE 25:CLS:GOTO 9030
 9120 INPUT "STARTKOOR-DINATEN   (Y,X):" ;C1,A
 9130 IF C1=0 AND A=0 THEN C1=S1:A=S2
 9135 C1=INT(C1):A=INT(A)
 9140 IF C1<1 OR C1>8 OR A<1 OR A>8 THEN 9120
 9150 INPUT "ENDKOOR-  DINATEN   (Y,X):";W1,X
 9160 W1=INT(W1):X=INT(X)
 9170 IF W1<1 OR W1>8 OR X<1 OR X>8 THEN 9150
 9180 GOTO 9320
 9190 IF K3<1 OR D(4)<0 OR P<1 THEN PRINT "KOMMANDO  NICHT SINNVOLL":GOTO 6150
 9200 FOR I=0 TO 2
 9210 IF K(I,2)<=0 THEN 9570
 9220 W1=K(I,0):X=K(I,1)
 9230 PRINT "Z:";W1;"/";X
 9240 GOTO 9280
 9250 IF B3=1 THEN 9270
 9260 PRINT "KEINE RAUMBASIS":GOTO 6150
 9270 W1=B4:X=B5
 9280 C1=S1:A=S2
 9320 X=X-A:A=C1-W1
 9330 IF X<=0 THEN 9440
 9340 IF A<0 THEN C1=7:GOTO 9470
 9350 IF X>0 THEN 9370
 9360 IF A=0 THEN 9460
 9370 C1=1
 9380 IF ABS(A)<=ABS(X)THEN 9420
 9390 C1=C1+(((ABS(A)-ABS(X))+ABS(A))/ABS(A))
 9410 GOTO 9510
 9420 C1=C1+(ABS(A)/ABS(X))
 9430 GOTO 9510
 9440 IF A>0 THEN C1=3:GOTO 9470
 9450 IF X=0 THEN C1=7:GOTO 9470
 9460 C1=5:GOTO 9380
 9470 IF ABS(A)>=ABS(X)THEN 9500
 9480 C1=C1+(((ABS(X)-ABS(A))+ABS(X))/ABS(X))
 9490 GOTO 9510
 9500 C1=C1+(ABS(X)/ABS(A))
 9510 PRINT "K:";C1:PRINT "D:";SQR(X*X+A*A)/10
 9520 IF I=3 THEN 6150
 9530 GOTO 8150
 9540 INPUT "PHOTONEN- TORPEDO   AKTIVIEREN(Y/N):";A$
 9550 IF A$="Y"THEN 8145:ELSE 9570
 9560 PRINT "WERFER    BLOCKIERT
 9570 NEXT I
 9580 GOTO 6150
 9600 W1=14:FOR I=0 TO 7
 9610 WINDOW 9,26,W1+2*I,W1+2*I+1
 9620 FOR J=0 TO 7
 9630 IF C1=0 THEN C1=1:GOTO 9650
 9640 C1=0
 9650 IF G(J,I)>1000 THEN A$=RIGHT$(STR$(G(J,I)),4):ELSE A$="    "
 9660 PRINT A$;
 9665 IF J=3 THEN PRINT
 9670 NEXT J
 9673 IF C1=0 THEN C1=1:ELSE C1=0
 9675 IF I=3 THEN W1=W1+1
 9676 NEXT I
 9680 GOSUB 9700
 9690 WINDOW 9,25,14,30:CLS:GOSUB 2500:GOTO 6150
 9700 A$=INKEY$:IF A$=""THEN 9700:ELSE RETURN
 9710 PRINT," ":PRINT,"   ":PRINT," ":PRINT," 
 9730 RETURN
 9800 WINDOW:CLS:PRINT STRING$(33,"");TAB(63);"         ";
 9810 PRINT "                           ";
 9820 PRINT "                                    ";
 9830 PRINT "                                  ";
 9840 PRINT "                                ";
 9850 PRINT "       ";SPC(30)"";SPC(30)"    ";
 9860 PRINT "                     ";
 9870 PRINT "                              ";
 9880 PRINT "                             ";
 9890 PRINT "                        ";
 9900 PRINT "   ";SPC(30)"       press on a key !!!     ";SPC(30);
 9910 PRINT STRING$(34,"");SPC(30)"   emulated by BETASOFT '89   ";SPC(30)"";
 9920 PRINT AT(31,0);STRING$(32,""):GOSUB 9700
10000 CLS:RESTORE 13000:PRINT:PRINT:PRINT:PRINT:PRINT:FOR I=-5120 TO-4961:READ X:POKE I,X:NEXT
10002 WINDOW 5,31,0,31:A$=STRING$(32,""):FOR I=5 TO 31:PRINT AT(I,0);A$:NEXT
10005 WINDOW 6,30,1,30:PRINT AT(5,0);"":CLS
10010 WINDOW 7,30,2,30:PRINT "EIN SPANNENDES WELTRAUMSPIEL":PRINT STRING$(28,"=")
10090 PRINT:PRINT "WEAHREND EINES FESTGELEGTEN":PRINT "ZEITRAUMES{TAGE}SOLLEN";
10100 PRINT " FREMDERAUMSCHIFFE(KLINGONEN)AUS DERGALAXIS VERTRIEBEN WERDEN.DIE";
10120 PRINT "GALAXIS BESTEHT AUS 64 QUA-":PRINT "DRANTEN. DER QUADRANT,IN DEM SIE";
10140 PRINT " SICH MIT DEM RAUMSCHIFF":PRINT "'ENTERPRISE' MOMENTAN BEFIN-"
10150 PRINT "DEN,WIRD AUF DEM PROJEKTIONS-SCHIRM DARGESTELLT.DER KURS"
10170 PRINT "IST ENTGEGN DEM UHRZEIGERSINN(=1,";CHR$(157);"=3,...USW.)EINZUTRAGEN";
10180 PRINT ".BEI BETAETIGEN DER'ENTER'TAS-TE WIRD EINE AUFLISTUNG DER  SCHIFFS";
10200 PRINT "SYSTEME GEZEIGT,MIT":PRINT "DEREN ANFANGSBUCHSTABEN DIE"
10210 PRINT "EINZELNEN KOMPLEXE AKTIVIERT WERDEN KOENNEN.":PRINT:PRINT TAB(16)"ACTION
10300 DATA 220,214,221
10310 POKE-4158,32:GOSUB 9700
10500 WINDOW:CLS:A$=STRING$(64,""):FOR I=1 TO 4:PRINT A$;:NEXT:FOR I=24 TO 30:PRINT AT(I,0);A$
10520 NEXT:WINDOW 8,24,0,31:POKE-4864,32:FOR I=1 TO 40:Z=15*RND(1)+8:S=32*RND(1)
10580 PRINT AT(Z,S);".":NEXT:PRINT AT(10,27);"":PRINT AT(11,27);""         
10594 PRINT AT(17,4);"   "  
10596 PRINT AT(18,7);" "
10598 PRINT AT(19,8);"  "
10600 PRINT AT(20,7);"
10640 FOR I=1 TO 14
10642 WINDOW 17,20,3+I,16+I:CLS  
10644 PRINT AT(17,4+I);"   "
10646 PRINT AT(18,7+I);" "
10648 PRINT AT(19,8+I);"  "
10650 PRINT AT(20,7+I);""
10651 PAUSE 1:NEXT:PAUSE 10:WINDOW 17,20,18,31:CLS:POKE-4558,32
10660 FOR I=1 TO 8 
10664 PRINT AT(22-I,2*I);""
10666 PRINT AT(22-I,2*I);" 
10668 PAUSE 1:NEXT
10670 FOR I=1 TO 6
10680 PRINT AT(14-I,17+2*I);"":PAUSE 2
10690 PRINT AT(14-I,17+2*I);" "
10700 NEXT
10850 RETURN
13000 DATA 183,183,183,178,32,32,179,183,183,183,178,183,183,179,183,183,183
13010 DATA 178,183,183,179,183,183,183,178,32,183,183,32,183,183,183
13020 DATA 180,178,177,181,187,32,180,176,161,177,181,32,179,176,180,32,181,181
13030 DATA 32,32,180,180,32,181,181,181,180,177,176,180,178,177
13040 DATA 188,189,32,181,181,179,180,32,161,32,181,182,180,32,255,182,182,181
13050 DATA 182,182,176,255,182,182,181,32,182,187,32,188,189,32
13060 DATA 180,32,178,181,32,189,180,32,161,32,181,32,32,179,180,184,32,181,32
13070 DATA 32,32,180,184,32,181,178,179,181,180,180,32,178,182,182,182,177,32,32
13080 DATA 176,32,182,32,177,182,182,176,176,32,182,177,32,32,32,176,32,182,177
13090 DATA 32,182,182,32,182,182,182
20000 WINDOW:CLS:A$(2)="                       
20005 A$(0)=STRING$(33," ")+"          
20010 A$(3)="                        
20015 A$(1)=STRING$(32," ")+"        
20020 A$(4)="                        
20030 A$(5)="                           
20040 A$(6)="            
20050 A$(7)="            
20060 A$(8)="                                     
20070 A$(9)="                                         
20080 FOR I=55 TO 1 STEP-1:FOR J=0 TO 9:PRINT AT(J+9,0);MID$(A$(J),I,32):NEXT:NEXT
20090 PRINT TAB(23)"":PRINT "      ":PRINT "        
20100 PRINT "     ":PRINT "     ":GOSUB 9700
20110 IF A$="J"OR A$="Y"THEN GOSUB 9710:PAUSE 14:RUN 10
20120 PRINT,"  ":PRINT," ":PRINT," ":PRINT," ":PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT:PRINT
20130 PRINT:PRINT "        ";:PRINT "                
20140 PRINT "               ":PRINT "             
20150 PRINT "                 ":PRINT "       
20160 PAUSE
