Zeichensatz UTF-8+Z1013()-CTRL()-ohne Umlaute(äöüß)

    1 G.10
    3 REMAA! ~O(#} >y2AAA
    9 REM>>>d>      SOLO COMMOTION
   10 G.500
  100 F.F=1TOH
  105 Q=Q+X;PO.Q-X,2
  110 IFPE.(Q+X)#2GOS.297;PO.C,Z
  125 PO.Q,Z
  190 N.F
  192 F.F=1TO9;PO.H.(EFBF)+F,32;N.F;F.F=1TO8;PO.H.(EFD7)+F,160;N.F
  194 IFQ=CG.1000
  195 G.420
  280 IFPE.(Q+X)=4IFX=-31X=-33;RE.
  282 IFPE.(Q+X)=4IFX=33X=31;RE.
  284 IFPE.(Q+X)=1IFX=-33X=-31;RE.
  286 IFPE.(Q+X)=1IFX=31X=33;RE.
  297 IFPE.(Q+X)=141RE.
  298 CA.H.(119E)
  299 IFPE.(Q+X)<5GOS.280;RE.
  300 IFX=33X=-31;RE.
  302 IFX=31X=-33;RE.
  304 IFX=-31X=33;RE.
  306 IFX=-33X=31;RE.
  420 N=N-1;PO.43,H.(F2);P.#2,N,;PO.H.(EFF4),32
  422 IFN=0G.2000
  450 PO.C,141;F.J=1TO3;J=2
  455 CA.H.(1160);W=PE.(H.(1187))
  456 IFW<5M=M+1;GOS.459+M
  458 IFW=5IFX#0J=5
  459 N.J;G.481
  460 IFPE.(Q+1)=2IFPE.(Q+32)<5PO.Q,176;X=33;RE.
  461 IFPE.(Q-1)=2IFPE.(Q+32)<5PO.Q,177;X=31;RE.
  462 IFPE.(Q-1)=2IFPE.(Q-32)<5PO.Q,178;X=-33;RE.
  463 IFPE.(Q+1)=2IFPE.(Q-32)<5PO.Q,179;X=-31;RE.
  464 M=0;RE.
  481 H=0;F.F=1TO8;PO.H.(EFD7)+F,32;N.F;F.F=1TO9;PO.H.(EFBF)+F,160;
      N.F;PO.H.(EFE6),32;PO.H.(EFE7),32;PO.H.(EFE8),48
  482 F.J=1TO3;J=2
  483 CA.H.(1160);W=PE.(H.(1187))
  486 IFW=6IFH<999H=H+1;PO.43,H.(E6);P.#3,H,;PO.H.(EFE9),32
  487 IFW=4IFH>0H=H-1;PO.43,H.(E6);P.#3,H,;PO.H.(EFE9),32
  489 IFW=5IFH#0J=5
  490 N.J
  492 G.100
  500 PO.429,12;G.520 
  510 $VERSUCHEN SIE MIT DEM BALL IN DAS LOCH ZU TREFFEN  LINKS=RICHTUNG ⇘
      & POWER -  RECHTS=POWER +  SPACE = (ENT) & START   
  520 Q=H.(EE10);Z=141;X=33;L=0;N=13;M=0;P=-3;T=0;H=0
  588 O.12;O.8
  590 PO.27,0;PO.28,H.(EC);PO.29,H.(DF);PO.30,H.(EF);PO.35,H.(9F);
      PO.36,0;CA.H.(1194);PO.H.(EFE0),32;G.610
  610 F.F=1TO3000;N.F
  615 PO.43,0;PO.44,H.(EC)
  620 F.J=1TO12;P.;GOS.700;N.J
  650 P."         "
  651 GOS.700
  652 P."          "
  653 GOS.700
  654 P."       "
  655 GOS.700
  656 P."        "
  657 GOS.700
  658 P."    COMMOTION"
  659 GOS.700
  660 P.;P."(c)'03.1988 by dIRK SCHAEDLICH"
  661 F.J=1TO12;P.;GOS.700;N.J;PO.H.(EFE0),32
  662 B=H.(EF1F);G=H.(1622);F.F=1TO4000;N.F
  663 F.F=1TO32;PO.H.(ED5F)+F,158;PO.H.(EE80)-F,248;N.F
  664 A=PE.(G);IFA#36P."PROGRAMMABLAUF DURCH AENDERRUNG GESTOERT";
      F.F=1TO2;F=1;N.F
  665 F.F=1TO3;F=2;CA.H.(1160);W=PE.(H.(1187));IFW=5F=5
  667 G=G+1;A=PE.(G);PO.B,A
  669 PO.27,H.(01);PO.28,H.(EF);PO.29,0;PO.30,H.(EF);PO.35,H.(20);
      PO.36,0;CA.H.(1191)
  670 IFG=H.(169F)G=H.(1622)
  671 N.F
  672 A=H.(EE4F);B=H.(EE5A);IFPE.(A)#100GOS.685
  673 IFPE.(B)#76GOS.685
  679 G.800
  680 F.J=1TO10;N.J;RE.
  685 A=H.(ED10);PO.A,75-P;PO.A+1,62-P;PO.A+2,74-P;PO.A+3,66-P;PO.A+4,60-P
  686 PO.27,0;PO.28,H.(10);PO.29,0;P.30,H.(01);PO.35,0;PO.36,H.(30);
      CA.H.(1191)
  700 RE.
  800 PO.43,0;PO.44,H.(EC)
  810 F.F=1TO4;P."",;GOS.680;N.F
  812 F.F=1TO2;P."",;GOS.680;N.F
  814 F.F=1TO17;P." ",;GOS.680;N.F
  816 P."                          ",;GOS.680
  818 F.F=1TO6;P."",;GOS.680;N.F
  819 P.;PO.H.(EFE0),32;G.900
  820 A=RND(17)*32;C=H.(EC82)+A;A=RND(24);C=C+A+1;PO.C,141
  830 A=RND(10);G.850+A
  835 IFQ=DG.830
  836 IFQ=CG.830
  850 G.100
  851 Q=H.(ECA5);G.835
  852 Q=H.(EE10);G.835
  853 Q=H.(ED29);G.835
  854 Q=H.(EE9A);G.835
  855 Q=H.(EDA5);G.835
  856 Q=H.(EE16);G.835
  857 Q=H.(EE29);G.835
  858 Q=H.(EDB9);G.835
  859 Q=H.(EEA5);G.835
  860 Q=H.(ECF3);G.835
  900 F.F=1TO5;F=2
  903 CA.H.(1160);W=PE.(H.(1187))
  904 IFW=5F=6
  905 Q=Q+X;PO.Q-X,2
  910 IFPE.(Q+X)#2GOS.297
  915 PO.Q,Z;N.F
  916 PO.Q,2;X=0;PO.43,H.(C0);P.
  917 P."POWER 000    BALL 00    RICHTUN",;PO.H.(EFFF),71
  920 F.F=0TO27STEP3;PO.H.(EF44)+F,199;N.F;PO.Q,2;X=0;G.820
 1000 PO.43,H.(44);P=P+3
 1015 PO.H.(EF44)+P,176
 1020 F.I=1TO140STEP7;PO.H.(11BB),I;CA.H.(11B4);N.I
 1025 PO.C,2;PO.D,2
 1030 X=0;H=0;G.820
 2000 F.F=1TO8;PO.H.(EFD7)+F,32;N.F;F.I=50TO100;PO.H.(11BB),I;CA.H.(11B4);
      N.I
 2010 PO.Q,2;PO.C,2;Q=H.(EE10);X=33;N=13;P=-3;H=0;G.900