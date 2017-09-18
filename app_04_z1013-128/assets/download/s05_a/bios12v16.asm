PN	BIOS-Disk     
;****************************************
;CPM-BIOS fuer Z1013 nach "Kramer+Brosig"
;            
;VERS. 1.16 "ROM-Version 64 ZEICHEN"
;
;  CBIOS FUER DC-MONITOR-Zimmermann
;                       
;****************************************
;
;
;       DEFINITION VON KONSTANTEN
;
;
;
AKTLW:	EQU	4
SOIL:	EQU	00016H	;START OF INPUT LINE
CURSR:	EQU	0002BH
BWSA:	EQU	0EC00H	;BILDW.-SP.-ANF.
BWSE:	EQU	0EFFFH	;ENDE
MON:	EQU	0F000H	;MONITOR-RET
BOS:	EQU	0D006H
BEEP:	EQU	0FFDCH
DRAKK:	EQU	0FFE8H
CZSP:	EQU	1FH	;CURSOR-ZWISCHEN-SP.
SPALT:	EQU	64	;BS-SPALTENZAHL
ZL:	EQU	SPALT	;ZEILENLAENGE
BSTAB:	EQU	47H
;
;
CFDC:	EQU	7CH	;STEURRUNG FDC
DFDC:	EQU	7DH	;DATEN FDC
TC:	EQU	78H	;TERMINAL COUNT
;                       ; (ENDE-IMPULS)
NDISK:	EQU	2	;ANZAHL LAUFWERKE
;                       ; 1 IM RAM SIMUL.
LF:	EQU	0AH
ROM:	EQU 	0DE00H
BDOS:	EQU	0D006H
CCP:	EQU	0C800H
RDSK:	EQU     7000H	;IM RAM SIMU-
;                       LIERTE FLOPPY
;****************************************
;
	ORG	0DE00H
;
BIOS:	JMP	BOOT
WBOTE:	JMP	WBOOT
	JMP	CONST    ;TASTSTAT.
;                       ; MCSTS   
	JMP	CONIN   ;TASTABFRAGE
;                       ;CIO
	JMP	COOUT   ;ZEICHENAUSGABE
;                       ;MCO
	JMP	LIST    ;DRUCK
	JMP	PUNCH   ;MWO
	JMP	READR   ;MRI
	JMP	HOME
	JMP	SDISK
	JMP	STRCK
	JMP	SSEC
	JMP	SDMA
	JMP	READ
	JMP	WRITE
	JMP	LSTS	;LISTER STATUS
	JMP 	STRAN	;SECTOR TRANSFOR-
;                       ;MATION
;	  
;****************************************	   
;    
;KOPF AUF SPUR NULL EINSTELLEN
;
;****************************************
;
HOME:	LD	BC,0
	JR	STRCK-#
;
;LAUFWERK AUSWAEHLEN
;IN: C LAUFWERK (A ODER B)
;OUT: HL DPH- VEKTOR
;
SDISK:	LD	HL,0	;FEHLER
	PUSH	BC
	LD	B,0
	LD	A,C
	CMP	NDISK  
DISKS:	EQU	#-1
	JRNC	FEHL-#	;FEHLER-AUSGABE
	LD	L,C
	LD	H,B
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL	;*16
	LD	DE,DPBAS;DPH-VEKTOR 1.LW
	ADD	HL,DE
	LD	(AKTLW),A;  (04)	 
NVORH:	POP	BC
	RET
FEHL:	CALL	RESTR
	JR	NVORH-#
;
STRAN:	EQU	#	;SECTOR TRANSFOR.
;
;IN:BC LOG. SECTOR
;   DE TABELLE
;
	LD	B,0
	LD 	A,D	;DE=0 KEINE TRANS-
;                       ;FORMATION
	OR	A
	JRNZ	STRN1-#
	LD	H,B
	LD	L,C
	INC	HL	
	RET
STRN1:	EX	DE,HL
	ADD	HL,BC
	LD	A,(HL)	;NEUE NR.
	LD	(SEC1),A
	LD	L,A
	RET
;
;SECTOR EINSTELLEN
;IN: C SECTOR
;OUT: (SEC1)=C
;
SSEC:	EQU	#
	LD	HL,SEC1
 	LD	M,C
	RET
;
;SPUR ANWAEHLEN
;IN: C SPUR
;OUT (TRACK)=C
;
STRCK:	EQU	#
	LD	HL,TRACK
	LD	M,C
	RET
