Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

    1 G.10
    3 REMAA !+(#>~2+++++++++++++++
    9 >>AAAAA
   10 G.500
   15 F.F=1TO199
   16 C=C+R;PO.C-R,32
   17 IFPE.(C+R)#32@(1)=0;GOS.90;CA.H.(119B);IFI=1I=0;G.300
   18 PO.C,D
   19 N.F;Y=0;G=5;@(1)=0;G.80
   20 F.F=1TO@(3)
   21 L=L+1
   24 IFL=2C=C+R;PO.C-R,32;L=0
   26 IFPE.(C+R)#32GOS.89;CA.H.(119B);IFI=1I=0;G.300
   27 PO.C,D
   30 CA.H.(1160);W=PE.(H.(1187))
   35 IFW=1V=1;IFPE.(Q-32)=32Q=Q-32;PO.Q,Z;PO.Q+96,32
   37 IFW=0V=0;IFPE.(Q+96)=32Q=Q+32;PO.Q+64,Z;PO.Q-32,32
   50 N.F
   51 PO.27,H.(16);PO.28,H.(28);PO.29,H.(E0);PO.30,H.(EC);PO.35,H.(40);
      PO.36,H.(01);CA.H.(F51D)
   55 G.800
   80 F.M=1TOY;C=C+R;PO.C-R,32
   81 IFPE.(C+R)#32GOS.89;CA.H.(119B);IFI=1I=0;G.300
   82 PO.C,D
   83 CA.H.(1160);W=PE.(H.(1187))
   84 IFW=1V=1;IFPE.(Q-32)=32Q=Q-32;PO.Q,Z;PO.Q+96,32
   85 IFW=0V=0;IFPE.(Q+96)=32Q=Q+32;PO.Q+64,Z;PO.Q-32,32
   88 N.M;G.400
   89 IFU=0I=1;RE.
   90 IFO=8N=7;O=0;H=3;GOS.222;@(1)=0;I=1;RE.
   91 IFPE.(C+R)>161GOS.140;GOS.150
   92 IFPE.(C+R)=190R=-33;RE.
   93 IFPE.(C+R)=191R=31;RE.
   94 P=RND(32000)/16000
  100 IFPE.(C+R)=1F.F=1TO50;CA.H.(119B);N.F;GOS.210;R=R-2;U=U-1;GOS.222;
      RE.
  101 IFR=30R=R;IFPE.(C+R)=0R=33;RE.
  102 IFR=-34R=R;IFPE.(C+R)=0R=-31;RE.
  103 IFPE.(C+R)=142R=33;RE.
  104 IFPE.(C+R)=143R=-31;RE.
  105 IFPE.(C+R)=0R=R;IFR=31R=33;RE.
  106 IFPE.(C+R)=0R=R;IFR=-33R=-31;RE.
  107 IFPE.(C+R)=161R=R;IFR=33R=31-P;RE.
  108 IFPE.(C+R)=161R=R;IFR=-31R=-33-P;RE.
  109 IFPE.(C+R)=30E=PE.(C+R);PO.(C+R),32;IFN=7F.F=1TO576STEP32;PO.H.(EC7A)⇘
      +F,161;N.F;I=1;RE.
  110 IFR=-33R=31;RE.
  111 IFR=31R=-33;RE.
  112 IFR=-31R=33;RE.
  113 IFR=33R=-31;RE.
  114 IFR=30R=-33;RE.
  115 IFR=-34R=31;RE.
  120 RE.
  140 K=RND(32000)
  142 IFK<10000H=32;RE.
  143 IFK<15000H=140;RE.
  144 IFK<27000H=30;RE.
  145 IFK>25000H=203;RE.
  146 RE.
  150 IFPE.(C+R)=171PO.C+R,32;PO.C+R+1,32;PO.C+R-32,32;PO.C+R-31,H;
      O=O+1;RE.
  152 IFPE.(C+R)=172PO.C+R,32;PO.C+R-1,32;PO.C+R-32,32;PO.C+R-33,H;
      O=O+1;RE.
  154 IFPE.(C+R)=173PO.C+R,32;PO.C+R-1,32;PO.C+R+32,32;PO.C+R+31,H;
      O=O+1;RE.
  156 IFPE.(C+R)=174PO.C+R,32;PO.C+R+1,32;PO.C+R+32,32;PO.C+R+33,H;
      O=O+1;RE.
  157 IFPE.(C+R)=203E=PE.(C+R);PO.(C+R),32;U=U+1;GOS.222;GOS.200;
      I=1;RE.
  160 RE.
  200 F.F=1TO576STEP32;PO.H.(EC7A)+F,32;N.F;PO.Q,Z;PO.Q+32,Z;PO.Q+64,Z;
      RE.
  202 IFN=7A=RND(15)*32;Q=H.(EC5B)+A;PO.Q,Z;PO.+32,Z;PO.Q+64,Z;PO.C,32;
      C=Q+3;N=0
  203 RE.
  210 Z=207;F.F=1TO16;Z=Z+1
  215 PO.Q,Z;PO.Q+32,Z;PO.Q+64,Z
  220 N.F;Z=161;PO.Q,166;PO.Q+32,Z;PO.Q+64,Z;F.F=1TO900;N.F;PO.Q,Z;
      RE.
  222 PO.43,H.(E8);PO.44,H.(EF);P.#3,U,;PO.H.(EFEB),32
  223 IFH=3PO.H.(119C),H.(33);F.J=1TO999STEP99;PO.H.(11A2),J;CA.H.(119B);
      N.J;PO.H.(119C),3;PO.H.(11A2),255;H=1
  224 RE.
  300 IFU=0G.51
  303 IFO=0G.2000
  304 IFY=150U=U;IFE=30G.80
  305 IFE=30@(1)=3;G.15
  307 IFE=203E=E;IFM>0G.80
  308 IFE=203G.20
  309 CA.H.(2EA9);F.F=1TO9000;N.F;G.309
  310 G.2000
  400 IFU<=0G.51
  406 GOS.200;PO.Q,32;PO.Q+32,32;PO.Q+64,32;PO.C,32;IFG=5Y=32000;
      G=0;G.410
  407 Y=150
  410 A=RND(15)*32;Q=H.(EC5B)+A;PO.Q,Z;PO.Q+32,Z;PO.Q+64,Z
  411 C=Q+31;IFA<=240R=-33
  412 D=207;L=0;IFA>240R=31
  413 G.80
  444 F.F=1TO166;O.8;N.F;P."TIME:",;P.#4,@(2),;O.9
  450 G.800
  500 REM  VORPROGRAMM 
  530 O.12;T.(993)
  533 P." LIVE: 000  (c)'1988 by dIRK",
  534 PO.H.(EFFF),32
  535 F.F=1TO1000;N.F
  540 F.F=1TO3;F.I=208TO255;PO.H.(ED70),I;F.E=1TO20;N.E;N.I;N.F
  700 GOS.1000
  701 Z=0;G.750
  702 F.F=1TO4000;N.F;RE.
  703 GOS.1005
  705 PO.43,H.(82);PO.44,H.(ED)
  710 Z=Z+1;G.720+Z
  721 P."  dIRK SCHAEDLICH ZEIGT   ",;G.750
  722 P."        ENCOUNTER         ",;G.750
  723 P."     (c)'FEBRUAR 1988     ",;G.750
  724 P."",;G.750 
  725 Z=Z+1;G.726
  726 P."WEITERE PROGRAMME VON dIRK",;G.750
  727 P."         FIGHTER          ",;G.750
  728 P." HERR STANIUS IN NEW YORK ",;G.750
  729 P."        PING PONG         ",;G.750
  730 P."   GRAPHIC-MACHINE  V2    ",;G.750
  731 P."        RIVER RAID        ",;G.750
  732 P."       COSMIC-BALL        ",;G.750
  733 P."     SOLO COMMOTION usw.  ",;G.750
  734 P."                          ",;PO.H.(ED9C),32
  735 PO.43,H.(4A);PO.44,H.(EC)
  736 P."ENCOUNTER",;F.F=1TO79;O.9;N.F
  737 P."DAS PROGRAMM IST EIN BALL-",;F.F=1TO38;O.9;N.F
  738 P."SPIEL,WO SIE MIT GESCHICK ",;F.F=1TO38;O.9;N.F
  739 P."UND GLUECK,VERSUCHEN      ",;F.F=1TO38;O.9;N.F
  740 P."MUESSEN, SICH 10 LEBEN ZU ",;F.F=1TO38;O.9;N.F
  741 P."ERKAEMPFEN. -unten -oben",;F.F=1TO73;O.9;N.F
  742 P."VIEL SPASS...(Fire) ",;F.F=1TO4;O.9;N.F
  745 G.800
  750 PO.H.(ED9C),32;GOS.702
  751 A=H.(ED81);B=H.(ED9C)
  752 F.F=1TO13;PO.A+F,32;PO.B-F,32;F.E=1TO99;N.E;N.F;G.703
  800 PO.H.(119C),7
  806 PO.H.(11A2),5
  810 P=0;F.F=1TO9;CA.H.(2800);F.I=1TO500-F*100;N.I;N.F
  811 PO.H.(11AA),34;G.850
  812 PO.H.(11AA),54;G.850
  813 PO.H.(11AA),41;G.850
  814 CA.H.(2800);CA.H.(119B);CA.H.(2800);G.850
  815 PO.H.(11AA),15;G.850
  816 PO.H.(11AA),22;G.850
  817 PO.H.(11AA),29;G.850
  818 CA.H.(2800);CA.H.(119B);CA.H.(2800);G.850
  819 P=0;G.850
  820 G.850
  850 F.F=1TO20
  851 CA.H.(119B)
  855 CA.H.(119B)
  860 N.F;CA.H.(1160);W=PE.(H.(1187));IFW=5PO.H.(11AA),4;PO.H.(119C),3;
      PO.H.(11A2),255;G.1999
  861 P=P+1;G.810+P
 1000 REM BILD MONITOR
 1001 PO.27,0;PO.28,H.(0C);PO.29,0;PO.30,H.(EC);PO.35,H.(C0);PO.36,H.(03);
      CA.H.(F51D);RE.
 1005 REM BILDSCHIRMFUELLEN
 1007 F.X=248TO255
 1010 PO.27,H.(82);PO.28,H.(ED);PO.29,H.(9B);PO.30,H.(ED);PO.35,X;
      PO.36,0;CA.H.(F50B)
 1015 N.X;RE.
 1999 N=5;O=3;U=2;T=0;Y=32000;M=0;G=0;@(1)=0;@(3)=32000;L=0;@(2)=0
 2000 U=U+1;GOS.222;T=T+1
 2001 GOS.1000;Z=161;@(2)=@(2)+1
 2002 A=RND(15)*32;Q=H.(EC5B)+A;PO.Q,Z;PO.Q+32,Z;PO.Q+64,Z
 2003 C=Q+31;IFA<=240R=-33
 2004 D=207;L=0;IFA>240R=31
 2005 Y=32000;IFU=9GOS.2035;GOS.3000;PO.Q,Z;PO.Q+32,Z;PO.Q+64,Z;F.F=1TO5000⇘
      ;N.F;Y=150;G.80
 2006 IFU>=10GOS.2035;F.F=1TO329;O.8;N.F;P."HERZLICHEN GLUECKWUNSCH",;
      G.444
 2010 GOS.2022;IFN=7GOS.3000;Y=32000;G.80
 2012 G.20
 2022 REM BILD 1
 2025 F.F=1TO512STEP64;A=H.(EC81)+F;B=RND(17);A=A+B;GOS.2050;N.F
 2027 RE.
 2030 REM BILD 2
 2031 GOS.1000
 2035 PO.27,H.(56);PO.28,H.(29);PO.29,0;PO.30,H.(EC);PO.35,H.(9E);
      PO.36,H.(02);CA.H.(F51D);RE.
 2050 PO.A,171;PO.A+1,172;PO.A-32,174;PO.A-31,173;RE.
 3000 A=H.(EC21);PO.A,142;PO.A+1,142;PO.A+32,142
 3003 A=H.(EEC1);PO.A,143;PO.A+1,143;PO.A-32,143
 3005 A=H.(EEDA);PO.A,190;PO.A+1,190;PO.A+2,190;PO.A+2-32,190;PO.A-31,190;
      PO.A-64+2,190
 3007 A=H.(EC3A);PO.A,191;PO.A+1,191;PO.A+2,191;PO.A+2+32,191;PO.A+33,191;
      PO.A+66,191
 3010 RE.
18788 dS.TRUETZSCHLERstr.18 99oo PLAUEN          KB
