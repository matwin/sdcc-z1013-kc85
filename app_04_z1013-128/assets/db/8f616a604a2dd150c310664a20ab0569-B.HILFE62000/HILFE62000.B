Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

62000 WINDOW:CLS:PRINT:PRINT
62010 PRINT "  *** Umrechnungsprogramm ***":!(c) Dr.Trog, Berlin, Febr.89
62020 PRINT:PRINT "HEX in DEZ      >H":PRINT
62030 PRINT "DEZ in HEX      >D":PRINT 
62040 PRINT "Anzeige DEZ.Adr.>A"
62050 PRINT "(Inhalt in DEZ.)":PRINT
62060 PRINT "Ende            >E":PRINT
62070 I$=INKEY$:IF I$=""THEN 62070
62080 IF I$="H"THEN 62120
62090 IF I$="D"THEN 62170
62100 IF I$="A"THEN 62220
62110 IF I$="E"THEN WINDOW:CLS:END
62120 D=0:INPUT "HEXA";H$:FOR I=1 TO LEN(H$)
62130 Z=ASC(MID$(H$,I,1))
62140 IF Z<58 THEN Z=Z-48:ELSE Z=Z-55
62150 D=Z+D*16:NEXT I
62160 PRINT "DEZ";D:PRINT:GOTO 62280
62170 H$="":INPUT "DEZ";D
62180 R=D-INT(D/16)*16
62190 IF R<10 THEN H$=CHR$(48+R)+H$:ELSE H$=CHR$(55+R)+H$
62200 IF D>15 THEN D=INT(D/16):GOTO 62180
62210 PRINT "HEXA";H$:PRINT:GOTO 62280
62220 PRINT "In Zeile 62190 die DEZ.Adr. aendern!(z.Z. ab 12000)":GOTO 62380
62230 CLS:A=0
62240 FOR Q = 12000 TO 32767  :!ENTER, ^C und RUN 62000
62250 B=PEEK(Q):PRINT Q;PEEK(Q);"     ";CHR$(B) 
62260 A=A+1:IF A=28 THEN GOSUB 62390
62270 NEXT Q
62280 PRINT:PRINT "Weiter HEX >H"
62290 PRINT "Weiter DEZ >D"
62300 PRINT "Weiter Adr.>A"
62310 PRINT "Menue      >M":PRINT
62320 I$=INKEY$:IF I$=""THEN 62320
62330 IF I$="H"THEN 62120
62340 IF I$="D"THEN 62170
62350 IF I$="A"THEN 62220
62360 IF I$="M"THEN 62000
62370 IF I$="J"THEN EDIT 62240:ELSE 62230
62380 PRINT:PRINT "Adr. aendern >J/N<":GOTO 62320
62390 PRINT:PRINT "  >ENTER< (M)enue" :A=0
62400 I$=INKEY$:IF I$=""THEN 62400
62410 IF I$="M"THEN 62000
62420 RETURN
62430 END