;
; DMA SETZEN
;IN: BC DMA
;
SDMA:	LD	(DMA),BC
	RET
;
;
;
MT1:	DB	0CH,0DH,0AH,0AH
	DB	' CP/M 2.2 Z1013-ZI./DC '       
	DB	0DH,0AH
	DB	' mit 1.2 Disk.-Laufwerk '
	DB	0DH,0AH
	DB	' CCP wird von Disk geladen '
        DB      0DH,0AH,0AH
	DB	' Ramdisk ? (Y/N) : ',0 
MT2:	DB	0DH,0AH,0AH
	DB	' weiter mit CP/M ? (Enter) '     
    	DB	0DH,0AH
	DB	' (N) Nein '                     
	DB	0DH,0AH
	DB	' (n) Neustart ? : ',0 ',0
MT3:	DB	0DH,0AH,0AH
	DB	' Error '         
	DB	0DH,0AH,0AH,0
MT4:	DB	0DH,0AH,0AH
	DB	' Ramdisk loeschen ? (Y/N) : ',0
;
;
;****************************************
;CCP UND BDOS VON DER ERSTEN SPUR DER
;            DISKETTE LADEN 
;****************************************
;
;
BOOT:	LD	HL,AN1	;COPY SCHREIBEN
	LD	DE,0E800H
	LD	BC,80 	;UND LESEN !!
	LDIR
	LD	HL,AN2	;COPY ARBEITS-
	LD	DE,0E900H
	LD	BC,250H	;ZELLEN
	LDIR
     	CALL    INIT
	LD	A,0C3H
	LD	(0),A
	LD	HL,WBOTE
	LD	(1),HL
	LD	(5),A
	LD	HL,BDOS
	LD	(6),HL
	LD	(38H),A	;HALTEPKT.
;			;VORBEREITEN
	LD	HL,RESTR
	LD	(39H),HL
	LD	DE,MT1
	CALL	OUT$
BO1:	CALL	CONIN
	CMP	'Y'
	JRZ	IRDSA-#
	CMP	'N'
	JRZ	BO3-#
	JRNZ	BO1-#
BO3:	XOR	A
	LD	(3),A	;IO BYTE
	LD	(4),A
	JR	WBOO1-#
;
;
WBOOT:  EQU	#	;LESEN DER SYSTEM-
;                       ;SEKTOREN
	LD	DE,MT2
	CALL	OUT$
WBO1:	CALL	CONIN
	CMP	0DH 
	JPZ	GOCPM   
	CMP	'N'
	JPZ	MON   
	CMP	'n'     ;NEUSTART
	JRZ	BOOT-#
	JRNZ	WBO1-#
WBOO1:	LD	SP,80H
	CALL	INIFD	;INIT. FLOPPY CON-
;			;TROLLER
	LD	C,0	;LAUFWERK
	CALL	SDISK
	LD	B,2CH	;SEKTORZAEHLER
	LD	C,0	;SPUR-NR.
	CALL	STRCK
	LD	D,1	;SEKTOR 
	LD	HL,CCP	;LADEZIEL
LOAD1:	PUSH	BC	;NAECHSTEN SEKT.
	PUSH	DE
	PUSH	HL
	LD	C,D
	CALL	SSEC	;NEUEN SEKTOR-
;                       ;ANWAEHLEN
	POP	BC	;BC LADEADRESSE
	PUSH	BC	;LADEADR.RETTEN
	CALL	SDMA
	CALL	RFLOP	;SYSTEM RAUF-
;                       ;SCHREIBEN:WFLOP
;			;EINSETZEN
	CMP	0	;FEHLER ?
	CANZ	RESTR	;JA
	POP	HL
	LD	DE,128
	ADD	HL,DE	;LADEADR. ER-
;			;HOEHEN
	POP	DE
	POP     BC
	DEC	B	;SEKTORZAHL-1
	JRZ	GOCPM-#
	INC	D	;NAECHSTEN SEK-
;			;TOR
	LD	A,D
	CMP	21H	;LETZTER ?
	JRC	LOAD1-#
	LD	D,1	;1.SEKTOR NAECHST
;			;SPUR
	INC	C
	PUSH    BC
	PUSH	DE
	PUSH    HL
	CALL	STRCK
	POP	HL
	POP	DE
	POP	BC
	JR	LOAD1-#
IRDSA:	CALL	RFDEL	;RAMDISK LOESCHEN
      	CALL	IRDSK
	JMP	BO3	
