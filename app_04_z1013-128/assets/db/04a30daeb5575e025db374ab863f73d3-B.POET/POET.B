   10 CLS
   11 WINDOW 0,31,0,31
   13 FOR KK=1 TO 3
   15 RESTORE
   30 FOR I=1 TO 10:READ V$(I):NEXT I
   40 FOR I=1 TO 10:READ V3$(I):NEXT I
   50 FOR I=1 TO 10:READ AD$(I):NEXT I
   60 FOR I=1 TO 10:READ A$(I):NEXT I
   70 FOR I=1 TO 10:READ S$(I):NEXT I
   80 FOR I=1 TO 7
   90 READ SR$(I,1),SR$(I,2):NEXT I
  100 FOR I=1 TO 6
  110 READ AR$(I,1),AR$(I,2):NEXT I
  120 FOR I=1 TO 7:READ T$(I):NEXT I
  130 R0=INT(10*RND(1)+1)
  140 R1=INT(10*RND(1)+1)
  150 R2=INT( 7*RND(1)+1)
  160 R3=INT(10*RND(1)+1)
  170 R4=INT(10*RND(1)+1)
  180 R5=INT(10*RND(1)+1)
  190 R6=INT(10*RND(1)+1)
  200 R7=INT( 6*RND(1)+1)
  210 R8=INT(10*RND(1)+1)
  220 R9=INT(10*RND(1)+1)
  240 PRINT T$(1)" "V$(R0)" "T$(2)" "AD$(R1)" "SR$(R2,1)" ?"
  250 PRINT T$(3)" "V$(R3)" "T$(4)" "V$(R5)" "AR$(R7,1)"."
  260 PRINT T$(5)" "A$(R5)" "V3$(R6)" "SR$(R2,2)","
  270 PRINT T$(6)" "T$(7)" "S$(R8)" "V$(R9)" "AR$(R7,2)"!"
  280 DATA brodeln,wehen,fuehlen,weinen,lachen,lieben,saeuseln,wimmern
  290 DATA zittern,beben
  300 DATA hasst,fragt,liebt,weint,sucht,findet,geht,kaut,malt,rettet
  310 DATA roten,blauen,fernen,hohen,edlen,reinen,treuen,holden,freien,lauen
  320 DATA suess,selig,edel,rein,sanft,heiter,stolz,ewig,hold,eifrig
  330 DATA Winde,Sterne,Tage,Engel,Monde,Qualen,Wolken,Welten,Wogen,Herzen
  340 DATA Klagen,der Magen,Voegel,das Segel,Winde,die Linde,Ufer,der Rufer
  350 DATA Tage,die Plage,Rosen,das Kosen,Schritte,die Mitte
  360 DATA grau,lau,selig,froehlich,weit,breit,heiter,weiter,treu,scheu,lang  
  365 DATA bang
  370 DATA Warum,die,sie,und,aber,denn,die
  375 PRINT:PRINT
  377 NEXT KK
  380 J$=INKEY$   
  385 WINDOW 0,19,0,31
  390 IF J$=""THEN 380
  400 RUN
  410 365 DATA bang
