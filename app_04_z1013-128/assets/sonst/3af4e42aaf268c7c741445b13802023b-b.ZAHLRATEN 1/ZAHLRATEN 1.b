Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

   10 REM ZAHLEN RATEN
   30 GOSUB 600
   70 M=5;GOSUB 700
   80 P."       ZAHLEN RATEN"
   90 M=4;GOSUB 700
  150 P=HEX(EC40);Q=HEX(EC5F)
  160 R=HEX(ED1F);S=HEX(ED00)
  200 FOR A=P TO Q
  210 POKE A,'*'
  220 NEXT A
  230 FOR A=Q TO R STEP 32
  240 POKE A,'*'
  250 NEXT A
  260 FOR A=R TO S STEP -1
  270 POKE A,'*'
  280 NEXT A
  290 FOR A=S TO P STEP -32
  300 POKE A,'*'
  310 NEXT A
  350 POKE HEX(1B),HEX(40);POKE HEX(1C),HEX(ED)
  360 POKE HEX(1D),0;POKE HEX(1E),HEX(F0)
  370 CALL HEX(F6D1)
  400 INP."GROESSTE ZAHL"A
  405 IF A<1 GOTO 400
  410 P.;P."ICH ERMITTLE JETZT EINE"
  415 P.;P."ZAHL ZWISCHEN 0 UND",A
  420 C=RND(A);V=0
  430 P.
  440 V=V+1
  450 INP."RATE DIE ERMITTELTE ZAHL"B
  460 P.
  470 IF C<B P."ZU GROSS";GOTO 430
  480 IF C>B P."ZU KLEIN";GOTO 430
  500 P."RICHTIG",B,"IST DIE GESUCHTE"
  510 P.;P."ZAHL.NACH",V,"VERSUCHEN !"
  520 P.;INP."NEUES SPIEL ?(JA=1,NEIN=0)"D
  530 IF D=1 GOTO 10
  540 IF D#0 GOTO 520
  545 M=10;GOSUB 700
  550 P."   ....AUF WIEDERSEH'N..."
  560 M=12;GOSUB 700
  570 FOR I=1 TO 5000
  575 NEXT I
  580 GOSUB 600
  590 STOP
  600 REM VOLLES FENSTER
  610 POKE HEX(1B),0;POKE HEX(1C),HEX(EC)
  620 POKE HEX(1D),0;POKE HEX(1E),HEX(F0)
  630 CALL HEX(F6D1)
  640 OUTCH.12
  650 RETURN
  700 FOR I=1 TO M
  710 P.
  720 NEXT I
  730 RETURN
 8275 STEP -1