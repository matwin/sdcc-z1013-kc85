Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

    1 WINDOW:CLS
    2 PRINT STRING$(32,""):PRINT
    3 L$="=== 3D - NOUGHT AND CROSSES ===":PRINT L$:PRINT
    4 PRINT SPC(12);"3D-Muehle":PRINT
    5 PRINT STRING$(32,"")
    6 PRINT AT(9,0);" "
    7 PRINT AT(31,10);"(c) by CAsoft 1986"
    8 PAUSE 50
    9 A=10:B=27:F=0
   10 PRINT AT(A,B);" ":X=A+1:Y=B+1
   11 PRINT AT(X,Y);" ":X=A+2
   12 PRINT AT(X,Y);" ":X=A+3
   13 PRINT AT(X,Y);" ":X=A+4
   14 PRINT AT(X,Y);" ":X=A+5:IF F=1 THEN RETURN
   15 PRINT AT(X,Y);" ":X=A+6
   16 PRINT AT(X,Y);" ":X=A+7
   17 PRINT AT(X,Y);" "
   18 PRINT AT(A,B);" ":X=A+1
   19 PRINT AT(X,B);" ":X=A+2:Y=B+1
   20 PRINT AT(X,Y);" ":X=A+3
   21 PRINT AT(X,Y);" ":X=A+4
   22 PRINT AT(X,Y);" ":X=A+5:IF F=2 THEN RETURN
   23 PRINT AT(X,B);" ":X=A+6
   24 PRINT AT(X,B);"  ":X=A+7
   25 PRINT AT(X,B);"  "
   26 F=1:B=B-1
   27 GOSUB 10
   28 Z=B+2:PRINT AT(X,Z);" ":X=A+6
   29 PRINT AT(X,Y);" ":X=A+7
   30 PRINT AT(X,Y);"  ":F=2
   31 GOSUB 18
   32 PRINT AT(X,Y);" ":X=A+6
   33 PRINT AT(X,Y);" ":X=A+7
   34 PRINT AT(X,Y);" ":F=0
   35 B=B-1
   36 IF B<0 THEN 42:ELSE 10
   37 FOR V=0 TO 7
   38 FOR W=0 TO 3
   39 L=10+V:M=B+W:PRINT AT(L,M);" "
   40 NEXT W,V
   41 RETURN
   42 WINDOW 10,17,0,5:CLS:PRINT AT(10,0);" "
   43 PRINT AT(20,0);STRING$(32,"=")
   44 PRINT AT(23,2);"Wuenschen Sie eine Erklaerung?"
   45 FOR A=1 TO 20
   46 IF A/2=INT(A/2)THEN PRINT AT(25,12);"> / <":PAUSE 5
   47 PRINT AT(25,12);">J/N<"
   48 Z$=INKEY$
   49 IF Z$="J"THEN 55
   50 IF Z$="N"THEN 75
   51 NEXT
   52 PRINT AT(25,12);STRING$(5," ")
   53 PRINT AT(23,2);STRING$(30," ")
   54 GOTO 9
   55 WINDOW:CLS:WIDTH 0
   56 PRINT L$
   57 PRINT "Sie sehen gleich einen Wuerfel":PAUSE 30
   58 PRINT "mit 27 moeglichen Positionen":PAUSE 30
   59 PRINT "fuer X oder O.":PAUSE 30
   60 PRINT "Das Ziel ist,moeglichst viele":PAUSE 30
   61 PRINT "vollstaendige Dreierreihen zu":PAUSE 30
   62 PRINT "besetzen.":PAUSE 30
   63 PRINT "Der erste Spieler() hat den":PAUSE 30
   64 PRINT "Vorteil am Ende ein Feld mehr":PAUSE 30
   65 PRINT "besetzen zu koennen.Als Aus-":PAUSE 30
   66 PRINT "gleich darf erst der zweite":PAUSE 30
   67 PRINT "Spieler() das zentrale Feld B5":PAUSE 30
   68 PRINT "besetzen.":PAUSE 30
   69 PRINT:PRINT "Die Zuege werden durch Eingabe":PAUSE 30
   70 PRINT "eines Buchstabens sowie einer":PAUSE 30
   71 PRINT "Zahl eingegeben .":PAUSE 30
   73 PRINT "Bei Eingabe von R beginnt das":PRINT "Spiel von Neuem ."
   74 PAUSE 50
   75 WINDOW
   76 WIDTH 255:CLS:CLEAR 50:PRINT "Darf ich um die Namen der":PRINT
   77 PRINT "Spieler bitten!"
   78 PRINT STRING$(32,"-"):PRINT:PRINT:PRINT
   79 INPUT "Wer spielt mit  ? ===>";M$
   80 PRINT:PRINT:PRINT
   81 INPUT "Wer spielt mit  ? ===>";N$
   82 DIM A(30),Z(30),C(18),R(18),X(30),Y(30)
   83 ZZ$="":ZY$=""
   84 X$="020814020814020814061218061218061218101622101622101622"
   85 Y$="060606121212181818040404101010161616020202080808141414"
   86 FOR Z=1 TO 27
   87 X(Z)=VAL(MID$(X$,2*Z-1,2))
   88 Y(Z)=VAL(MID$(Y$,2*Z-1,2))
   89 NEXT
   90 C$="020405050505060810111111111213131313"
   91 R$="010301020304030109010809100903060912"
   92 FOR Z=1 TO 18
   93 C(Z)=VAL(MID$(C$,2*Z-1,2))
   94 R(Z)=VAL(MID$(R$,2*Z-1,2))
   95 NEXT
   96 FOR Z=1 TO 27:A(Z)=0:NEXT
   97 S=1:N=1
   98 CLS
   99 GOSUB 142
  100 IF S=1 THEN PRINT AT(23,0);ZZ$," Nach"
  101 IF S=-1 THEN PRINT AT(23,0);ZY$," Nach"
  102 PRINT AT(24,0);"------"
  103 PRINT AT(25,0);"===>"
  104 PRINT AT(22,10);STRING$(20," ")
  105 WINDOW 25,25,10,30
  106 INPUT "";Z$:WINDOW:PRINT AT(0,0);" "
  107 IF N=28 THEN PRINT AT(22,10);"Game over":PAUSE 50:GOTO 163
  108 IF LEFT$(Z$,1)="R"THEN 163
  109 IF LEFT$(Z$,1)="A"THEN Z=0 
  110 IF LEFT$(Z$,1)="B"THEN Z=9
  111 IF LEFT$(Z$,1)="C"THEN Z=18
  112 Z=Z+VAL(RIGHT$(Z$,1))
  113 IF A(Z)<>0 THEN 122
  114 IF N=1 AND Z=14 THEN 122
  115 A(Z)=S
  116 N=N+1
  117 IF S=1 THEN PRINT AT(Y(Z)+1,X(Z));ZZ$
  118 IF S=-1 THEN PRINT AT(Y(Z)+1,X(Z));ZY$
  119 GOSUB 124
  120 S=-S
  121 GOTO 100
  122 PRINT AT(22,10);"UNGUELTIG,WIEDERHOLEN!"
  123 GOTO 105
  124 SX=0
  125 SO=0
  126 FOR Z=1 TO 13
  127 W=A(14-Z)+A(14)+A(14+Z)
  128 IF ABS(W)=3 THEN GOSUB 139
  129 NEXT
  130 FOR Z=1 TO 18
  131 W=A(C(Z)-R(Z))+A(C(Z))+A(C(Z)+R(Z))
  132 IF ABS(W)=3 THEN GOSUB 139
  133 V=28-C(Z)
  134 W=A(V-R(Z))+A(V)+A(V+R(Z))
  135 IF ABS(W)=3 THEN GOSUB 139
  136 NEXT
  137 PRINT AT(29,0);"Punkte:  ",LEFT$(M$,10),":",SX,"  ",LEFT$(N$,10),":",SO
  138 RETURN
  139 IF W=3 THEN SX=SX+1
  140 IF W=-3 THEN SO=SO+1
  141 RETURN
  142 PRINT AT(0,6);"3D-NOUGHT AND CROSSES"
  143 PRINT AT(1,0);STRING$(32,"=")
  144 PRINT AT(3,10);"123"
  145 PRINT AT(4,7);"        "
  146 PRINT AT(5,6);"1    2     3   "
  147 PRINT AT(6,3);"            "
  148 PRINT AT(7,2);"123       "
  149 PRINT AT(8,2);"                 "
  150 PRINT AT(9,2);"       4    5     6 "
  151 PRINT AT(10,2);"                 "
  152 PRINT AT(11,2);"   4    5    6   "
  153 PRINT AT(12,2);"                 "
  154 PRINT AT(13,2);"4     5    6       "
  155 PRINT AT(14,2);"                 "
  156 PRINT AT(15,2);"       789    C"
  157 PRINT AT(16,2);"            "
  158 PRINT AT(17,2);"   7     8    9     B"
  159 PRINT AT(18,2);"        "
  160 PRINT AT(19,2);"789     A"
  161 PRINT AT(21,0);STRING$(32,"=")
  162 RETURN
  163 WINDOW:CLS
  164 PRINT AT(10,5);"Noch einmal ? (J/N)":PRINT 
  166 S$=INKEY$
  167 IF S$="J"THEN RUN
  168 IF S$="N"THEN 169 ELSE 166
  169 CLS