;
;****************************************
;
IRDSK:  LD	HL,0DE00H;RAMDISK
;		       	;INITIALISIEREN
	LD	DE,RDSK	;RAM_DISK
	LD	BC,51
	LDIR
	LD	HL,7003H;SPRRUNG ZUM CCP
	LD	(1),HL
	LD	A,2
	LD	(DISKS),A
	LD	HL,6206H;BDOS_SPRUNG
	LD	(6),HL
	LD	A,0C3H
	LD	M,A
	LD	HL,BDOS
	LD	(6207H),HL
	RET
;
;****************************************
;RAMDISK LOESCHEN
;****************************************
;
RFDEL:	LD      DE,MT4
        CALL	OUT$
RF1:    CALL	CONIN
	CMP     'Y'
	JRZ     RF2-#
	CMP     'N'
	RZ        
	JRNZ    RF1-#
RF2:    LD 	A,0E5H
	LD	HL,7000H
	LD	M,A     
	LD      DE,7001H
        LD	BC,57F0H
	LDIR
	RET
;
;****************************************
;
GOCPM:	LD	BC,80H
	CALL	SDMA
	LD	A,(AKTLW)
	LD	C,A
	JMP	CCP
;
;****************************************
;
WRITE:	LD	A,(4)
	OR	A
	JRZ	WFLOP-#
	CALL	WRDSK
	RET
READ:	LD	A,(4)
	OR	A
	JRZ	RFLOP-#
	CALL	RRDSK	;RAM_DISK
	RET
;
;****************************************
;
;FLOPPY LESEN MIT SEKTORAUFLOESUNG
;IN: SEC1, TRACK, DMA V. BDOS
;OUT: DMA/BDOS=1/2ZDMA/FLOPPY
;
RFLOP:	PUSH	HL
	PUSH	DE
	PUSH	BC
;
;VERGLEICH OB AUS PUFFER GELESEN WERDEN
;KANN
;
	LD	A,46H	;LETZTE OPERATION
;			;LESEN ?
	LD	HL,CTAB
	CMP	M
	JRNZ	RFLP-#
	INC	HL
	LD	DE,RESLT;GLEICHES LAUF-
;			;WERK
	LD	A,(DE)
	AND	3
	CMP	M
	JRNZ	RFLP-#
	INC	HL	;GLEICHE SPUR ?
	INC	DE
	INC	DE
	INC	DE
	LD	A,(DE)
	CMP	M
	JRNZ	RFLP-#
	INC	HL	;KOPF?
	INC	DE
	LD	A,(DE)
	CMP	M
	JRNZ	RFLP-#
	INC	HL
	LD	A,(SEC1);HOSTSECTOR=BDOS/3
	RRA
	JRC	RFLP-#	;UNGRADE
	CMP	M
	JRNZ	RFLP-#
;
;GLEICH,ALSO PUFFER LESEN,NICHT LAUFWERK
;
	LD	HL,FDMA+80H;QUELLE
	LD	DE,(DMA);   ZIEL
	LD	BC,80H  ;   ANZAHL BYTES
	LDIR		;   UEBERTRAGEN
	POP	BC
	POP	DE
	POP	HL
	XOR	A
	RET
RFLP:	CALL	TRANS	;SEKTOR LESEN
;			;+ UMRECHNEN
	PUSH	AF	;FEHLER R8272
	LD	HL,FDMA
	BIT	1,B
	JRNZ	B2-#
	LD	HL,FDMA+80H; QUELLE
B2:	LD	DE,(DMA)   ; ZIEL 	
	LD	BC,80H
	LDIR
	POP	AF
	POP	BC
	POP	DE
	POP	HL
	RET
;
;*****************************************
;
;FLOPPY SCHREIBEN MIT SEKTOR EINFUEGEN
;
WFLOP:	PUSH	HL
	PUSH	DE
	PUSH	BC
	CALL	TRANS
	OR	A	;LESEFEHLER?
	JRNZ	B4-#
	LD	DE,FDMA
	BIT	1,B
	JRNZ	B3-#
	LD	DE,FDMA+80H
B3:	LD	HL,(DMA)
	LD	BC,80H
	LDIR
	CALL	W8272
B4:	POP	BC
	POP	DE
	POP	HL
	RET
