Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

1 REM 000000000000000000000000000000000000000000000C!,!> w!,K000000000000000000000000000
5 R=0;GOSUB600
6 OUT.12;A=0;E=36;FORI=0TO 50;X=-5120+RND(126);GOSUB500;NEXTI
7 X=HEX(EFCF);M=130;POKEX,M
8 FOR K=0 TO 31;POKE HEX(EFE0)+K,158;NEXT K
9 POKE-5120,32;FOR I=1 TO 130
12 T=RND(30)
13 POKE HEX(ECC0)+T,E
14 POKE HEX(ECC0)-T,140
15 POKE HEX(ECC0)+T-7,140
16 GOSUB 100
17 CALL HEX(118B)
28 IF PEEK(X-32) = E A=A+1;POKE HEX(EFE0)+A,137; GOTO 40
30 IF PEEK(X-32) = 140 GOTO 400
32 GOSUB 100
35 CALLHEX(118B)
37 IF PEEK(X-32)=E A=A+1;POKE HEX(EFE0)+A,137;GOTO 40
38 IF PEEK(X-32)=140 GOTO 400
40 NEXT I
43 FORI=1TO17;PRINT;NEXTI
44 PRINT'   DAS GELD IST ALLE'
45 IF A>R R=A;PRINT;PRINT;PRINT'***** NEUER REKORD *****'
50 PRINT;PRINT;PRINT'ES WURDEN ',#2,A,' DOLLARS GEFANGEN'
55 IF R=A GOTO 70
60 PRINT;PRINT;PRINT'DER REKORD SIND ',#2,R,' DOLLARS'
70 FORI=1TO15;PRINT;NEXTI
80 PRINT'      noch ein Spiel N/ENT'
84 FOR S=0 TO  1000;NEXTS
85 M=INCHAR
88 IF M # 78 GOTO 6
99 GOTO 900
100 C=IN(2)
110 IFC=91POKEX,32;X=X+2;POKEX,M;RETURN
120 IFC=94POKEX,32;X=X-2;POKEX,M;RETURN
125 IF C=87 POKEX,32;X=HEX(EFC0);POKEX,M
130 RETURN
140 STOP
400 PRINT
410 GOTO 700
420 STOP
500 REM WOLKE
513 POKE(X+32),171
514 POKE(X+33),172
530 RETURN
540 STOP
600 OUT.12;PRINT;PRINT;PRINT
610 PRINT'    G O L D R E G E N'
612 PRINT;PRINT
614 PRINT'Ihre Aufgabe besteht darin,'
616 PRINT;PRINT
618 PRINT'soviel wie moeglich, der'
620 PRINT;PRINT
622 PRINT'herabfallenden Dollars zu fangen'
624 PRINT
626 PRINT'sich dabei aber nicht von'
628 PRINT;PRINT
630 PRINT'den Steinen  erschlagen'
632 PRINT;PRINT
634 PRINT'zu lassen!'
636 PRINT;PRINT
638 PRINT'Bewegung mit Tasten S,C und S4';PRINT
640 PRINT
650 PRINT'WEITER MIT  K'
655 Q=HEX(EC60);P=HEX(2000)
657 FORI=4TO20;
659 POKE P+I,PEEK (Q+I)
660 NEXTI
664 FORI=4TO20
666 POKE Q+I,32
668 NEXTI
670 FORI=4TO20
672 POKE Q+I,PEEK (P+I)
674 NEXT I
680 C=IN(2)
682 IF C = 95 GOTO 664
690 RETURN
700 A=0;OUT.12;PRINT
701 PRINT'    von einem Stein erschlagen'
702 FORL=1TO5;TAB(12);PRINT'$$$$$$'
703 NEXT L
710 FOR L=1 TO 5;PRINT'   $$$$$$$$$$$$$$$$$$$$$$$$';NEXT L
720 FOR L=1 TO 18;TAB(12);PRINT'$$$$$$';NEXTL
730 GOTO 80
740 STOP
840 STOP
900 REM ENDEBILD
910 POKEHEX(1C),HEX(EC)
911 POKEHEX(1B),0
912 POKEHEX(1E),HEX(EF)
913 POKEHEX(1D),HEX(FF)
914 POKEHEX(24),0
915 POKEHEX(23),36
916 CALLHEX(F50B)
918 GOSUB990
919 PRINT
920 TAB(10);PRINT''
930 TAB(10);PRINT''
940 TAB(9);PRINT' 00 '
945 GOSUB990
950 TAB(8);PRINT'      '
955 TAB(8);PRINT''
956 PRINT'             '
960 FORI=1TO5
962 POKE-4213,171;POKE-4212,172;FORK=1TO100;NEXTK
963 POKE-4213,129;POKE-4212,128;FORK=1TO100;NEXTK
965 POKE-4213,174;POKE-4212,173
966 FORK=1TO50;NEXTK
969 NEXTI
970 POKE-4245,131
971 POKE-4213,171;POKE-4212,172
980 PRINT'  BIS ZUM NAECHSTEN GOLDREGEN'
982 FORI=1TO5;FORK=0TO2
983 POKE(-4190+K),48
984 FORL=1TO200;NEXTL
985 POKE(-4277),48;NEXTK
986 FOR K=0TO2
987 POKE(-4190+K),131
988 FORL=1TO100;NEXTL;NEXTK;NEXTI
989 OUT.12;GOTO  2000
990 FORI=1TO500;NEXTI
991 RETURN
1000 STOP
2000 PR.;PR.;PR.
2100 PR.'  '
2110 PR.'  Z1013  eagle-SOFTWARE'
2120 PR.'  '
3000 STOP