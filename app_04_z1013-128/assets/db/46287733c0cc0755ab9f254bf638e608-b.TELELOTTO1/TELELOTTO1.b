Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

   10 REM TELE-LOTTO TIPS
   20 OUTC.12
   30 P.;P.;P.
   35 P."T E L E - L O T T O - T I P S"
  100 @(1)=5;@(2)=10;@(3)=15;@(4)=19;@(5)=29
  110 @(6)=2;@(7)=15;@(8)=22;@(9)=27;@(10)=34
  120 @(11)=1;@(12)=14;@(13)=24;@(14)=28;@(15)=33
  130 @(16)=17;@(17)=19;@(18)=27;@(19)=31;@(20)=32
  140 @(21)=9;@(22)=12;@(23)=20;@(24)=29;@(25)=35
  180 F.I=1TO6;P.;N.I
  200 F.I=0TO4
  210 F.J=1TO21STEP5
  220 P.#4,@(I+J),
  225 TAB(2)
  230 N.J
  240 P.
  241 P.
  250 N.I
  270 P.;P.
  276 TAB(2)
  280 P."PRAEMIE: ZVE 966520-966524"
  490 P.;P.
  500 P.;P."GEWINNKONTROLLE ? (J)/N :"
  510 F.I=1TO6;OUTC.8;N.I
  520 O=INC.
  530 IFO='N'ST.
  550 OUTC.12;P.;P.
  560 P."GEWINNKONTROLLE";P.;P.
  565 P.;P.
  570 P."EINGABE DER GEZOGENEN ZIFFERN:"
  575 P.;P.
  580 F.I=50TO54
  585 P.
  590 P.#2,I-49,". ZIFFER ? ",;INPUT""@(I)
  600 N.I
  645 P.
  650 P.;P."GEZOGENE ZIFFERN:"
  652 P.;P.
  655 F.I=50TO54;P.#4,@(I),;N.I
  680 F.I=100TO150;@(I)=0;N.I
  700 F.J=1TO5
  720 F.I=1TO5
  725 F.K=0TO4
  730 IF@(50+K)=@(I+(J-1)*5)@(100+J-1)=@(100+J-1)+1
  740 N.K
  750 N.I
  760 N.J
  777 P.
  800 P.;P."GEWINN:";P.
  805 F.I=1TO5
  810 P."TIP ",#1,I," ... ",#1,@(99+I)," RICHTIGE"
  830 N.I
  900 P."                       >ENT<",;O=INC.
  920 OUTC.12;P.;P.
  930 P."WUENSCHEN SIE TIP FUER DIE";P.
  940 P."NAECHSTE ZIEHUNG ? (J)/N",;O=INC.
  950 IFO='N'ST.
  960 P.;P."M E I N   T I P"
  965 P.
  970 F.I=1TO5
  990 @(100+I)=RND(35)
  995 IFI=1G.1020
 1000 F.J=I-1TO1STEP-1
 1010 IF@(100+I)=@(100+J)G.990
 1015 N.J
 1020 N.I
 1030 F.I=101TO105
 1040 P.@(I)
 1050 N.I
 1060 P.;P."NOCH EIN TIP ? (J)/N",;O=INC.
 1070 IFO#'N'G.960