;
;*****************************************
;
;SEKTORUMRECHNUNG
;IN: BDOS-SEKTOR-NR IN SEC1
;OUT: FLOPPY-SEKTOR-NR IN SECTR 
;     B=0 WENN VORDERER TEIL SONST
;     HINTEREN AUSWERTEN
;     GELESENER FLOPPY-SECTOR IN BIOS-
;     PUFFER FDMA
;
TRANS:	EQU	#
	LD	B,0
	LD	A,(SEC1);BDOS-SEKTOR
	OR	A
	RRA		;UNGERADE?,/2
	JRNC	B1-#	;NEIN
	ADD	1
	CAC	RESTR	;FEHLER
	LD	B,0FFH	;KENNZEICHEN
B1:	PUSH	BC
	LD	(SECTR),A
	CALL	R8272
	POP	BC	;FLAG F,UNGERADE
	RET
;
;*****************************************
;TREIBER MIT U 8272
;*****************************************
;
INIFD:	LD	B,0	;INIT.8272
	DJNZ	INIFD+2-#
	IN	CFDC
	CMP	80H
	JRZ	SPEZI-#
	IN	DFDC
	JR	INIFD-#
SPEZI:	LD	HL,STAB-1;PARAMETER LADEN
	LD      BC,0303H;SPEZIFY-COMM
;			; 3BYTES
	CALL	WCOM1	;SCHREIBEN COMM
RECAL:	LD	BC,0207H;SPUR 0 EINSTELLEN
	CALL	RDY	;DRIVE REAY ?
;
;*****************************************
;
SENSE:	LD	BC,0108H;PRUEFE INTERRUPT
;			;STATUS
	CALL	WCOM
	CALL	RBYTE	;RESULT REG 0:IC1,
;			;IC2,SE,EC,NR,HD,
;			;US1,US2
	LD	B,A
	CMP	80H
	CANZ	RBYTE	;PCN HOLEN
	BIT	5,B
	JRZ	SENSE-#
	RET
STAB:	DB	1FH	;XXXX=SRT,XXXX=HUT
	DB	33H	;XXXXXXX=HLT,X=ND
;
;*****************************************
;
AN1:	EQU	#
	BER	80 
;
;*****************************************
;
	ORG	0E800H
;
;*****************************************
;
;SEKTOR SCHREIBEN/LESEN IN BETRIEBSART
;OHNE DMA-SCHALTKREIS
;SEKTOR IN (SECTR)
;SPUR IN (TRACK)
;AKTLW IN (UNIT)
;ZIEL-/QUELLADRESSE=FDMA
;KILL:A B DE HL
;
W8272:	DB	11H	;CODE LD DE,... 
	OUTI		;WRITE DATA
	LD	A,45H	;SCHREIBKOMMANDO
	JR	RWIT-#
;
;*****************************************
;
R8272:	DB	11H	;CODE LD DE,...
	INI
	LD	A,46H	;LESEKOMMANDO
RWIT:	LD	(CTAB),A
	LD	(MODE),DE;EINTRAGEN INI/
;			;OUTI-OP-CODE
	CALL	SEEK
RWLOP:	LD	B,10	;ANZAHL VERSUCHE
RWOP:	PUSH	BC
	DI
	LD	B,9	;9 COMMANDOBYTES
	LD	A,(CTAB)
	LD	C,A
	CALL	RDY	;AUSGABE KOMMANDO
	LD	HL,FDMA
	LD	C,DFDC
	CALL	RW
	OUT	TC	;ENDE-IMPULS
	CALL	RRSLT
	POP	BC
	RZ		;STO=0=KEINE
;			;FEHLER
	DJNZ	RWOP-#
ERR:	LD	A,1
	RET		;ERROR
;
;*****************************************
;
;SCHREIBEN ODER LESEN 256 BYTES
;IN: HL QUELLE ODER ZIEL
;C: DATENPORT
;
RW:	EQU	#
	LD	B,0	;256 BYTES
RW1:	IN	CFDC
	RLCA		;RQM-TEST
	JRNC	RW1-#
	RLCA		;DIO
	RLCA		;NON-DMA
	RNC		;FERTIG ?
MODE:	INI		;INI BEI READ DATA
;			;SONST OUTI
	JRNZ	RW1-#
	RET
;
;*****************************************
;
;*****************************************
;
;
	ORG	AN1+80 
;
;
;
SDS:	LD	BC,0204H;PRUEFE LAUFWERK
;			;STATUS
	CALL	WCOM	
	CALL	RBYTE	;STATUS REG3:
;			;FAULT,WP,RDY,TO
;		 	;TO,TS,HD,US1,U
	RET
