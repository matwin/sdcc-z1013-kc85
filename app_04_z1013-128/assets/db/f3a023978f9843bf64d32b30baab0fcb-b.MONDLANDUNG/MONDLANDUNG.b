Zeichensatz UTF-8+Z1013()-CTRL()-ohne Umlaute(äöüß)

    1 GOTO 10
    2 FOR I=0 TO 50
    3 PO.(W+1),(207+RND(15));IF W>HEX(EFDF)GOTO 7
    4 PO.(W+32),(207+RND(15))
    5 PO.(W+33),(207+RND(15))
    6 PO.(W+34),(207+RND(15))
    7 NEXT I
    8 RETURN
   10 O.12
   12 TAB(160)
   14 P."     M O N D L A N D U N G"
   15 GOSUB 3000;POKEV,32
   16 W=HEX(EEAE)
   17 GOSUB 1000
   20 FORI=(HEX(EC00))TOHEX(EC1F)
   30 POKE I,175
   40 NEXT I
   50 FORI=(HEX(EC1F))TOHEX(EFFF)STEP 32
   60 POKE I,175
   70 NEXT I
   80 FORI=(HEX(EFFF))TOHEX(EFE0)STEP-1
   90 POKE I,175
  100 NEXT I
  110 FORI=(HEX(EFE0))TOHEX(EC00)STEP-32
  120 POKE I,175
  130 NEXT I
  140 GOSUB 2
  150 O.12;TAB(96)
  160 P."Du musst mit Deiner Landefaehre";P.
  170 P."durch Dosieren von Bremstreib-";P.
  180 P."stoff moeglichst sanft auf dem";P.
  190 P."Mond landen !";P.
  195 P."Alle wichtigen Daten werden Dir";P.
  196 P."angezeigt."
  197 GOSUB 3000;POKE V,32
  198 GOSUB 1000;GOSUB 2
  199 GOTO 1800
  200 O.12
  201 GOSUB 3000
  202 POKE V,32
  210 W=HEX(EEC0)
  220 POKE(W+4),174
  221 POKE(W+5),220
  222 POKE(W+36),171
  223 POKE(W+37),146
  224 POKE(W+68),157
  225 POKE(W+100),175
  226 POKE(W+128),147
  227 POKE(W+129),145
  228 POKE(W+132),175
  229 POKE(W+133),153
  230 POKE(W+134),154
  231 POKE(W+135),145
  232 POKE(W+161),148
  233 POKE(W+162),157
  234 POKE(W+164),175
  235 POKE(W+165),152
  236 POKE(W+168),150
  237 POKE(W+169),148
  238 POKE(W+170),151
  239 POKE(W+171),149
  240 POKE(W+195),154
  241 POKE(W+196),158
  242 POKE(W+204),154
  243 POKE(W+205),145
  244 POKE(W+238),155
  245 POKE(W+270),152
  246 POKE(W+271),146
  247 POKE(W+272),149
  248 POKE(W+275),146
  249 POKE(W+276),149
  250 POKE(W+277),146
  251 POKE(W+278),149
  252 POKE(W+284),146
  253 POKE(W+285),149
  254 POKE(W+286),146
  255 POKE(W+287),149
  256 POKE(W+302),154
  257 POKE(W+305),150
  258 POKE(W+306),147
  259 POKE(W+307),154
  260 POKE(W+308),154
  261 POKE(W+309),154
  262 POKE(W+310),154
  263 POKE(W+311),173
  264 POKE(W+315),174
  265 POKE(W+316),154
  266 POKE(W+317),154
  267 POKE(W+318),154
  268 POKE(W+319),154
  269 POKE(W+192),128
  270 POKE(W+199),129
  271 POKE(W+200),128
  272 POKE(W+225),140
  273 POKE(W+267),140
  274 POKE(W+289),174
  275 POKE(W+290),173
  276 POKE(W+295),131
  300 IF Q=7 RETURN
  500 S=0
  502 T=275
  504 E=1000
  506 G=100
  508 D=6
  510 X=0;Y=4
  520 GOSUB 2000
  525 @(S)=E
  530 P."Hier die Daten:";P.
  540 P."Zeit     (sec):",#4,S
  550 P."Treibstoff (l):",#4,T
  560 P."Entfernung (m):",#4,E
  570 P."Geschw.  (m/s):",#4,G
  571 P.
  572 GOSUB 3000;POKE V,32
  573 IF E>27 GOTO 581
  574 W=HEX(EFF8)-E*32
  575 IF E=0 GOTO 577
  576 GOSUB 1000;GOTO 580
  577 IF G>10 GOSUB 1400;GOTO 580
  578 GOSUB 1000
  580 IF E<1 GOTO 800
  581 IF N=1 GOTO 600
  582 IF T=0L=0;P."Dein Treibstoff ist alle !"
  584 IF T=0 GOSUB 3000;POKE V,32;GOTO 600
  586 IF N=1 GOTO 600
  590 INPUT"Wieviel Liter "L
  591 X=0;Y=11;GOSUB 2000
  592 IF L>100 GOTO 700
  593 IF L>T GOTO 750
  594 IF L<0 GOTO 770
  600 A=ABS(G*10/25)+1
  601 X=31;Y=13
  602 A=A-X*L/(Y+T/100)
  610 IF D<0 GOTO 640
  612 GOSUB 1200
  640 G=G+A
  642 S=S+1
  644 T=T-L
  646 E=E-G
  651 IF N=1 GOTO 656
  652 IFG<0P.;P."Hast Du Heimweh ?";P."Du fliegst zurueck !";L=0
  654 IF G<0 P."Wir lassen austrudeln!";GOSUB3000;POKEV,32
  656 IF G<0 N=1;GOTO 510
  657 GOSUB 1100
  658 N=0
  660 IF E<1 D=E;E=0
  666 GOTO 510
  700 GOSUB 1100
  710 P."Maximal 100 l !"
  720 GOTO 590
  750 P.
  752 P."Soviel hast Du nicht"
  755 P."mehr.Wir nehmen alles!"
  760 L=T;GOSUB3000;POKEV,32;FORI=0TO2000;NEXTI;GOTO 600
  770 P."Hier ist keine"
  775 P."Tankstelle!"
  780 GOTO 590
  800 X=0;Y=0
  802 GOSUB 2000
  804 FOR I=0 TO 21;P.;NEXT I
  806 GOSUB 3000;POKEV,32
  808 X=0;Y=2
  810 GOSUB 2000
  820 P."Du bist mit einer Geschwindig-"
  821 P."keit von ",#1,G," Metern pro"
  822 P."Sekunde auf dem Mond gelandet.";P.
  825 IF G>10 P."Das war eine Bruchlandung.";GOTO 830
  826 IF G>5 P."Die Faehre ist noch brauchbar."
  827 IF G>5 GOTO 830
  828 IF G>1 P."Du musst noch etwas ueben !";GOTO 830
  829 P."Saubere Landung."
  830 P.
  831 IF D=0 GOTO 850
  835 P."Es entstand ein Krater mit"
  837 P.#1,ABS(G/5*2)," cm Tiefe."
  840 P.
  850 P."Willst Du Deinen Landeanflug"
  851 P."sehen ?   J/N"
  855 W=INCHAR
  860 IF W='N' GOTO 900
  865 Q=7
  866 GOSUB 200
  867 Q=0
  868 W=HEX(EFF8)
  870 FOR I=0 TO S
  874 IF @(I)>27 GOTO 890
  875 GOSUB 1200
  876 W=HEX(EFF8)-@(I)*32
  878 GOSUB 1000
  880 FOR J=0 TO 150;NEXT J
  890 NEXT I
  895 IF G>10 GOSUB 1200;GOSUB 1400
  900 X=0;Y=0;GOSUB 2000
  902 FOR I=0 TO 21;P.;NEXT I
  904 GOSUB 3000;POKE V,32
  906 X=0;Y=0;GOSUB 2000
  908 P.;P.
  910 P."Willst Du nocheine Landung"
  912 P."probieren ?   J/N"
  915 W=INCHAR
  917 IF W='J' GOTO 200
  920 STOP
 1000 POKE W,142
 1010 POKE (W+2),191
 1020 POKE (W-32),244
 1030 POKE (W-31),199
 1040 POKE (W-30),232
 1050 POKE (W-63),199
 1060 POKE (W-95),157
 1070 RETURN
 1100 X=0;Y=11
 1110 GOSUB 2000
 1112 FOR J=0 TO 9;P.;NEXT J
 1120 GOSUB 3000
 1130 POKE V,32
 1140 X=0;Y=11
 1150 GOSUB 2000
 1160 GOSUB 3000
 1170 POKE V,32
 1180 RETURN
 1200 POKE W,32
 1210 POKE(W+2),32
 1220 POKE(W-32),32
 1230 POKE(W-31),32
 1240 POKE(W-30),32
 1250 POKE(W-63),32
 1260 POKE(W-95),32
 1270 RETURN
 1400 W=(HEX(EFF8))
 1410 POKE(W-1),190
 1420 POKE(W+1),142
 1430 POKE(W+2),145
 1440 POKE(W+3),144
 1450 POKE(W-32),199
 1460 POKE(W-31),199
 1470 POKE(W-30),151
 1480 POKE(W-64),145
 1490 RETURN
 1800 O.12
 1810 TAB(96)
 1820 P."Es ist zu beachten, dass die";P.
 1830 P."Landefaehre umso empfindlicher";P.
 1840 P."auf Bremsmanoever reagiert, je";P.
 1850 P."leichter sie ist, also je mehr";P.
 1860 P."Treibtoff bereits verbraucht";P.
 1870 P."wurde."
 1880 TAB(128)
 1890 P."Alles klar ?                J/N"
 1900 I=INCHAR
 1910 IF I='N' GOTO 150
 1920 GOTO 200
 2000 POKE(HEX(2C)),(HEX(EC)+Y/8)
 2010 POKE(HEX(2B)),((Y-Y/8*8)*32+X)
 2020 RETURN
 3000 H=PEEK(HEX(2C))
 3002 M=PEEK(HEX(2B))
 3004 V=-5120+((H-236)*256)+M
 3010 RETURN
