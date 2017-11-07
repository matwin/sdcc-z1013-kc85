Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

   10 O.12
   12 TAB(128)
   20 P."ooo ooo o o ooo o   o   ooo"
   22 P."o o  o  o o o   o   o   o o"
   24 P."o o  o  ooo oo  o   o   o o"
   26 P."o o  o  o o o   o   o   o o"
   28 P."ooo  o  o o ooo ooo ooo ooo"
   30 TAB(96)
   32 P."EIN STRATEGIESPIEL"
   50 POKEHEX(EDA0),32
  200 FORF=0TO2000;NEXTF
  500 FORF=1TO2000;NEXTF
 1000 O.12
 1010 TAB(256)
 1020 P."OTHELLO spielt man auf einem 8x8"
 1030 P."Felder grossem Spielbrett."
 1031 GOS.8000
 1033 F.F=1TO6000;N.F
 1034 O.12
 1050 P."Jeder erhaelt Spielsteine einer "
 1060 P."Farbe."
 1100 P.;P.
 1110 P."Abwechselnd wird so gesetzt,    "
 1120 P."dass sich Reihen ergeben, die   "
 1130 P."gegnerische Steine einschlies-  "
 1140 P."sen. Diese wandeln sich in eige-"
 1150 P."ne um. Mit jedem Satz muss man  "
 1160 P."mindestens einen Stein des Geg- "
 1170 P."ners schlagen."
 1180 P.
 1190 P."Kann oder will man nicht setzen,"
 1200 P."darf man aussetzen. Eingabe 0.  "
 1210 P.
 1220 P."Die Position wird als zweistel- "
 1231 P."lige Zahl (Zeile/Spalte) einge- "
 1233 P."geben."
 3000 P.;P."Alles klar ?                Ent"
 3111 F=INCHAR
 3200 O.12;TAB(96)
 3210 P."Sieger ist, wer die meisten     Steine placieren kann oder er-  re⇘
      icht, dass der Gegner keinen"
 3220 P."Stein mehr hat."
 3225 GOS.8000
 3230 F.F=1TO8000
 3240 NEXT F
 3300 P.;P.
 3310 P."Die Zeit, die der Rechner fuer  Kontrolle, Darstellung und eige-ne⇘
       Ueberlegungen benoetigt, "
 3321 P."sollte man fuer eigene strategi-sche Ueberlegungen nutzen."
 3325 GOS.8000
 3333 F.F=1TO13000;N.F
 4500 O.12
 4940 P."Soll ich stark spielen (J/N) ?  "
 4960 E=0
 4970 F=INCHAR
 4980 IFF='N'GOTO5010
 5000 E=2
 5010 B=-1
 5011 P.
 5012 P."Soll ich vor meinem Zug warten ?"
 5013 P."(J/N) ",;F=INCHAR
 5014 X=0
 5015 IFF='J'X=1
 5016 P.;P.;P.
 5017 P."Einen Moment bitte...";P.
 5018 GOS.8000
 5020 W=1
 5030 @(50)=201
 5040 @(51)=46
 5050 @(52)=138
 5060 @(1)=0;@(2)=-1;@(3)=-1
 5062 @(4)=-1;@(5)=0;@(6)=1
 5064 @(7)=1;@(8)=1
 5100 @(9)=1;@(10)=1;@(11)=0
 5110 @(12)=-1;@(13)=-1;@(14)=-1
 5120 @(15)=0;@(16)=1
 5190 FORI=111TO210
 5200 @(I)=0
 5210 NEXTI
 5240 @(155)=W
 5250 @(166)=W
 5260 @(156)=B
 5270 @(165)=B
 5280 D=2
 5290 U=2
 5300 N=4
 5310 Z=0
 5330 P.
 5340 P."Schwarz oder Weiss (S/W) ?"
 5345 P.
 5350 C=B
 5360 H=W
 5370 F=INCHAR
 5380 IFF='W'GOTO5420
 5390 IFF#'S'GOTO5370
 5400 C=W
 5410 H=B
 5420 P.
 5430 P."Willst Du anfangen (J/N) ?"
 5440 P.
 5460 F=INCHAR
 5465 O.12;TAB(96)
 5466 GOSUB7710
 5470 IFF='N'GOTO5550
 5480 IFF#'J'GOTO5430
 5510 GOTO6260
 5550 M=-1
 5555 P." Ich ueberlege...";P.
 5556 POKEHEX(EF00),32
 5560 O=0
 5570 P=0
 5580 Q=C
 5590 V=H
 5620 FORI=2TO9
 5630 FORJ=2TO9
 5640 IF@(I*10+J+100)#0GOTO5950
 5670 GOSUB7280
 5680 IFL=0GOTO5950
 5720 G=-1
 5730 GOSUB7410
 5750 IFA=0GOTO5950
 5760 IF(I-2)*(J-9)#0GOTO5780
 5770 A=A+E
 5780 IF(J-2)*(I-9)#0GOTO5810
 5790 A=A+E
 5810 IFA<MGOTO5950
 5820 IFA>MGOTO5910
 5890 IFRND(500)>250GOTO5950
 5910 M=A
 5920 O=I
 5930 P=J
 5950 NEXTJ
 5960 NEXTI
 5980 IFM>0GOTO6050
 6000 P."Ich setze einen Zug aus."
 6001 P.
 6010 IFZ=1GOTO6830
 6020 Z=1
 6030 GOTO6260
 6050 Z=0
 6060 P."Ich setze auf ",#1,O-1,#1,P-1,"."
 6100 I=O
 6110 J=P
 6120 G=1
 6130 GOSUB7410
 6140 D=D+A+1
 6150 U=U-A
 6160 N=N+1
 6170 P.;P."Du verlierst ",#1,A,"."
 6171 GOTO6180
 6172 IFX=1P.;P."                           Ent",;R=INCHAR
 6175 GOTO6210
 6180 IFA<4GOTO6200
 6182 IFA<6P.;P."Prima !";GOTO6200
 6184 IFA<8P.;P."Das ist mir gelungen !";GOTO6200
 6186 IFA<10P.;P."Was sagste nu' ?";GOTO6200
 6188 IFA>9P."A U S G E T R I C K S T !!!"
 6200 GOTO6172
 6210 GOSUB7710
 6230 IFU=0GOTO6830
 6240 IFN=64GOTO6830
 6260 Q=H
 6270 V=C
 6280 P."Dein Zug (Zeile/Spalte)",
 6290 INPUT""F
 6292 IFF<10GOTO6294
 6293 GOTO6296
 6294 IFF#0GOTO6280
 6296 I=F/10
 6298 F=F-F/10*10
 6300 IFI<0GOTO6280
 6310 IFI>8GOTO6280
 6320 IFI#0GOTO6390
 6333 P.
 6360 IFZ=1GOTO6830
 6370 Z=1
 6380 GOTO5550
 6390 IFF<0GOTO6280
 6400 IFF>8GOTO6280
 6440 J=F
 6450 I=I+1
 6460 J=J+1
 6470 IF@(I*10+J+100)=0GOTO6520
 6480 P."Dieser Platz ist besetzt!"
 6500 GOTO6280
 6520 GOSUB7280
 6530 IFL=1GOTO6590
 6540 P."Das ist nicht erlaubt."
 6570 GOTO6280
 6590 G=-1
 6600 GOSUB7410
 6610 IFA>0GOTO6670
 6620 P."Das bildet keine Reihe."
 6640 GOTO6280
 6670 Z=0
 6680 P.;P." Ich verliere ",#1,A,"."
 6685 IFA<4GOTO6715
 6690 IFA<6P.;P."Verflixt !";GOTO6715
 6695 IFA<8P.;P."Um Himmels Willen !";GOTO6715
 6697 IFA<10P.;P."Verdammt !";GOTO6715
 6710 IFA>9P.;P."SCHEISSE",;FORR=0TO511;NEXTR;FORR=1TO8;O.8;NEXTR;
      P."Scheibenkleister"
 6715 G=1
 6720 GOSUB7410
 6730 U=U+A+1
 6740 D=D-A
 6750 N=N+1
 6770 GOSUB7710
 6790 IFD=0GOTO6830
 6800 IFN=64GOTO6830
 6810 GOTO5550
 6830 P.
 6840 IFU>DP."Du hast gewonnen.";P.
 6842 IFU<DP."Ich habe gewonnen.";P.
 6844 IFU=DP."Unentschieden.";P.
 6846 U=ABS(U-D)
 6847 U=U*64/N
 6850 IFU<3P."Ein knapper Sieg.";GOTO7000
 6855 IFU<6P."Ein grosser Kampf.";GOTO7000
 6860 IFU<15P."Ein heisses Spiel.";GOTO7000
 6865 IFU<28P."Ein ueberlegener Sieg.";GOTO7000
 6870 IFU<35P."Saubere Arbeit.";GOTO7000
 6888 P."Ein perfektes Spiel."
 7000 P.
 7010 P."Noch ein Spiel (J/N) ?",
 7020 F=INCHAR
 7030 IFF='J'GOTO4500
 7040 O.12
 7210 STOP
 7280 L=0
 7290 FORB=-1TO1
 7300 FORW=-1TO1
 7310 IF@((I+B)*10+J+W+100)=VL=1
 7330 NEXTW
 7340 NEXTB
 7360 RETURN
 7410 A=0
 7420 FORK=1TO8
 7430 @(20)=@(K)
 7440 @(22)=@(K+8)
 7450 @(21)=I+@(20)
 7460 @(23)=J+@(22)
 7470 @(24)=0
 7480 IF@(@(21)*10+@(23)+100)#VGOTO7660
 7500 @(24)=@(24)+1
 7510 @(21)=@(21)+@(20)
 7520 @(23)=@(23)+@(22)
 7530 IF@(@(21)*10+@(23)+100)=QGOTO7560
 7540 IF@(@(21)*10+@(23)+100)=0GOTO7660
 7550 GOTO7500
 7560 A=A+@(24)
 7570 IFG#1GOTO7660
 7590 @(21)=I
 7600 @(23)=J
 7610 FORB=0TO@(24)
 7620 @(@(21)*10+@(23)+100)=Q
 7630 @(21)=@(21)+@(20)
 7640 @(23)=@(23)+@(22)
 7650 NEXTB
 7660 NEXTK
 7670 RETURN
 7710 POKEHEX(2B),0
 7711 POKEHEX(2C),HEX(EC)
 7712 P.;P.
 7720 P."   1 2 3 4 5 6 7 8"
 7721 P.
 7730 FORI=2TO9
 7740 P.#2,I-1,
 7750 FORJ=2TO9
 7760 P." ",
 7770 O.@(51+@(I*10+J+100))
 7780 NEXTJ
 7782 IFI=4P."    ",#1,U," : ",#1,D,
 7783 IFI=6P."  Zug : ",#1,N-3,
 7790 P.;P.
 7810 NEXTI
 7830 P.;P.;P.;P.;P.;P.;P.;P.;P.
 7833 P.;P.
 7840 POKEHEX(2B),HEX(C0)
 7850 POKEHEX(2C),HEX(EE)
 7855 POKEHEX(EFE0),32
 7900 RETURN
 8000 POKE(PEEK(HEX(2B))-((256-PEEK(HEX(2C)))*256)),32;RET.