;
;*****************************************
;
SEEK:	LD	BC,030FH;COMM SPUR EINSTEL-
;			;LEN
	CALL	RDY
	CALL	SENSE
SKBSY:	IN	CFDC
	AND	0FH
	JRNZ	SKBSY-#
	RET
;
;*****************************************
;
RDY:	PUSH	BC	;LAUFWERK BETRIEBS-
;			;FAEHIG ?
	CALL	SDS
	POP	BC
	BIT	5,A	;READY-BIT IN STA-
;			;TUSREG.3
        CALL	DELAY   ;VERZOEGRUNG
	CAZ	RESTR	;FEHLER
;
;*****************************************
;
WCOM:	LD      HL,CTAB	;COMM IN
;			;FDC SCHREIBEN
;
;IN: B ANZAHL D. BYTES, C COMM
;
WCOM1:	CALL	DELAY
	IN	CFDC
	AND	0C0H
	CMP	80H	;RQM,DIO=OUT    
	JRNZ	WCOM1-#
	LD	A,C
	OUT	DFDC
	INC	HL
	LD	C,M
	DJNZ	WCOM1-#
	RET
;
;*****************************************
;
DELAY:	PUSH	BC	;VERZOEGERUNG F.
;			;STATUSFLAG 8272
	LD	B,11H   ;SONST 0FH
DEL1:	DJNZ	DEL1-#
	POP	BC
	RET
;
;*****************************************
;
RBYTE:	CALL	DELAY	;1 BYTE LESEN
	CALL	IRDY
	IN	DFDC
	RET
;
;*****************************************
;
RRSLT:	LD	B,6	;LESE 7 RESULT
;		        ;BYTES
	CALL	RBYTE
	LD	HL,RESLT
	LD	M,A
	AND	0C0H	;ERROR ?
	LD	C,A
RESL1:	CALL	RBYTE
	INC	HL
	LD	M,A
	DJNZ	RESL1-#
	LD	A,C	;FEHLERMELDUNG
;			;STATUS REG 0
	OR	A
	RET
;
;*****************************************
;
IRDY:	IN	CFDC	;BEREIT F.DATEN-
;			;EINGABE ?
	RLCA
	JRNC	IRDY-#
	AND	80H
	RLCA
	RC
;
;*****************************************
;
;FEHLERBEHANDLUNG
;
ERM:	DB	0FFH	;SPRUNG IN MONITOR
;
RESTR:	EQU	#
	LD	DE,MT3
	CALL	OUT$
	CALL	BEEP
	CALL	CONIN
	CMP	03H
	JPZ	WBOOT
	JMP	GOCPM
;
;*****************************************
;
;RAM-DISK
;SCHREIBEN
;*********
WRDSK:	CALL	RADR	;SEKTORADR BERECH-
;			;NEN
	JRC	BDERR-# ;BEREICH UEBER-
;			;SCHRITTEN
	EX	DE,HL	;ZIEL-/QUELLADR.
;			;RAM-DISK
	LD	HL,(DMA);ZIEL-/QUELLADR.
;			;BDOS
RDSK1:	LD	BC,80H	;=1 SEKTOR
	LDIR
	XOR	A
	RET
;
;LESEN
;*****
RRDSK:	CALL	RADR
	JRC	BDERR-#	;FEHLER
	LD	DE,(DMA)
	JR	RDSK1-#
BDERR:	LD	A,1	;BDOS-ERROR
	RET
;
;
;SEKTORADR. IM RAM BERECHNEN DE AKT. SPUR
;C AKT. SEKTOR  B MAX. SEKTORANZAHL/DISK
;
;
RADR:	LD	D,0
	LD	A,(TRACK)
	LD	E,A
	LD	A,(SEC1)
	LD	C,A
	LD	HL,0
	LD	B,26
RADR1:	ADD	HL,DE	;UMWANDLUNG SPUREN
;			;IN SEKTOREN
	DJNZ	RADR1-#
	ADD	HL,BC	;AKT.SEKT.DAZU
	ADD	HL,HL	;WANDLUNG SEKTOR
;			;IN BYTES
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,HL
	LD	BC,RDSK	;RAM-DISK-
;			;ANFANG
	ADD	HL,BC
	LD	A,0BFH	;HIGH-ADR RAM-
;			;DISK
	CMP	H
	RET
;
;*****************************************
;
INIT:	LD	A,0C3H
	LD	(0),A
	LD	(5),A
	LD	(0C7FDH),A
	LD	HL,WBOTE
	LD	(1),HL
	LD	HL,0C7FDH
