Zeichensatz UTF-8+Z1013()+CTRL()-ohne Umlaute(äöüß)

1 O.12;TAB(84);P."*Greif-Soft*"
10 F.I=1TO7;O.13;N.I;F.I=1TO32;O.197;N.I
15 P.
20 P."          HOROSKOPE           "  
30 F.I=1TO32;O.197;N.I;F.I=1TO10000;N.I;O.12
40 P.;P.;PRI."Gebe bitte Dein Gebutsdatum ein";P.
50 INP."Monat ( 1-12 )"M;P.
60 INP."Tag   ( 1-31 )"T;P.
70 D=M*100+T;IFD<101G.100
71 IFD<121G.200
72 IFD<219G.400
74 IFD<323G.600
76 IFD<421G.800
78 IFD<522G.1000
80 IFD<622G.1200
82 IFD<722G.1400
84 IFD<822G.1600
86 IFD<922G.1800
88 IFD<1022G.2000
90 IFD<1122G.2200
92 IFD<1222G.2400
94 IFD<1232G.200
100 P.;P."Kannst Du nicht mal Deinen";P.
110 P."Geburtstag eingeben ?";G.40
200 O.12;P."Steinbock";GOS.5000
210 P."Er ist koerperlich und mora-"
215 P."lisch wiederstandsfaehig sowie"
220 P."ehrgeizig,darauf kommt aber "
222 P."keiner.
225 P."Praktisch geht er kein Risiko"
230 P."ein,ist aber auch zu Dummheiten"
235 P."faehig.Manchmal in angespannten"
240 P."Augenblicken vergisst er,wo er"
245 P."ist und warum.Aber hinter einer"
250 P."rauen Schale verbirgt sich ein"
255 P."goldenes Herz."
260 P."Geld laesst ihn kalt,obwohl er"
265 P."gut verdient.Sein Leistungsan-"
270 P."stieg faellt auf das Monatsende."
275 P."Wenn ein Steinbock heiratet,"
280 P."so geschieht das meistens in "
285 P."der zweiten Lebenshaelfte."
290 P."In der Ehe ist er gluecklich,"
295 P."erinnert sich aber gern an sein"
300 P."Junggesellenleben."
310 GOS.6000
400 O.12;P."Wassermann";GOS.5000
410 P."Der Wassermann vereinigt Unent-"
415 P."schlossenheit und Spontanitaet."
420 P."Er kann monatelang nichts tun"
425 P."u. sich sogar Vorwuerfe machen"
430 P."dass er sein Geld umsonst"
435 P."bekommt.Wenn aber seine aktive"
440 P."Phase beginnt,stuerzt er sich "
445 P."auf alles,ohne sich und seine"
450 P."Untergebenen zu schonen.Er ist"
455 P."haefig mit seiner Stellung un-"
460 P."frieden,verbirgt diese aber "
465 P."hinter scheinbar guter Laune."
470 P.;P."Manchmal hat er das Gefuehl"
475 P."dass er entlassen wird.Just in"
480 P."diesem Augenblick wird er be-"
485 P."foerdert.Ein Wassermann bittet"
490 P."nie und bekommt trotzdem alles."
495 P."Die in diesem Sternzeichen"
500 P."Geborenen werden fuer ihren"
502 P."natuerlichen Frohsinn von allen"
503 P."geliebt."
505 P."Ein Wassermann kann eine "
510 P."ueberraschende Loesung eines"
515 P."Problemes finden und hat Ideen,"
520 P."braucht aber Mitmenschen,die"
525 P."seinen Erfolg teilen.";P.;G.6000
600 O.12;P."Fisch";GOS.5000
610 P."Die unter diesem Sternenzeichen"
620 P."Geborenen geben sich gern"
630 P."Traeumereien hin und haben eine"
635 P."ueppige Phantasie,die ihnen oft"
640 P."einen Streich spielt. Die Kar-"
645 P."riere als solche reizt die "
650 P."Fische nicht.Aber zur Erweite-"
655 P."rung ihres Horizontes sind sie"
657 P."bereit die Treppe 'hinaufzu-"
660 P."fallen'.Ihrer Natur nach sind"
670 P."sie nachgiebig und neigen dazu"
675 P."ihren Mantel nach dem Wind zu"
680 P."haengen."
690 P."Daher ist es sehr wichtig,dass"
695 P."der Wind in die richtige Rich-"
700 P."tung weht.Haeufig ist der Fisch"
705 P."auf einem Gebiet taetig,das "
710 P."seinen Faehigkeiten gar nicht"
715 P."entspricht."
720 P."Meist sind die Fische uneigen-
725 P."nuetzig,schaemen sich aber "
730 P."manchmal ihrer Selbstlosigkeit"
735 P."und bitten um Gehaltszulage."
740 P."Logischen Argumenten ziehen sie"
745 P."Gefuehle vor,so dass man leicht"
750 P."ihr Mitleid erregen und sie "
755 P."noch leichter einschuechtern"
760 P."kann."
770 G.6000
800 O.12;P."Widder";GOS.5000
810 P."Die Widder haben so viel Ener-"
815 P."gie,dass sie erst handeln und"
820 P."dann denken.Meist sind sie"
825 P."voellig unbegabt,und haben nur"
830 P."ein Talent,naemlich zum Leiten."
835 P."Trotz ihrer nuechternen Menta-"
840 P."litaet neigen sie zu Uebertrei-"
845 P."bungen und zeichnen sich durch"
850 P."Aggressivitaet aus,die den zur"
855 P."Manie werdenden Wunsch nach Ge-"
860 P."rechtigkeit etwas lindert."
865 P."Sie versuchen ihrer Umwelt"
870 P."nicht zu schaden,gehen aber mit"
875 P."ihr oft hart um.Trotz scheinbar"
880 P."guter Gesundheit haben sie ein"
885 P."labiles Nervensystem."
890 P."Wegen ihrer Ungeduld geraten"
895 P."sie oft in prekaere Situationen.
900 P."Ihnen mangelt es Flexibilitaet."
910 P."Im Eheleben sind sie eifer-"
915 P."suechtig und jaehzornig."
920 P.;G.6000
1000 O.12;P."Stier";GOS.5000
1010 P."Ein Stier besitzt von Natur aus"
1015 P."einen gesunden Menschenverstand"
1020 P."und praktisches Geschick,ist"
1025 P."jedoch faul und bequem,ausser-"
1030 P."dem ein komplizierter und"
1035 P."wiederspruechlicher Charakter."
1040 P."Er hat gute Instinkte und zieht"
1045 P."selbst aus Misserfolgen Nutzen."
1050 P."Untergebene und Chefs moegen"
1055 P."ihn in gleicher Weise."
1060 P."Er knuepft leicht nutzbringende"
1065 P."Bekanntschaften an und scheut"
1070 P."dabei weder Zeit noch Geld."
1075 P."Als ein Mensch,der leicht Feuer"
1080 P."faengt kann ein Stier das Ge-"
1085 P."setz uebertreten,ohne es zu"
1090 P."merken.Aus diesem Grund ist er"
1095 P."fuer Posten nicht geeignet,auf"
1100 P."denen er materiell haften muss."
1120 G.6000
1200 O.12;P."Zwilling";GOS.5000
1210 P."Dank ihrem lebhaften Geist"
1215 P."schnappen die Zwillinge"
1220 P."alles spielend leicht auf.Sie"
1225 P."haben eine gute Intuition,die"
1230 P."ihnen in komplizierten Lebens-"
1235 P."lagen hilft und sie in Dutzend-"
1240 P."situationen zu Fehlern verleitet"
1245 P."Sie sind immer darauf bedacht"
1250 P."zu wissen was man von ihnen"
1255 P."haelt.Erfahren sie es aber,dann"
1260 P."glauben sie es nicht."
1265 P."Angebohrene Intelligenz geht"
1270 P."bei ihnen manchmal mit Wutaus-"
1275 P."bruechen in betont hoeflicher"
1280 P."Form einher.Sie sind nicht"
1285 P."nachtragend und verwinden"
1290 P."schnell eine Kraenkung."
1300 P."Da die Zwillinge aeusserst stur"
1310 P."und argwoenisch sind,sollte man"
1315 P."sie nicht mit der Leitung von"
1320 P."Menschen beauftragen.";G.6000
1400 O.12;P."Krebs";GOS.5000
1410 P."Obwohl die in diesem Zeichen"
1415 P."Gebohrenen Aerger 2 Jahre im"
1420 P."vorraus riechen,kommt er trotz-"
1425 P."dem und zwar dort,wo man ihn"
1430 P."nicht erwartet.Die Stimmung"
1435 P."eines Krebses haengt meistens"
1440 P."von der guten Laune des Chefs"
1445 P."und der der eigenen Frau zu"
1450 P."Hause ab.Er ist friedfertig und"
1455 P."scheu.Drueckt man ihn aber an"
1460 P."die Wand,dann spricht er aus,"
1465 P."was er denkt,bedauert es aber"
1470 P."nachher."
1475 P."Von 2 Uebeln waehlt er das"
1480 P."kleinere,das sich haeufig als"
1485 P."das groessere erweist.Ein Krebs"
1490 P."ist meist begabt,obwohl er"
1495 P."nicht genau weiss,wozu er"
1500 P."Talent hat.Er zoegert lange,ehe"
1505 P."er sich zu etwas entschliesst."
1510 P."Hat er sich entschieden,dann"
1515 P."weicht er davon nicht,auch wenn"
1520 P."seine Entscheidung falsch war."
1530 P.;G.6000
1600 O.12;P."Loewe";GOS.5000
1610 P."Der Loewe ist meist stark.Oft"
1615 P."kommt er in Versuchung,seine"
1620 P."Staerke zu erproben,tut es aber"
1625 P."aus Angst vor den Folgen nicht."
1645 P."Die unnoetige Selbstsicherheit"
1650 P."treibt den Loewen mitunter ins"
1655 P."Unglueck und Abenteuer,fuer die"
1660 P."er buessen muss.Aber selbst als"
1665 P."Pruegelknabe bewahrt er"
1670 P."sich seinen Optimismus.Vor dem"
1675 P."Loewen tut sich so manche Tuer"
1680 P."auf,dass er nicht immer die"
1685 P."richtige findet.Er zieht es vor"
1690 P."die Menschheit als Ganzes und"
1695 P."nicht einzelne Menschen zu"
1700 P."lieben."
1705 P."Im Gespraech gibt er sich so"
1710 P."offen,dass die Partner nicht"
1715 P."immer verstehen,was er sagen"
1720 P."will.Er kann grob sein,aber man"
1725 P."haelt ihm seine Offenheit und"
1730 P."Ehrlichkeit zugute.Fremde Vor-"
1735 P."schlaege akzeptiert er nur"
1740 P."wiederwillig,und wenn,dann nur"
1745 P."als seine eigenen.Es ist schwer"
1750 P.",mit einem Loewen auszukommen."
1755 P."Aber man kommt selten von ihm"
1760 P."los."
1765 G.6000
1800 O.12;P."Jungfrau";GOS.5000
1810 P."Die in diesem Zeichen Gebohre-"
1815 P."nen zeichnen sich durch klaren"
1820 P."Verstand aus.Durch ihre Logik"
1825 P."koennen sie jedermann,auch sich"
1830 P."selbst verrueckt machen.Sie"
1835 P."sind hervorragende Wissen-"
1840 P."schaftler,Rechtsanwaelte und"
1845 P."Experten.Alles was sie machen,"
1850 P."machen sie bestens,ausgenommen"
1855 P."den 30.und 31.jedes Monats.Sie"
1860 P."lieben keine Luegen und berei-"
1865 P."ten dadurch ihren Mitmenschen"
1870 P."viel Aerger.Der kritische Ver-"
1875 P."stand einer Jungfrau erschreckt"
1880 P."die Chefs und erschwert ihr"
1885 P."Weiterkommen."
1890 P."Sie koennen einen Menschen auf"
1895 P."Anhieb verstehen,ihn ebenso"
1900 P."schnell kraenken und troesten."
1905 P."Jungfrauen lassen sich prak-"
1910 P."tisch nicht bestechen,obwohl es"
1915 P."an Bestechungsversuchen nicht"
1920 P."mangelt."
1925 P.
1930 G.6000
2000 O.12;P."Waage";GOS.5000
2010 P."Die Waage-Menschen haben stets"
2015 P."einen angenehmen Gesichtsaus-"
2020 P."druck,den sie auch im Schlaf"
2025 P."bewahren.Sie sind so sehr um"
2030 P."ihre Ruhe besorgt,dass sie"
2035 P."jahrelang zoegern und dies als"
2040 P."Weitblick ausgeben. Der Wunsch"
2045 P."mit allen im Guten auszukommen,"
2050 P."laesst sie entgegengesetzte"
2055 P."Meinungen aeussern.Ihr Stand-"
2060 P."punkt haengt oft von dem Ge-"
2065 P."spraechspartner ab.Der Lebens-"
2070 P."weg des Waage-Menschen ist mit"
2075 P."guten Vorsaetzen gepflastert,"
2080 P."was sich aber von ihren Taten"
2085 P."nicht sagen laesst."
2090 P."Ihr gutes Gedaechtnis behaelt"
2095 P."absolut alles,stoert sie aber"
2100 P."nicht daran,gegebene Versprech-"
2105 P."en zu vergessen. Sie haben es"
2110 P."nie eilig und sind selbst im"
2115 P."hohen Alter sehr produktiv."
2130 P.;G.6000
2200 O.12;P."Skorpion";GOS.5000
2205 P."Die Skorpione bestehen aus"
2210 P."lauter Wiederspruechen.Hinter"
2215 P."ihrer rauen Schale verbergen"
2220 P."sich ein weiches Herz und"
2225 P."Hilfsbereitschaft.Ein Skorpion"
2230 P."hat ein stark ausgepraegtes"
2235 P."Bildungsbeduerfnis,hoert aber"
2240 P."mit 24 Jahren zu lernen auf und"
2245 P."beginnt andere zu lehren."
2250 P."Er schwoert auf wissenschaft-"
2255 P."liche Leistungen,glaubt aber"
2260 P."gleichzeitig an das im Traum"
2265 P."Gesehene.Er hat kein Geltugs-"
2270 P."beduerfnis und zieht es vor,im"
2275 P."Schatten zu leben."
2280 P."Er ist zaeh bei Ueberwindung"
2285 P."von Hindernissen und findet sie"
2290 P."sogar dort,wo es sie gar nicht"
2295 P."gibt.Freunde und Feinde schafft"
2300 P."er sich bereits als Kind an und"
2305 P."behaelt sie lebenslang. Aber"
2310 P."wenn es des Sache nutzt,ist er"
2315 P."bereit,sie gegeneinander auszu-"
2320 P."tauschen."
2325 P."Ein Skorpion wird zwar kein"
2330 P."Pulver erfinden,bringt aber"
2335 P."sein Schaefchen stets ins"
2340 P."Trockne."
2350 G.6000
2400 O.12;P."Schuetze";GOS.5000
2405 P."Ein Schuetze weiss immer was er"
2410 P."will,und bedauert manchmal,dass"
2415 P."er zu viel will.Er hat das Ta-"
2420 P."lent,seine Untergebenen fuer"
2425 P."sich einzunehmen,deshalb kommen"
2430 P."seine Fehler das Kollektiv"
2435 P."teuer zu stehen.Er ist so stark"
2440 P."auf die Zukunft orientiert,dass"
2445 P."er die Gegenwart voellig ausser"
2450 P."acht laesst.Es ist schwer einen"
2455 P."Schuetzen aus der Fassung zu"
2460 P."bringen.Gelingt das,so kann er"
2465 P."viele Menschen aergern. Die in"
2470 P."diesem Zeichen Gebohrenen fueh-"
2475 P."ren nie etwas im Schilde,son-"
2480 P."dern hauen gleich drein."
2485 P."Untergebene lieben ihn fuer"
2490 P."seine Offenheit und zahlen ihm"
2495 P."mit gleicher Muenze heim."
2500 P."Der Schuetze ist zu grossen"
2510 P."Taten faehig,wenn er darauf"
2515 P."verzichtet,die Grosstaten auf"
2520 P."einmal zu vollbringen."
2530 P.;G.6000
4999 STOP
5000 F.I=1TO32;O.160;N.I;P.;RE.
6000 Q=INC.;O.12;P."Soll ein weiteres Horoskop"
6005 P.
6010 INP."herausgesucht werden ? (0/1)"H
6020 IFH=1G.40
