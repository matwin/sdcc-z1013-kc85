5 WINDOW:CLS:GOSUB 11990    
10 GOSUB 5000:WINDOW 0,19,0,31:CLS
100 IF NV=1 THEN 130
105 WINDOW 0,31,0,31
110 ON OZ GOSUB 500,880,590,720,680,640,820,800
120 IF OZ> 8 THEN GOSUB 530
130 WINDOW 30,30,0,31: PRINT "WAS NUN";  
135 PRINT AT(0,0);"SIE HABEN NOCH",WV,"LITER WASSER."
140 GOSUB 300:WV=WV-1:IF WV=0 THEN PRINT "IHR WASSERVORRAT GING ZUENDE,"
145 IF WV=0 THEN PRINT "SIE SIND VERDURSTET.":PAUSE 55:END
150 IF TZ=0 THEN NV=1:GOTO 100
155 IF TZ=1 OR TZ>23 THEN GOSUB 370:NV=0:ELSE GOSUB 400:NV=1
156 IF(TZ=1 AND RV=0)OR(TZ>1 AND TZ<24 AND GV=0)THEN NV=1:GOTO 100
160 ON TZ GOSUB 2000,1440,1390,1330,1280,1180,1220,1220,1180,1200
170 IF TZ>10 THEN ON TZ-10 GOSUB 1150,1070,1070,1070,1030,1200,990,990,990,940
180 IF TZ>20 THEN ON TZ-20 GOSUB 940,930,930,2000,2000,2000,2000
190 GOTO 100
200 PRINT "SIE BESITZEN:":KK=0:K=PV:GOSUB 210:RETURN
210 FG=32:FOR I=1 TO 6
220 IF K<FG THEN H(I)=0:GOTO 250
230 K=K-FG:H(I)=1
240 IF KK=0 THEN PRINT D$(I)
250 FG=FG/2:NEXT:RETURN
300 INPUT I$:IL=LEN(I$):I1$="":TZ=0:FOR I=1 TO IL:A$=MID$(I$,I,1)
310 IF A$=" "THEN 330
320 I1$=I1$+A$
330 NEXT I:I1$=I1$+" ßß":WINDOW 28,31,0,31:CLS
340 FOR I=1 TO 27:IS=INSTR(H$(I),I1$):IF IS=0 THEN NEXT I:ELSE 360
350 PRINT "PARDON, DASS VERSTEHE ICH NICHT.":PAUSE 25:CLS:RETURN
360 TZ=I:RETURN
370 RV=0:FOR I=1 TO 4:IS=INSTR(R$(I),I1$):IF IS=0 THEN NEXT I:ELSE 390
380 PRINT "BITTE HIMMELSRICHTUNG ANGEBEN!":PAUSE 25:CLS:RETURN
390 RV=I:RETURN
400 GV=0:FOR I=1 TO 16:IS=INSTR(G$(I),I1$):IF IS=0 THEN NEXT I:ELSE 420
410 PRINT "DAS GEHT NICHT!":PAUSE 25:CLS:RETURN 
420 GV=I:RETURN
500 CLS:FOR I=1 TO 12:PRINT AT(I+6,0);E$(I+13):NEXT     
505!
510 PRINT AT(29,0);"SIE SIND IN IHREM BASISLAGER."
520 RETURN
530 CLS:VG=OZ/4-INT(OZ/4):IF VG=0 THEN VG=1
531 VG=(VG-.25)*28+1:FOR I=0 TO 6:PRINT AT(I+2,0);A$(VG+I):NEXT
532 IF OZ<9 THEN RETURN
540 PRINT AT(28,0);"IN DER WUESTE"
550 IF OZ=14 THEN K=DV(14):KK=1:GOSUB 210:IF H(3)=1 THEN 570
560 RETURN
570 PRINT AT(29,0);"Hier liegt ein weisses Gewand."
580 RETURN
590 GOSUB 530:FOR I=1 TO 15:PRINT AT(I+5,16);B$(30+I):PRINT AT(I+12,25);B$(I+15)  
600 NEXT:PRINT AT(28,1);"DER WEISSE OBELISK"   
610 K=DV(3):KK=1:GOSUB 210
620 IF H(4)=1 THEN PRINT AT(29,1);"Im Sand liegt ein Kompass."
630 RETURN
640 CLS:FOR I=1 TO 13:PRINT AT(I+5,0);E$(I):NEXT
650 PRINT AT(28,1);"EINE GEISTERSTADT"
660 IF RB=0 THEN PRINT AT(29,0);"Du wirst von Raeubern ueberfallen."
670 RETURN
680 GOSUB 530:FOR I=1 TO 11:PRINT AT(I+8,10);E$(I+25):NEXT
690 PRINT AT(28,1);"Eine SPHINX bewacht diesen Ort."
700 IF SV=0 THEN PRINT AT(29,0);"Sie toetet Dich als Eindringling":PAUSE 55:END
710 RETURN
720 CLS:GOSUB 530:FOR I=7 TO 22:PRINT AT(I-4,18);C$(I):NEXT
730 FOR I=15 TO 29:PRINT AT(I-10,0);B$(I):PRINT AT(I-13,6);B$(I):NEXT
740 FOR I=23 TO 28:PRINT AT(I-1,22);C$(I):PRINT AT(I-3,12);C$(I)
745 PRINT AT(I-1,0);C$(I):NEXT I
750 PRINT AT(28,0);"In der Karawanserei gibt es"
760 PRINT AT(29,1);"Kamele zu kaufen." 
770 K=DV(4):KK=1:GOSUB 210
780 IF H(6)=1 THEN PRINT AT(31,0);"auch ein Schwert wird angeboten."
790 RETURN
800 CLS:GOSUB 530:FOR I=1 TO 6:PRINT AT(I+15,18);C$(I):NEXT
810 PRINT AT(29,1);"Im Sand liegen einige Gerippe.":RETURN
820 CLS:GOSUB 530:FOR I=7 TO 22:PRINT AT(I-3,12);C$(I):NEXT
830 FOR I=32 TO 38:PRINT AT(I-20,20);C$(I):NEXT
840 PRINT AT(27,1);"DAS HAUS DES EINSIEDLERS"
850 PRINT AT(28,0);"der Einsiedler steht in der Tuer "
860 IF SV=0 THEN PRINT AT(29,1);"und bittet um eine Gabe."
870 RETURN
880 CLS:GOSUB 530:FOR I=23 TO 28:PRINT AT(I-1,22);C$(I):NEXT:PAUSE 1
890 FOR I=15 TO 29:PRINT AT(I-1,6);B$(I):PRINT AT(I-14,25);B$(I)
900 PRINT AT(I-12,0);B$(I):NEXT:FOR J=1 TO 10:PRINT AT(J+10,17);B$(J):NEXT
910 PRINT AT(29,6);"EINE OASE MIT BRUNNEN"
920 RETURN
930 WINDOW 0,19,0,31:CLS:PRINT:PRINT:GOSUB 200:RETURN
940 IF OZ<>3 OR GV<>2 THEN PRINT "DAS GEHT NICHT !":RETURN
950 K=PV:KK=1:GOSUB 210    
960 IF H(2)=0 THEN PRINT "WELCHEN SCHLUESSEL?":RETURN
970 IF OB=0 THEN GOSUB 3500
980 IF OB=1 THEN GOSUB 3550
990 IF OZ=8 AND GV=13 OR GV=14 THEN GOSUB 3780 :RETURN
1000 IF OZ=3 AND GV=11 THEN GOSUB 3650:RETURN
1010 IF OZ=5 AND GV=12 THEN GOSUB 3740:RETURN
1020 PRINT "HIER GIBT ES NICHTS ZU SEHEN.":RETURN
1030 IF OZ<>3 OR GV<>1 THEN PRINT "DAS GEHT NICHT. TUT MIR LEID.":RETURN
1040 K=PV:KK=1:GOSUB 210
1050 IF H(1)=0 THEN PRINT "WELCHEN DIAMANTEN?":RETURN
1060 OB=1:PRINT "ERLEDIGT!!":PV=PV-32:PRINT AT(14,17);"Ï":RETURN        
1070 IF OZ<>6 OR(GV<>9 AND GV<>10)THEN PRINT "DIES IST UNMOEGLICH.":RETURN
1080 IF TZ=12 AND GV<>10 THEN PRINT "WEN WOLLEN SIE VERTEIDIGEN?":RETURN
1090 IF TZ>12 AND GV<>9 THEN PRINT "WAS HABEN SIE VOR?":RETURN
1100 K=PV:KK=1:GOSUB 210
1110 IF H(6)=0 THEN PRINT "Sie hatten keine Waffe bei sich..."
1120 IF H(6)=0 THEN PRINT "und wurden leider getoetet !":PAUSE 55:WINDOW:CLS:END
1130 RB=1:PRINT "Sie haben die Raeuber besiegt !"
1140 RETURN
1150 K=PV:KK=1:GOSUB 210
1160 IF H(GV)=0 THEN PRINT "DAS HABEN SIE NICHT.":RETURN
1170 PRINT "OKAY!!":PV=PV-GV(GV):DV(OZ)=DV(OZ)+GV(GV):RETURN
1180 IF OZ<>5 OR GV<>8 THEN PRINT "DAS IST UNNOETIG.":RETURN
1190 SV=2:PRINT " Die SPHINX ist gereizt gestimmt.":RETURN
1200 IF OZ<>2 OR GV<>7 THEN PRINT "DAS GEHT NICHT.":RETURN
1210 WV=30:PRINT "Sie haben wieder Wasservorrat.":RETURN
1220 IF OZ<>5 AND(GV<>5 OR GV<>2)THEN PRINT "PARDON, ICH VERSTEHE NICHT.":RETURN
1230 K=DV(5):KK=1:GOSUB 210:IF H(2)=0 THEN PRINT "ES IST NICHTS DA!":RETURN
1240 K=PV:KK=1:GOSUB 210:IF H(5)=0 THEN PRINT "WEN WOLLEN SIE BELADEN?":RETURN
1250 IF SV<2 THEN PRINT " Die SPHINX toetet den Dieb.":PAUSE 55:WINDOW:CLS:END
1260 PV=PV+16:DV(5)=DV(5)-16
1270 PRINT "Der Schluessel gehoert nun Ihnen":RETURN
1280 IF OZ<>7 OR GV<>3 THEN PRINT "DAS IST NICHT DRIN.":RETURN
1290 K=PV:KK=1:GOSUB 210
1300 IF H(3)=0 THEN PRINT "WELCHES GEWAND?":RETURN
1310 EV=1:PRINT AT(28,0);"Der Einsiedler ist nun bereit"
1320 PRINT AT(29,0);"Dir zu antworten.":RETURN
1330 IF OZ<>7 OR GV<>15 THEN PRINT "DAS KOENNEN SIE NICHT TUN.":RETURN    
1340 IF EV=0 THEN PRINT AT(28,0); "Der Einsiedler schweigt verbissen":RETURN
1345 WINDOW:CLS:WINDOW 13,20,0,31      
1350 SV=1:PRINT "DER EINSIEDLER VERRAET DIR"
1360 PRINT "EINEN ZAUBERSPRUCH. AUSSERDEM "
1370 PRINT "RAET ER, DEN WEISSEN OBELISK ZU" 
1380 PRINT "SUCHEN":PRINT "DORT SOLL DER SCHATZ RUHEN!":PAUSE 50:RETURN
1390 IF OZ<>4 OR(GV<>5 AND GV<>6)THEN PRINT "SO GEHT ES NICHT.":RETURN
1400 K=DV(OZ):KK=1:GOSUB 210
1410 IF H(GV)=0 THEN PRINT "Das ist bereits ausverkauft !":RETURN
1420 PRINT "Der Haendler gibt es Ihnen.":PV=PV+GV(GV)
1430 DV(OZ)=DV(OZ)-GV(GV):RETURN
1440 IF GV=2 THEN PRINT "Den Schluessel koennen Sie nicht allein tragen.": RETURN
1450 IF GV>6 THEN PRINT "DAS IST NICHT MOEGLICH.":RETURN
1460 IF GV>4 THEN PRINT "Dagegen hat der Haendler etwas!":RETURN
1470 K=DV(OZ):KK=1:GOSUB 210
1480 IF H(GV)=0 THEN PRINT "DAS GIBT ES HIER GAR NICHT.":RETURN
1490 PRINT "OKAY!":PV=PV+GV(GV):DV(OZ)=DV(OZ)-GV(GV):RETURN
2000 NV=0:ON OZ GOTO 2030,2080,2120,2170,2230,2270,2340,2400
2010 IF OZ>8 THEN ON OZ-8 GOTO 2440,2480,2540,2580,2630,2680,2710,2750
2020 RETURN
2030 ON RV GOTO 2040,2050,2060,2070
2040 OZ=10:RETURN
2050 PRINT "DORTHIN BRAUCHEN SIE NICHT GEHEN.":PAUSE 40:CLS:RETURN  
2060 OZ=9:RETURN
2070 OZ=11:RETURN
2080 ON RV GOTO 2090,2100,2050,2110
2090 OZ=5:RETURN
2100 OZ=9:RETURN
2110 OZ=3:RETURN
2120 ON RV GOTO 2130,2140,2150,2160
2130 OZ=13:RETURN
2140 OZ=10:RETURN
2150 OZ=2:RETURN
2160 OZ=12:RETURN
2170 ON RV GOTO 2180,2190,2200,2210
2180 OZ=14:RETURN
2190 OZ=11:RETURN
2200 OZ=12:RETURN
2210  BEEP:PRINT "Sie fielen in ein Loch voll":PRINT "    T R E I B S A N D "
2220 PRINT "....Ruhen Sie in Frieden !":PAUSE 50:WINDOW:CLS:END
2230 ON RV GOTO 2240,2250,2050,2260
2240 OZ=15:RETURN
2250 OZ=2:RETURN
2260 OZ=13:RETURN
2270 IF RB=1 THEN ON RV GOTO 2300,2310,2320,2330
2280 PRINT "Die Raeuber haben Sie nicht"
2290 PRINT "einfach gehen lassen.":PRINT "Nun ist's aus.":PAUSE 55:WINDOW:CLS:END
2300 OZ=7:RETURN
2310 OZ=12:RETURN
2320 OZ=13:RETURN
2330 OZ=14:RETURN
2340 ON RV GOTO 2050,2350,2360,2380
2350 OZ=6:RETURN
2360 BEEP:BEEP:PRINT "Es war einmal ein Loewe ...":PAUSE 20:PRINT             
2365 PRINT "Er hatte eine hungrige Familie":PAUSE 20:PRINT
2370 PRINT "Sie wurden leider sein Opfer (!)":PAUSE 50:WINDOW:CLS:END
2380 BEEP:BEEP:PRINT "Bis heute weiss leider keiner...":PAUSE 20
2385 PRINT "wohin Sie sich in der":PAUSE 20:PRINT
2390 PRINT "Wueste verirrt haben.":PAUSE 50:WINDOW:CLS:END
2400 K=PV:KK=1:GOSUB 210
2410 IF H(4)=1 THEN ON RV GOTO 2380,2430,2210,2050
2420 PRINT "SIE LAUFEN IM KREISE!":PAUSE 10:RETURN
2430 OZ=15:RETURN
2440 ON RV GOTO 2450,2050,2460,2470
2450 OZ=3:RETURN
2460 OZ=2:RETURN
2470 OZ=1:RETURN
2480 ON RV GOTO 2490,2500,2510,2050
2490 OZ=3:RETURN
2500 OZ=1:RETURN
2510 BEEP:PRINT "Man fand Sie drei Wochen spaeter":PAUSE 20
2520 PRINT "tot unter einen Felsen.":PAUSE 20:PRINT
2530 PRINT "Sie sind leider abgestuerzt !":PAUSE 55:WINDOW:CLS:END
2540 ON RV GOTO 2550,2050,2560,2570
2550 OZ=10:RETURN
2560 OZ=1:RETURN
2570 OZ=4:RETURN
2580 ON RV GOTO 2590,2600,2610,2620
2590 OZ=6:RETURN
2600 OZ=11:RETURN
2610 OZ=3:RETURN
2620 OZ=4:RETURN
2630 ON RV GOTO 2640,2650,2660,2670
2640 OZ=16:RETURN
2650 OZ=3:RETURN
2660 OZ=5:RETURN
2670 OZ=6:RETURN
2680 ON RV GOTO 2050,2690,2700,2210
2690 OZ=4:RETURN
2700 OZ=6:RETURN
2710 ON RV GOTO 2720,2730,2050,2740
2720 OZ=8:RETURN
2730 OZ=5:RETURN
2740 OZ=16:RETURN
2750 ON RV GOTO 2760,2780,2790,2800
2760 PRINT "Sie wurden auf der Wuestenstrasse" 
2770 PRINT "vom einzigen Auto in der Woche":PRINT "ueberfahren.":PAUSE 55:END   
2780 OZ=13:RETURN
2790 OZ=15:RETURN
2800 OZ=6:RETURN
3500 WINDOW 0,19,0,31:CLS
3510 PRINT "unter Ihnen oeffnet":PRINT "sich ploetzlich der Boden":PAUSE 20:PRINT
3520 PRINT "und Sie stuerzen in eine Grube":PAUSE 20:PRINT
3530 PRINT "in der giftige Schlangen schon":PRINT
3540 PRINT "auf Sie warten... ":PAUSE 55:WINDOW:CLS:END
3550 GOSUB 13000:PAUSE 30:WINDOW:CLS:WINDOW 5,31,0,31
3560 PRINT "WIE VON GEISTERHAND BEWEGT,":PAUSE 20:PRINT
3570 PRINT "SINKT DER WEISSE OBELISK":PAUSE 20:PRINT "LANGSAM IN DEN SAND EIN." 
3580 PRINT:PAUSE 20:PRINT "AN SEINER STELLE ERSCHEINT":PAUSE 20
3590 PRINT "KURZE ZEIT DANACH DER SCHATZ,":PAUSE 20:PRINT: PRINT "NACH DEM SIE SO"
3600 PRINT "LANGE GESUCHT HABEN. ":PAUSE 20:PRINT:PRINT "  SOLCH EIN GLUECK":PAUSE 2
3610 PRINT "HAT MAN IM LEBEN NUR EINMAL !":PAUSE 30:PRINT
3620 PRINT "SIE SOLLTEN ALLEN":PAUSE 30
3630 PRINT "EINEN AUSGEBEN , MEIN FREUND !!":PAUSE 50:PRINT "(c) RO":END 
3650 WINDOW 0,19,0,31:CLS
3660 PRINT:PRINT: PRINT "SIE SEHEN DEN WEISSEN OBELISKEN."
3670 PRINT "AUF SEINER VORDERSEITE IST DAS"
3680 PRINT "BILD EINER GOTTHEIT DARGESTELLT."
3690 PRINT "ALLERDINGS FEHLT DIESEM GOTT"
3700 PRINT "EINES SEINER DIAMANTENEN AUGEN."
3710 PRINT "DER WEIT GEOEFFNETE MUND":PRINT "ERINNERT AN EIN SCHLUESSELLOCH"
3720 PRINT "ABER FUER EINEN GIGANTISCHEN":PRINT "S C H L U E S S E L .
3730 RETURN
3740 K=DV(5):KK=1:GOSUB 210
3750 IF H(2)=0 THEN PRINT "HIER GIBT ES NUR DIE SPHINX .":RETURN
3760 PRINT AT(28,0);"DIE SPHINX BEWACHT EINEN GROSSEN"
3770 PRINT AT(29,0);"STEINERNEN SCHLUESSEL.":RETURN
3780 K=DV(8):KK=1:GOSUB 210
3790 IF H(1)=0 THEN PRINT "HIER IST NICHTS MEHR ZU SEHEN.":RETURN
3800 PRINT "Im Sand liegt ein Diamant.":RETURN
5000 DATA "                                 " 
5010 DATA "             ø   ø        øøøø " 
5020 DATA "                        ø       " 
5030 DATA "                         "
5040 DATA "                                 "
5050 DATA "        ø                  "
5060 DATA "                 øø           "
5070 DIM A$(28):RESTORE 5000:FOR I=1 TO 7:READ A$(I):NEXT
5080 DATA "ÿÿÿÿÿÿÿ ø","ÿÿ¾ÿÿ","  ¾"
5090 DATA "´    µ","½¼¾ÿ½ÿ¼","  ÿÿ"
5100 DATA "´ µ´  µ"," ¾ÿ½"," ¾ÿÿ"
5110 DATA "´ ÿÿ  µ","¾ÿ¼ ÿ"," ÿÿÿÿ"
5120 DATA "´     µ","ÿ¼´µÿÿ"," ÿÿÿÿ"
5130 DATA "»ºÿÿÿ»º","  ´µ ÿ¼"," ÿÿÿÿ"
5140 DATA "ÿ¼½ÿ","  ´µ","ºÿÿÿÿ»"
5150 DATA "ÿ»øøøºÿ","  ´µ","ÿ®­ÿ"
5160 DATA "ÿÿÿÿÿÿÿ","  ´µ","ÿÏÿ"
5170 DATA "ÿÿÿÿÿÿÿ","  ´µ","ÿ  ÿ"
5180 DATA "","  ´µ","ÿ  ÿ"    
5190 DATA "","  ´µ","ÿ«øø¬ÿ" 
5200 DATA "","  ´µ","ÿÿÿÿÿÿ"
5210 DATA ""," ¾´µ","ÇÇÇÇÇÇ"
5220 DATA ""," ÿÿÿÿ","ÇÇÇÇÇÇ"
5230 DIM B$(45):FOR I=1 TO 15:READ B$(I),B$(I+15),B$(I+30):NEXT I
5240 DATA "        ½ ¼ "
5250 DATA "      ô è "
5260 DATA "¡   Ï    "
5270 DATA "  À   ¡  "
5280 DATA "  ¡ "
5290 DATA "     ¡ "
5300 DATA "      ¾      ","  "
5310 DATA "     ¾ÿÿ     ","     "
5320 DATA "    ¾ÿÿÿÿ    ","  ø  ø"
5330 DATA "   ¾ÿÿÿÿÿÿ   ","    "
5340 DATA "  ¾ÿÿÿÿÿÿÿÿ  ","  À  "
5350 DATA " ¾ÿÿÿÿÿÿÿÿÿÿ ","    ¡"
5360 DATA "¾ÿÿÿÿÿÿÿÿÿÿÿÿ",""
5370 DATA "ÆÆÆÆÆÆÆÆÆÆÆÆÆÆ",""
5380 DATA "ÿÿ   ÿÿÿ     ÿ",""
5390 DATA "ÿÿ   ÿÿÿ     ÿ"," ®­ "
5400 DATA "ÿÿ   ÿÿÿ     ÿ"," «¬À"
5410 DATA "ÿÿ   ÿÿÿ     ÿ"," ¾"
5420 DATA "ÿÿÿÿÿÿÿÿ     ÿ","ÿÿ "
5430 DATA "ÿÿÿÿÿÿÿÿ     ÿ","¡ÿÿ "
5440 DATA "ÿÿÿÿÿÿÿÿ     ÿ"," ´µ "
5450 DATA "ÆÆÆÆÆÆÆÆ·····ÿ","²´µ³"
5460 DIM C$(38):FOR I=1 TO 6:READ C$(I):NEXT
5470 FOR I=7 TO 22:READ C$(I),C$(I+16):NEXT I
5480 DATA "  ¾          ¾     ¾        "
5490 DATA " ¾ÿÿ        ¾ÿÿ   ¾ ÿ¾     "  
5500 DATA "¾ÿÿÿÿ      ¾ÇÇÇÇ ¾ÿ ÿ¾ÿÿ    " 
5510 DATA "ÿÿÿÿÿÿ      ÇÇÇÇÇÇ ÿÿ ÿÿÿÿÿ   " 
5520 DATA "ÿÿÿÿÿ¾   ÿÿÿÿÿÿ Ç ÿÿ¾ÿÿÿÿÿÿ  "
5530 DATA "ÿÿÿÿ¾ÿ    ÿÿÿÿÿÿÿÇ ÿ¾ÿÿÿÿÿÿÿÿ "
5540 DATA "   ¾ÿÿÿÿ ÿÿÿÿÿÿÿ  ¾ÿÿÿÿÿÿÿÿÿÿ"
5550 DATA "  ¾ÿÿÿÿÿÿ ÅÅÅÅÅÅÅ  ÿÿÿÿÿÿÿÿÿÿÿ "
5560 DATA " ¾ÿÿÿÿÿÿÿ Å    ÅÅ  ÿÿ ÿÿÿ   ÿÿÿ"
5570 DATA " ÿÿÿÿÿÿÿÿ Å    ÅÅ  ÿÿÿÿÿÿ     ÿ"
5580 DATA " ÿÿÿÿÿ  ÿ ÅÅÅÅÅÅÅ  ÿÿÿÿÿÿ     ÿ"
5590 DATA " ÿÿÿÿÿ  ÿ Å     Å  ÿÿÿÿÿÿ   ÿÿÿ"
5600 DATA " ÿÿÿÿÿ  ÿ ÅÅÅÅÅÅÅ  ÿÿÿÿÿÿ   ÿÿÿ"
5610 DIM E$(40):FOR I=1 TO 13:READ E$(I):NEXT
5620 DATA "    ¾   ¾     ¾     ¾  "
5630 DATA "   ¾ÿÿ ¾ÿÿ   ¾ÿÿ   ¾ÿÿ "
5640 DATA " ¾ÿÿÿÿ¾ÿÿÿÿ ¾ÿÿÿÿ ¾ÿÿÿÿ"
5650 DATA "¾ÿÿÿÿ¾ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
5660 DATA "ÿÿÿÿ¾ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
5670 DATA "ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
5680 DATA "ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
5690 DATA "ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
5700 DATA "ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ        " 
5710 DATA "ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ"
5720 DATA "ÿÿÿÿÿÿÿÿÿÿ              "
5730 DATA "ÿÿÿÿÿÿÿÿÿÿÿ"
5740 FOR I=14 TO 25:READ E$(I):NEXT
5750 DATA "   "
5760 DATA "     " 
5770 DATA " À    "
5780 DATA "      "
5790 DATA "       øøø"
5800 DATA "  ø        "
5810 DATA "     À          "
5820 DATA "                 "
5830 DATA " øø       øøøøø­"
5840 DATA "     ø  À   ø    À"
5850 DATA "øø   øøø øøø¬"
5860 FOR I=26 TO 36:READ E$(I):NEXT
5870 DATA "                                 "
5880 DATA "          øøø            ø    "
5890 DATA "                                "
5900 DATA "               øøø              "
5910 DATA "        ø                     "
5920 DATA "           øø                    "
5930 DATA "                                  "
5940 DATA "                                       "
5950 DATA "                                       "
5960 DATA "              ø  øøøøøø         øø"
5970 DATA "      øøøø               øø    "
5980 DATA "                     øø     "
5990 DATA "      øø      øøøø              "
6000 DATA "                                      "
6010 DATA "         øøø       øøøø         "
6020 DATA "                             "
6030 DATA "                         øøø "
6040 DATA "                                "
6050 DATA "                                  "
6060 DATA "                              "
6070 DATA "             ø"
6080 FOR I=8 TO 28:READ A$(I):NEXT
10000 WV=30:SV=0:RB=0:OB=0:DIM G$(16),D$(16),H$(27),H(16),GV(16),DV(16):OZ=1
10010 DATA "NORD","SUED","OST","WEST":FOR I=1 TO 4:READ R$(I):H$(I+23)=R$(I):NEXT
10020 DATA "GEHE","NEHME","KAUFE","FRAGE","GEBE","SAGE","LADE","BELADE","ANTW" 
10030 DATA "SCHOEPF","WERFE","VERTEI","VERTREI","TOETE","SETZE","FUELLE"
10040 DATA "SCHAU","SEHE","BLICK","FUEHRE","SCHLUES","HABE","BESITZ"
10050 FOR I=1 TO 23:READ H$(I):NEXT
10060 DATA "DIAMANT","EINEN GROSSEN DIAMANTEN",32
10070 DATA "SCHLUESSEL","EINEN STEINERNEN SCHLUESSEL"
10080 DATA 16,"GEWAND","EIN WEISSES GEWAND",8,"KOMPASS","EINEN KOMPASS",4
10090 DATA "KAMEL","EIN GUTES KAMEL",2,"SCHWERT","EIN SCHARFES SCHWERT",1
10100 DATA "WASSER","",0,"SPRUCH","",0,"RAEUBER","",0,"MICH","",0
10110 DATA "OBELISK","",0,"SPHIN","",0,"GERIPP","",0,"SAND","",0,"EINSIED","",0
10115 DATA "WAS","",0
10120 FOR I=1 TO 16:READ G$(I),D$(I),GV(I):NEXT
10130 DV(3)=4:DV(4)=3:DV(5)=16:DV(8)=32:DV(14)=8 
10140 PV=0:RETURN
10150 NEW
11990 PRINT
12000 FOR I=0 TO 31: PRINT STRING$(31,"Ï"):NEXT               
12001 I=2:K=1 
12002 FOR K=1 TO 13 :WINDOW I,I+1,K,K+1
12003 ON K GOSUB 12005,12006,12007,12008,12009,12010,12011,12012,12013  
12004 PAUSE 5:NEXT :GOTO 12500
12005 PRINT "R":RETURN
12006 PRINT "O":RETURN
12007 PRINT " ":RETURN
12008 PRINT "1":RETURN
12009 PRINT "1":RETURN
12010 PRINT "/":RETURN
12011 PRINT "8":RETURN
12012 PRINT "8":RETURN
12013 PRINT "*":RETURN
12500 WINDOW 5,26,1,29:CLS:PAUSE 20
12510 PRINT:PRINT "   TEXTADVENTURE - WUESTE":PAUSE 10
12511 PRINT AT(11,3);" Game :M. Siedentopf"
12512 PRINT AT(15,4);"Version Z1013 : K. Rothe":PAUSE 10
12513 PRINT AT(22,4);"ausfuehrl. Erlaeuterung":PRINT AT(23,4);"ueber EDITEX File
12514 PAUSE 50:PAUSE 10
12515 WINDOW 9,26,2,29:CLS:PRINT "Gehen Sie auf die Suche":PRINT
12516 PRINT "nach dem in der Wueste":PRINT "RUROMI verborgenen Schatz .":PRINT
12517 PRINT "Wagen Sie das Abenteuer,":PRINT "von dem vor Ihnen":PRINT
12518 PRINT "bisher keiner zurueckkehrte.":PAUSE 100:CLS
12519 PRINT "Lassen Sie sich fesseln":PRINT "      von diesem":PRINT     
12520 PRINT "  TEXTADVENTURE - GAME,":PRINT:PRINT "Das Ihnen ein Raetsel nach "
12521 PRINT "dem anderen aufgeben wird !":PRINT "Aber verzweifeln Sie nicht ,";
12522 PRINT "wenn Sie beim ersten Anlauf":PRINT "scheitern !"
12523 PRINT "Nur Phantasie kann Ihnen ":PRINT "helfen und natuerlich die"
12524 PRINT "ausfuehrliche Beschreibung"
12525 PRINT "ueber Textfile EDITEX.":PAUSE 150
12527 FOR I=0 TO 500:PRINT AT((RND(1)*31),(RND(1)*31));"":NEXT:WINDOW:CLS      
12528 CLS:PRINT "Bei RAM = oder < 16k ---> ZEILE 12529 scharfmachen und RUN"   
12529!DELETE 12000,12529
12530 RETURN
13000 FOR K=1 TO 16   
13010 FOR I=1 TO K:PRINT AT(I+3,16);"       ":NEXT
13020 FOR J=1 TO 15-K:PRINT AT(J+K+3,16);B$(30+J):NEXT
13030 NEXT
13040 F$(1)="¼¶¶¶¶¶¶½"
13050 F$(2)="´      µ"
13060 F$(3)="»øø®­øøº"
13070 F$(4)="¼  «¬  ½"
13080 F$(5)="»······º"
13090 F$(6)="ÇÇÇÇÇÇÇÇ"
13100 F$(7)="ÇÇÇÇÇÇÇÇ"
13110 FOR K=1 TO 7
13120 FOR I=1 TO K:PRINT AT(I-K+14,16);F$(I):NEXT I
13130 PAUSE 1:NEXT K:RETURN