CHTP:	LD	(6),HL
	LD	HL,BOS
	LD	(0C7FEH),HL	
	LD	A,(AKTLW)
	LD	(TAPUF),A
	LD	A,0
	LD	(AKTLW),A
	RET
;
;*****************************************
;*****************************************
;*****************************************
;
OUT$:	LD	A,(DE)
	OR	A
	RZ	
	LD	C,A
	CALL	COOUT
	INC	DE
	JR	OUT$-#
;
;*****************************************
;
;ZEICHEN VON TASTATUR <A>
;*****************************************
;
CONIN:	CALL	CHIT
	RST	20H
	DB	1	;ZEICHENEINGABE
	PUSH	AF
	CALL	CHTI
	POP	AF
	RET
;
;*****************************************
;ZEICHEN AUF BILDSCHIRM <C>
;*****************************************
;
COOUT:	PUSH	AF
	PUSH	HL
	PUSH	BC
	PUSH	DE
	CALL	ZAG
	POP	DE
	POP	BC
	POP	HL
	POP	AF
	RET
;
ZAG:	LD	A,(MLZBS)	;MERKE LETZTES
;                                   ZEICHEN
	CMP	1BH
	JPZ	ANKXY
	LD	A,1BH
	CMP	C
	JPZ	MESC
	LD	A,C
	OR	A
	RZ
	LD	HL,KTAB
	LD	BC,LKTAB
	CPIR
	JRNZ	ZAG1-#
	DEC	HL
	LD	BC,KTAB
	SBC	HL,BC
	SLA	L
	LD	BC,FTAB
	ADD	HL,BC
	LD	C,M
	INC	HL
	LD	H,M
	LD	L,C
	JMP	M

KTAB:	DB	8	;BACKSTEP
	DB	9	;CURSOR RECHTS
	DB	0CH	;CLS
	DB	16H	;LOESCHEN
;                         ZEILENREST
	DB	18H	;LOESCHEN
;                         ZEILE,CURSOR ANF.Z.
	DB	1AH	;CURSOR NACH OBEN
	DB	14H	;LOESCHEN
;                        BILDSCHIRMREST
	DB	82H	;KURSOR EIN
	DB	83H	;KURSOR AUS
	DB	0DH	;CR
	DB	0AH	;LF
	DB	1	;CURSOR LINKS OBEN
	DB	7	;BEEP
	DB	15H	;CURSOR RECHTS
	DB	84H	;ZEICHEN NORMAL
	DB	85H	;ZEICHEN INVERS
	DB	86H	;ZEICHEN INTENSIV
	DB	87H	;ZEICHEN
;                        INTENSIV INVERS
LKTAB:	EQU	#-KTAB
FTAB:	DA	BSTP
	DA	CURR
	DA	CLS
	DA	DELLN
	DA	INSLN
	DA	ZRET
	DA	CLCU
	DA	CZSET
	DA	PUABL
	DA	CR
	DA	OUTLF
	DA	CHOME
	DA	BEEPA
	DA	CURR
	DA	NORM
	DA	INV
	DA	ND
	DA	ND	
;AUSGABE ZEICHEN <> STEUERZEICHEN
ZAG1:	AND	7FH
	LD	HL,(CURSR)
	PUSH	AF
	LD	A,(MINV)
	LD	B,A
	POP	AF
	OR	B	;INVERS, WENN 80H
	LD	M,A
	INC	HL
	EX	DE,HL
	LD	HL,BWSE+1
	XOR	A
	SBC	HL,DE
	EX	DE,HL
	JRNZ	ZAG2-#
ZAG3:	LD	DE,BWSA
	LD	HL,BWSA+SPALT
	LD	BC,BWSE-BWSA+1-SPALT
	LDIR
	PUSH	DE
	POP	HL
	PUSH	HL
	INC	DE
	LD	M,' '
	LD	BC,SPALT-1
	LDIR
	LD	HL,(SOIL)
	LD	DE,SPALT
	XOR	A
	SBC	HL,DE
	LD	(SOIL),HL
	POP	HL
ZAG2:	LD	A,M
	LD	(CZSP),A
	LD	M,0FFH
	LD	(CURSR),HL
ND:	RET

;BACKSTEP
BSTP:	CALL	PUABL
	DEC	HL
	JR	ZAG2-#
