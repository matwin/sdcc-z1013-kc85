Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

65431 REMKILL nachladen, dann RUN 65432
65432 WSP=768:IF PEEK(WSP)=195 THEN 65433:ELSE WSP=10752:IF PEEK(WSP)=195 THEN 65433:ELSE WSP=11008:DATA'Falken'I/88
65433 RESTORE 65434:MC=DEEK(WSP+221)+5:RESTORE:DOKE MC-192,0:CALL MC:PRINT:PRINT:PRINT "Schon fertig!":PRINT:END
... Rest ist Binärkode
