Zeichensatz UTF-8+Z1013()-CTRL()-ohne Umlaute(äöüß)

    1 G.102
    2 OUTC.12
    3 PO.H.(EC00),32
    4 REMAAAAAA!~O(#} >y2AAAAAAAAAAAAA
    5 PO.H.(EC16),84;PO.H.(EC17),65;PO.H.(EC18),78;PO.H.(EC19),75
    6 PO.H.(EC07),32;PO.H.(EC1E),32;PO.H.(EC1F),32
    7 PO.H.(1B),H.(A0);PO.H.(1C),H.(EC)
    8 PO.H.(1D),H.(C0);PO.H.(1E),H.(EF)
    9 C.H.(F6D1);GOS.571
   10 Q=H.(ECAF)
   11 T=49;S=99;IFI>30000S=20
   12 R=H.(EC07)
   13 PO.H.(EC02),70;PO.H.(EC03),73;PO.H.(EC04),82;PO.H.(EC05),69
   14 PO.H.(2B),H.(20);PO.H.(2C),H.(EC)
   15 PR.""
   16 F.I=1TO3000;N.I
   17 PO.H.(2B),H.(20);PO.H.(2C),H.(EC)
   18 PR.""
   19 Z=166;G=H.(EC9E)
   20 F.I=1TOS;PO.H.(2B),H.(1A);PO.H.(2C),H.(EC);PR.I,
   21 IFPEEK(Q+32)=197I=I-25
   22 PO.H.(2B),H.(A0);PO.H.(2C),H.(EF)
   23 IFPEEK(Q+32)=42T=T-1;PO.R,T
   24 IFPEEK(Q+32)=248T=T-3;PO.R,T
   25 IFPEEK(Q+33)=42T=T-1;PO.R,T
   26 IFPEEK(Q+31)=42T=T-1;PO.R,T
   27 IFT<48G.235
   28 IFT=58G.250
   29 P.;IFQ-2<=GQ=Q+2
   30 PO.Q,Z;PO.Q+1,118;PO.Q-1,118
   31 IFPEEK(Q)=248T=T-3;PO.R,T
   32 PO.H.(EC60),32
   40 C.H.(1180);W=PEEK(H.(FF));PO.4,0
   50 O=O+1
   76 IFW=6Q=Q+2
   78 IFW=4Q=Q-2
   80 IFW=5GOS.200
   81 C=RND(32000)/1600
   82 IFC=8E=H.(EF80)+(ABS(A-3));PO.E,197;PO.E+1,197;PO.E+2,197
   92 A=RND(32000)/1024
   93 PO.H.(EF80)+A,42    
   94 K=0
  100 N.I;IFI<30G.3510
  101 G.235
  102 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0;PO.H.(1E),H.(F0)
  103 CALLH.(F6D1);OUTC.12
  104 PR.;PR.;PR.
  105 PR."       "
  106 PR."              "
  107 PR."          "
  108 PR."             "
  109 PR."           R3"
  110 PR.;PR.
  111 PR.
  112 PR." SPIELERKLAERUNG "
  113 PR.
  114 PR." SPIELBEGINN "
  115 PR.;PR."     ENDE  ";PR.;PR." VIDEO  "
  116 X=H.(F0);PO.X,H.(CD);PO.(X+1),H.(30);PO.(X+2),H.(F1)
  117 PO.(X+3),H.(32);PO.(X+4),H.(FF);PO.(X+5),0
  118 PO.(X+6),H.(C9);PO.H.(EE40),32
  119 IFK=0REM
  122 PO.H.(2B),H.(80);PO.H.(2C),H.(EF)
  123 PO.H.(EE00),32
  124 PR."(c) AUGUST 87'by DIRK SCHAEDLICH"
  125 Q=H.(EF0F)
  126 PO.H.(EF00),255;PO.H.(EF1F),255
  127 K=H.(EF94);D=H.(EF9B)
  128 IFPEEK(K)#75C.H.(F51D)REM
  129 IFPEEK(D)#68C.H.(F51D)REM
  130 F.V=1TO32000
  133 PO.Q,166;PO.Q+1,94;PO.Q-1,94
  135 CALLH.(F0);W=PEEK(H.(FF));PO.4,0
  137 P=Q
  139 IFW=8Q=Q-1
  140 IFW=9Q=Q+1
  141 IFW=32G.150
  142 O=0
  143 PO.P+1,32;PO.P-1,32
  144 IFPEEK(Q+1)=255G.162
  145 IFPEEK(Q-1)=255G.162
  149 N.V
  150 F.J=Q-32TOQ-480STEP-32
  152 IFPEEK(J)=199G.465
  153 IFPEEK(J)=198STOP
  154 IFPEEK(J)=255G.2
  155 IFPEEK(J)=197G.2900
  156 IFPEEK(J)>32G.162
  157 PO.J,161
  158 PO.J,32
  160 N.J
  161 G.143
  162 PR."";PR."SCHIESSEN SIE"
  163 PR."BITTE AUF EINES DER FELDER         "
  164 PR.;PR."";PR.;PR.
  165 F.I=1TO10000;N.I
  166 G.102
  167 A=H.(C1)
  168 OUTC.12
  171 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0;PO.H.(1E),H.(F0)
  172 PO.H.(23),A;PO.H.(24),0;C.H.(F50B)
  173 PO.H.(2B),H.(A0);PO.H.(2C),H.(EE)
  174 PR.;PR."    "
  175 PR."   ",;PR.O,;PR." TIME TOTAL"
  176 PR." ",
  177 PR."    "
  178 PR."    ERZLICHEN GLUECKWUNSCH"
  179 PR.;PO.H.(EF80),193
  180 K=208
  181 F.I=1TO300
  182 K=K+1
  183 PO.H.(EF5D),K
  184 IFK=255K=208
  185 N.I
  186 G.102
  187 PR."SIE STAENDIG RECHTS FLIEGEN"
  188 PR."WEITER MIT BILD 3.."
  189 PO.H.(EFE0),255;PO.H.(EFE2),60;PO.H.(EFE4),255
  190 PO.H.(EE60),32;G.490
  191 OUTC.12;PR.
  192 PR."SIE FLIEGEN IM TIEFFLUG DURCH"
  193 PR."EINE STADT.SIE SUCHEN  "
  194 PR."SIE MUESSEN MIT  KOLLIDIEREN,"
  195 PR."UM IN EINE ANDERE UMGEBUNG ZU"
  196 PR."GELANGEN.DORT SUCHEN SIE DAS    SYMBOL WAS AM SPIELANFANG L.OBEN"⇘
      ,
  197 PR."ZU SEHEN IST UM MIT IHM ZU KOLL.",
  198 PR."IST DIES GESCHEHEN KOMMEN SIE INDAS B.4.IHRE GEGNER..... SIE    M⇘
      UESSEN AUSWEICHEN,KOENNEN ABER AUCH SPRINGEN,S2 oben."
  199 G.2100
  200 F.J=Q+32TOQ+640STEP32
  210 IFPEEK(J)=42PO.J,255;T=T+1;PO.J,32;RE.
  211 PO.R,T
  212 IFPEEK(J)=248PO.(J),32;PO.(J-1),32;PO.(J+1),32;RE.
  220 PO.J,161
  222 PO.J,32
  223 N.J
  225 F.Y=1TO32
  226 OUT.248 
  227 N.Y
  228 T=T-1
  229 PO.R,T
  230 RE.
  235 F.I=1TO32
  236 OUTC.198
  237 N.I
  238 PR.
  239 PR."GAME OVER"
  240 PR.
  241 F.I=1TO32
  242 OUTC.197
  243 N.I
  245 PO.H.(EFA0),32
  246 F.I=1TO6000;N.I
  247 O=0;G.2
  250 PO.H.(1B),0;PO.H.(1C),H.(EC)
  251 PO.H.(1D),0;PO.H.(1E),H.(F0)
  252 CALLH.(F6D1)
  253 OUTC.12
  255 PO.H.(1B),0;PO.H.(1C),H.(ED)
  256 PO.H.(1D),H.(E0);PO.H.(1E),H.(EE)
  257 CALLH.(F6D1)
  258 IFK>3G.2
  259 K=K+1
  260 Q=H.(ED0A)
  262 Z=166
  263 IFO>9999PR." GAME OVER (ZEIT) ";PR.;F.F=1TO6000;N.F;G.102
  264 PO.H.(EEF8),90;PO.H.(EEF9),73;PO.H.(EEFA),69;PO.H.(EEFB),76
  265 PO.H.(EC25),174;PO.H.(EC26),173;PO.H.(EC27),131
  266 PO.H.(EC43),131;PO.H.(EC44),174;PO.H.(EC48),173
  267 PO.H.(EC62),174;PO.H.(EC69),173;PO.H.(EC82),171
  268 PO.H.(EC83),248;PO.H.(EC84),248;PO.H.(EC89),172
  270 PO.H.(EC74),131;PO.H.(EC75),174;PO.H.(EC76),158
  271 PO.H.(EC77),173;PO.H.(EC92),131;PO.H.(EC93),174
  272 PO.H.(EC98),173;PO.H.(ECB1),174;PO.H.(ECB9),173
  273 PO.H.(ECD1),171;PO.H.(ECD2),248;PO.H.(ECD3),248
  274 PO.H.(ECD4),248;PO.H.(ECD9),172
  275 PO.H.(EF0E),174;PO.H.(EF0F),173;PO.H.(EF10),131
  276 PO.H.(EF2C),131;PO.H.(EF2D),174;PO.H.(EF31),173
  277 PO.H.(EF32),131;PO.H.(EF4A),131;PO.H.(EF4B),174
  278 PO.H.(EF53),173;PO.H.(EF69),174;PO.H.(EF74),173
  279 PO.H.(EF89),171;PO.H.(EF8A),248;PO.H.(EF90),248
  280 PO.H.(EF91),248;PO.H.(EF92),248;PO.H.(EF93),248
  281 PO.H.(EF94),172
  282 PO.H.(2B),H.(A0);PO.H.(2C),H.(EE)
  285 S=32000;IFI>30000S=40
  286 IFO>6000G.3000
  289 F=0
  290 FORI=1TOS
  292 IFPEEK(Q+32)>90F=F+1;PR.F
  293 IFPEEK(Q+32)=69 G.340
  294 IFF>10G.250
  299 P.
  300 PO.Q,Z;PO.Q+1,118;PO.Q-1,118
  310 C.H.(1180);W=PEEK(H.(FF));PO.4,0
  315 O=O+1
  320 IFW=4Q=Q-2
  322 IFW=6Q=Q+2
  330 A=RND(32000)/1024
  332 PO.H.(EEA0)+A,190;PO.H.(EEA0)+1+A,143
  337 U=0
  338 N.I;G.3520
  340 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0;PO.H.(1E),H.(F0)
  341 CALLH.(F6D1)
  342 OUTC.12
  345 Q=H.(ECB0)
  346 IFU>3G.250
  347 U=U+1
  350 PO.H.(2B),H.(C0);PO.H.(2C),H.(EF)
  360 IFO>9999PR." GAME OVER (ZEIT) ";PR.;F.F=1TO6000;N.F;G.102
  370 C=RND(5)
  371 IFC=1D=63
  372 IFC=2D=203
  373 IFC=3D=139
  374 IFC=4D=157
  375 IFC=5D=202
  376 PO.H.(ED40),D
  380 S=32000;IFI>30000S=27
  396 F=0
  397 T=204
  398 Y=0
  399 Z=196
  400 FORI=1TOS
  413 IFPEEK(Q+32)=DG.640
  414 Y=Y+1
  415 Z=Z+1
  416 IFPEEK(Q+32)#32GOS.451
  419 P.
  420 PO.Q,166;PO.Q+1,118;PO.Q-1,118
  425 C.H.(1180);W=PEEK(H.(FF));PO.4,0
  426 O=O+1
  428 P=Q
  430 IFW=4Q=Q-2
  432 IFW=6Q=Q+2
  433 B=RND(30)
  434 IFY=100PO.H.(EFA0)+A,T;PO.H.(EFA1)+A,T;PO.H.(EFA2)+A,T
  435 IFY=100Y=50
  437 A=RND(32000)/1024
  438 PO.H.(EFA0)+A,Z;PO.H.(EFA1)+A,Z;PO.H.(EFA2)+A,Z
  440 IFZ=199Z=196
  450 N.I;G.3530
  451 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0
  452 PO.H.(1E),H.(0C);PO.H.(23),0;PO.H.(24),H.(04);C.H.(F51D)
  453 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0;PO.H.(1E),H.(F0)
  454 PO.H.(23),H.(FF);PO.H.(24),0;C.H.(F50B)
  455 PO.H.(1B),0;PO.H.(1C),H.(0C);PO.H.(1D),0
  456 PO.H.(1E),H.(EC);PO.H.(23),0;PO.H.(24),H.(04);C.H.(F51D)
  457 F=F+1;IFF>3G.340
  458 IFPEEK(Q+64)=204G.460
  459 RE.
  460 PR."WELCOME"
  461 Z=208
  462 G.400
  465 PO.H.(1B),H.(60);PO.H.(1C),H.(ED)
  466 PO.H.(1D),0;PO.H.(1E),H.(F0);CALLH.(F6D1);OUTC.12
  467 PO.H.(2B),H.(20);PO.H.(2C),H.(ED)
  468 PR."(c) AUGUST 87'by DIRK SCHAEDLICH"
  469 PO.H.(2B),H.(40);PO.H.(2C),H.(ED)
  470 PR.""
  472 PR."SIE FLIEGEN MIT IHREM FLUGZEUG"
  473 PR."vv IM ALL.SIE MUESSEN IHRE"
  474 PR."GEGNER * ABSCHIESSEN OHNE ZU"
  475 PR."KOLLIDIEREN.SIE HABEN 99lTREIB-"
  476 PR."STOFF MIT AN BORD.SIE KOENNEN"
  477 PR."UNTERWEGS AUFTANKEN ."
  478 PR."WENN SIE 10 GEGNER ABGESCHOSSEN"
  479 PR."HABEN,GEHT ES MIT DEM 2.BILD"
  480 PR."WEITER"
  481 PO.H.(EFE0),255;PO.H.(EFE2),62;PO.H.(EFE4),255
  482 PO.H.(EEA0),32;G.490
  483 OUTC.12;PR.
  484 PR."VOM ALL ZUM HIMMEL.IHRE GEGNER"
  485 PR."JETZT FELSEN.SIE MUESSEN IHNEN"
  486 PR."AUSWEICHEN DEN SIE KOENNEN "
  487 PR."NICHT MEHR SCHIESSEN."
  488 PR."UM ANS ZIEL ZU GELANGEN MUESSEN"
  489 G.187
  490 Q=H.(EF9F);Z=32
  491 F.I=1TO32000;Z=Z-1
  493 PO.Q,166;PO.Q-32,60;PO.Q+32,60;CALLH.(F0);W=PEEK(H.(FF))
  494 P=Q;PO.P,32;PO.P-32,32;PO.P+32,32
  495 IFZ>10Q=Q-1
  496 IFZ<10Q=Q-33
  497 IFZ<7Q=Q+31
  498 IFZ=-29Q=H.(EC3F)
  499 IFZ=-45G.490
  500 IFW=8G.191
  501 IFW=9G.483
  502 IFW=32PR.;PR."PFEIL LINKS UNTEN BITTE BEACHTEN⇘
      ";F.F=1TO7000;N.F;G.465
  507 N.I
  508 G.595
  571 PO.H.(2B),H.(E0);PO.H.(2C),H.(EF)
  572 PR." (c) 87'by dIRK  FIGHTER ONE ",
  573 PO.H.(EFEB),100;PO.H.(EFEC),73;PO.H.(EFED),82              
  574 PO.H.(EFEE),75
  575 PO.H.(EFFF),32
  580 RE.
  595 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0;PO.H.(1E),H.(F0)
  596 CALLH.(F6D1);OUTC.12;G.2
  640 U=0
  644 I=0
  650 OUTC.12
  651 IFI>30000U=0
  652 PO.H.(1B),H.(80);PO.H.(1C),H.(EC);PO.H.(1D),H.(C0)
  653 PO.H.(1E),H.(EF);C.H.(F6D1)
  655 PO.H.(2B),H.(C0);PO.H.(2C),H.(EF);P."",
  656 PR.""
  657 PO.H.(2B),H.(60);PO.H.(2C),H.(EC)
  658 PR.""
  660 Q=H.(ED50)
  661 PO.H.(2B),H.(26);PO.H.(2C),H.(EC);PR.I,
  665 PO.H.(2B),H.(80);PO.H.(2C),H.(EF)
  670 Z=166
  680 F=0
  681 PO.H.(EC3E),48
  690 PO.H.(EC36),70;PO.H.(EC37),69;PO.H.(EC38),72
  692 PO.H.(EC39),76;PO.H.(EC3A),69;PO.H.(EC3B),82;PO.H.(EC3C),58
  700 U=U+1
  710 IFU>5G.340
  780 S=600;IFI>30000S=6
  790 PO.H.(EC21),84;PO.H.(EC22),73;PO.H.(EC23),77
  791 PO.H.(EC24),69;PO.H.(EC25),58
  792 PO.H.(EC2C),32
  800 FORI=1TOS
  810 IFPEEK(Q+32)=46F=F+1;PO.H.(EC3E),48+F;IFF=3G.650
  820 IFPEEK(Q)=248G.650
  830 IFPEEK(Q+32)=248G.650
  835 IFPEEK(Q+64)=248G.650
  859 P.
  860 PO.Q,Z;PO.Q-1,118;PO.Q+1,118
  870 C.H.(1180);W=PEEK(H.(FF));PO.4,0
  875 O=O+1
  880 IFW=6 Q=Q+2
  882 IFW=4 Q=Q-2
  886 IFW=1 Q=Q-32
  888 IFW=5 Q=Q+96
  900 A=RND(32000)/1024
  910 IFA=8PR."................................",
  920 IFA>15PO.H.(EF60)+A*2,46
  950 N.I
  960 PR." ";F.F=1TO2000;N.F
  962 PR."     ";F.F=1TO2000;N.F
  964 PR."     ";F.F=1TO2000;N.F
  966 PR."     ";F.F=1TO2000;N.F
  968 PR." OMPUTER Z1013 "
 1000 F.F=1TO4000;N.F
 1020 IFS<100G.3540
 1090 N=0
 1100 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0;PO.H.(1E),H.(F0)
 1111 C.H.(F6D1);OUTC.12
 1112 PO.H.(2B),H.(20);PO.H.(2C),H.(EC);PR."-LEBEN-            ⇘
      ",
 1113 PO.H.(1B),H.(80);PO.H.(1C),H.(EC);PO.H.(1D),H.(C0)
 1114 PO.H.(1E),H.(EF);C.H.(F6D1)
 1120 Q=H.(ECCA)
 1122 B=H.(ECCF)
 1130 Z=126
 1140 V=25
 1144 U=0
 1146 R=H.(ECC0)
 1147 S=H.(ECDF)
 1150 PO.H.(EC00),32
 1160 N=N+1
 1166 IFN>2G.340
 1170 PO.H.(2B),H.(A0);PO.H.(2C),H.(EF)
 1180 S=420;IFI>30000S=50
 1200 FORI=1TOS
 1210 IFPEEK(Q+32)#32U=U+1;V=V-2;PO.H.(EC3F)-V,32;IFU>12G.1100
 1212 IFPEEK(B+32)#32U=U+1;V=V-2;PO.H.(EC3F)-V,32;IFU>12G.1100
 1220 IFQ=R Q=Q+2;B=B+2
 1222 IFB=S Q=Q-2;B=B-2
 1244 P.
 1245 PO.Q,166;PO.B,166
 1247 PO.Q-1,118;PO.B+1,118;PO.Q+1,118;PO.B-1,118
 1250 C.H.(1180);W=PEEK(H.(FF));PO.4,0
 1255 O=O+1
 1260 IFW=4 Q=Q-2;B=B-2
 1270 IFW=6 Q=Q+2;B=B+2
 1300 A=RND(32000)/1024
 1310 PO.H.(EF60)+A,Z
 1315 C=RND(32000)/1024
 1320 IFA=8L=H.(EF60)+C;PO.L,94;PO.L+1,166;PO.L+2,94
 1325 IFI=200PR.""
 1330 IFI=362PR.""
 2000 N.I;IFS<100G.3550
 2001 F.F=1TO2000;N.F
 2002 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0;PO.H.(1E),H.(F0)
 2003 C.H.(F6D1);OUTC.12
 2004 P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.
 2005 PR."      "
 2007 PR."            "
 2009 PR."      "
 2011 PR."                  "
 2013 PR."(c)87'bydS."
 2014 PO.H.(EF00),32
 2015 F.F=1TO10000;N.F
 2016 P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;P.;
      P.;P.;P.;P.;P.
 2017 P.;P.;P.;P.;P.
 2018 P.
 2019 PO.H.(EFE0),32
 2020 F.F=1TO8000;N.F
 2030 G.167
 2100 PR."IM B.5 STEUERN SIE 2 FLUGZEUGE."
 2110 PR."SIE FLIEGEN UEBER DEM MEER,MIT  DEN WELLEN NICHT IN BERUEHRUNG  K⇘
      OMMEN."
 2120 PR."",
 2130 PR.;PR."STEUERUNG: <> S2 oben"
 2140 PR.
 2150 PR." START:SPACE  VIEL SPASS!"
 2155 PO.H.(EFE0),32
 2160 F.F=1TO32000
 2165 C.H.(F0);W=PEEK(H.(FF))
 2170 IFW=32 G.595
 2180 N.F;G.595
 2900 OUTC.12
 2910 PR.;PR.;PR.
 3000 PR."      "
 3002 PR."          "
 3004 PR."        "
 3006 PR."          "
 3008 PR."     "
 3010 PR.
 3012 PR."";PR.
 3020 PR."GLEICH WIRD IHNEN DER GANZE ";PR."SPIELABLAUF PRAESENTIERT."
 3022 PR.;PR.""
 3030 PR.;PR."SOLANGE DER PUNKT  BLINKT";PR.;PR."KOMMEN SIE MIT SPACE IN⇘
       DAS";PR.;PR."ANFANGSBILD."
 3040 PR.;PR.""
 3042 P.;P.;P.;P.
 3043 PR."(c) AUGUST 87'by DIRK SCHAEDLICH",
 3050 PO.H.(EFE0),32
 3100 F.F=1TO150
 3110 C.H.(1180);W=PEEK(H.(FF))
 3119 PO.H.(EE52),207
 3120 PO.H.(EE52),32
 3140 IFW=5G.102
 3144 PO.H.(EE52),207
 3146 PO.H.(EE52),32
 3150 N.F;G.3500
 3500 OUTC.12
 3505 I=31000;G.2
 3510 I=31000;G.250
 3520 I=31000;G.340
 3530 I=31000;G.650
 3540 I=31000;G.1090
 3550 PO.H.(1B),0;PO.H.(1C),H.(EC);PO.H.(1D),0;PO.H.(1E),H.(F0);C.H.(F6D1);
      G.2900