;CURSOR RECHTS
CURR:	CALL	PUABL
	INC	HL
	LD	DE,BWSE
	EX	DE,HL
	OR	A
	SBC	HL,DE
	EX	DE,HL
	LD	A,' '
	JPC	ZAG1
	JR	ZAG2-#	
;BS-LOESCHEN
CLS:	LD	HL,BWSA
	LD	M,' ' 
	LD	BC,BWSE-BWSA
	LD	DE,BWSA+1
	LDIR
	LD	A,' '
	LD	(CZSP),A
	JMP	CHOME	
;
CR:	LD	HL,(CURSR)
	LD	A,SPALT-1
	CPL
	AND	L
	LD	L,A
	JMP	SETCU
;
BEEPA:	EQU	#                   
	CALL	BEEP
	RET
;
OUTLF:	LD	DE,BWSE
	LD	HL,(CURSR)
	LD	BC,SPALT
	ADD	HL,BC
	EX	DE,HL
	SBC	HL,DE	;ENDE-NEUE
	EX	DE,HL
	JPNC	SETCU
	CALL	PUABL	;PUFFER AUFBLENDEN
	CALL	ZAG3
	RET
;
CHOME:	LD	DE,BWSA
	LD	HL,(CURSR)
	OR	A
	SBC	HL,DE
	RZ
	EX	DE,HL
	JMP	SETCU
;
;LOESCHEN BS AB CURSOR
;
CLCU:	LD	BC,(CURSR)
	LD	HL,BWSE
	SBC	HL,BC	;HL:=ANZ.ZEICH
;                        .BIS BWS-ENDE
MDFAA:	LD	DE,1
	LD	A,' '
	LD	BC,(CURSR)
MDFB3:	LD	(BC),A
	INC	BC
	SBC	HL,DE
	JPNZ	MDFB3
MDFBA:	LD	HL,(CURSR)
	LD	M,0FFH	;CURSOR
	RET
;
DELLN:	LD	HL,(CURSR)
	LD	A,L
	AND	SPALT-1	;A=SPALTENPOS.
	LD	B,A
	LD	A,SPALT-1
	SUB	B
	RZ
	LD	B,A	;ANZ.BIS ENDE ZEILE	
	LD	A,' '
	LD	(CZSP),A
DELL1:	INC	HL
	LD	M,' '
	DJNZ	DELL1-#
	RET
;
INSLN:	CALL	CR
	LD	A,(CZSP)
	LD	M,A
	LD	D,H
	LD	E,L
	INC	DE
	LD	BC,SPALT-1
	LDIR
	LD	HL,(CURSR)
	LD	M,0FFH
	LD	A,' '
	LD	(CZSP),A
	RET
;
ZRET:	LD	B,SPALT
ZR1:	PUSH	BC
	CALL	BSTP
	POP	BC
	DJNZ	ZR1-#
	RET
;
CZSET:	LD	A,0FFH
CZS1:	LD	HL,(CURSR)
	LD	M,A
	RET
;
PUABL:	LD	A,(CZSP)
	JR	CZS1-#
;
;
INV:	LD	A,80H
INV1:	LD	(MINV),A
	RET
;
NORM:	XOR	A
	JR	INV1-#
;	
MESC:	LD	A,C
	LD	(MLZBS),A
	RET
;
ANKXY:	LD	A,(MSEQU)
	CMP	0FFH
	JPZ	SETXY
	LD	A,0FFH
	LD	(MSEQU),A
	LD	A,C
	AND	5FH
	LD	(MZEIP),A
	RET
;
SETXY:	LD	A,C
	CMP	3DH	;ADM3A-TERMINAL
	RZ
	CMP	59H
	RZ
	AND	7FH	
	LD	(MSPAP),A
	LD	C,A
	XOR	A
	LD	(MLZBS),A
	LD	(MSEQU),A
	LD	HL,BWSA
	LD	B,0
	ADD	HL,BC
	LD	A,(MZEIP)
	OR	A	;ZEILE 0?
	JPZ	SETCU
	LD	C,0
	LD	B,A
	LD	D,0
	LD	E,SPALT	;SPALTENZAHL
ZINC:	ADD	HL,DE
	DJNZ	ZINC-#
SETCU:	PUSH	HL
	LD	DE,BWSE
	SCF
	SBC	HL,DE
	POP	HL
	JRC	SETC1-#
	EX	DE,HL
SETC1:	LD	DE,(CURSR)
	LD	A,(CZSP)
	LD	(DE),A
	LD	A,M	;VERDECKTES ZEICHEN
	LD	(CZSP),A
	LD	M,0FFH	;NEUER CURSOR
	LD	(CURSR),HL
	RET
;
;
;
CONST:	CALL	CONS1
	OR	A
	RZ
	LD	A,0FFH
	RET
;
CONS1:	CALL	CHIT
	PUSH	HL
	PUSH	DE
	PUSH	BC
	RST	20H
	DB	12H	;ACHTUNG !!! SONST
;			;INKEY 04 EINSETZEN!!
	POP	BC
	POP	DE
	POP	HL
	PUSH	AF
	XOR	A
	LD	(TAPUF),A
	LD	A,(IOBPF)
	LD	(AKTLW),A
	POP	AF
	RET
;
;*****************************************
;
LIST:	LD	A,C
	CALL	DRAKK
	RET
;
LSTS:	LD	A,0FFH	;DRUCKER
;                                STATUS
	RET
	NOP
;
PUNCH:	RET
	NOP
	NOP
	NOP
;
READR:	RET
	NOP
	NOP
	NOP
;
;*****************************************;
;
CHIT:	LD	A,(AKTLW)
	LD	(IOBPF),A
	LD	A,(TAPUF)
CHRET:	LD	(AKTLW),A
	RET
;
CHTI:	LD	A,(AKTLW)
	LD	(TAPUF),A
	LD	A,(IOBPF)
	JR	CHRET-#
;
;*****************************************
;
	DB	7FH,7FH,'CPM',88H             
	JMP	BIOS
	DB	7FH,7FH,'CPM64',88H
	IN	4
	SET	7,A
	OUT	4
	XOR	A
	JMP	BIOS
;
;
;*****************************************
;
AN2:	EQU	#
	BER	592 
;
;*****************************************
	ORG	0E900H
;
;
MLZBS:	DB	0	;MERKE LETZTES
;                         ZEICH.-BS
MSEQU:	DB	0	;MERKE SEQUENZ
MZEIP:	DB	0	;MERKE ZEILEN-
;                        POSITION
MSPAP:	DB	0	;MERKE SPALTEN-
;                        POSITION
;*****************************************
;
DPBAS:	EQU	#
DPHA:	DA	0
	DA	0
	DA	0
	DA	0
	DA	DIRBF
	DA	DPBF
	DA	CHKO
	DA	ALLO
DPHR:	DA	0
	DA	0
	DA	0
	DA	0
	DA	DIRBF
	DA	DPBR	;GERAETEBESCHREI-
;			;BUNG
	DA	CHK1	;DIRECTORY-KONTROLLE
	DA	ALL1	;BELEGUNG DISKETTE
;
;DISK-PARAMETER-BLOCK RAM DISK
;
DPBR:	DA	26	;SEKTOREN
	DB	3	;BLOCKGROESSE 1K
	DB	7	;(SEKTOREN/BLOCK)-1
	DB	00	;NICHT BENUTZT
	DA	20	;(BLOECKE/DISK)-1
	DA	31	;32 DIREKTORY-ENTR.
	DB	080H	;1 BELEGTER BLOCK
;			;DURCH DIR
	DB	0
	DA	16	;DIR/4
	DA	0	;0 SPUREN DURCH
;			;SYSTEM BELEGT+
;
;DISK-PARAMETER-BLOCK FLOPPY 5,25 ZOLL
;
DPBF:	DA	20H	;20 LOGISCHE=10H=16
;			;PHYSISCHE SEK-
;			;TOREN/SPUR
	DB	4	;2K-BLOECKE
	DB	15
	DB	1
	DA	73
	DA	63
	DB	80H
	DB	0
	DA	16
	DA	3	;SYSTEMSPUREN
;
;*****************************************
;
;
IOBPF:	DA	0	;PUFFER I/O BYTE
TAPUF:	DA	0
MINV:	DB	0
MKOM:	DB	0
CTAB:	DB	46H
UNIT:	DB	0
TRACK:	DB	0
HEAD:	DB	0
SECTR:	DB	1
N:	DB	1
EOT:	DB	16
GPL:	DB	1BH
DTL:	DB	0FFH
RESLT:	BER	7
DZEIL:	DB	30
MERK:	DB	0
SEC1:	DB	1
DMA:	DA	80H
DIRBF:	BER	128
ALLO:	BER	31
CHKO:	BER	16
ALL1:	BER	31
CHK1:	BER	16
FDMA:	BER	256
;
;
;
	END	; Eintraege gelan-
   gen