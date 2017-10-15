#!/usr/bin/perl -w

use Data::Dumper;
use Digest::MD5 qw(md5_hex);
use File::Basename;
use Cwd 'abs_path';
use Switch;
use utf8;

sub pr($) {
    print $token;
    $token="";
    if ($token_space==1) {
        print " ";
    }
    $token=shift;
    $token_space=1;    
}

sub pq($) {
    print $token;
    $token="";
    my $txt=shift;
    print $txt;
    $token_space=0;    
}

if (!defined $ARGV[0] ) {
    print "convert KC-BASIC to text:\n";
    print "Z1013 maps special Z1013 characters to UTF-Font starting from U+f100\n";
    print basename($0)." [Z1013|DEFAULT] basic.z80 >basic.B\n";
    exit 1;
}

$mode=$ARGV[0];
$utf_shift=0;
if ($mode eq "Z1013" ) {
    $utf_shift=0xf100;
}

$file=$ARGV[1];

my $len=-s "$file";
open(FILE,"<:raw", $file);
read(FILE,my $content,$len);
close(FILE);

$index=32;

$aadr=unpack("v",substr($content,0,2));
#TODO When do we have to stop parsing
#$eadr=unpack("v",substr($content,2,2));
#$max_index=$eadr-$aadr+32;
#printf("%04x %04x maxindex=[%04x]%02x\n",$aadr,$eadr,$max_index,ord(substr($content,$max_index,1)));

$ofs=0x2c01-0x2bc0+32;
$index=$ofs;


use constant {
        GENERIC => 0,
        REM     => 1,
        NUMBER  => 2,
        SYMBOL  => 3,
        STRING  => 4,
};

$token="";
$token_type=0; #0 general 1 rem 2 int float numbers 3 symbol 4 str
while(1) {
    $len=2;
    $eol=unpack("v",substr($content,$index,$len));
    if ($eol==0) {
        #printf ("%x %x\n",$index,$max_index);
        last;
    }
    $eol=$eol-$aadr+32;
    $index+=$len;
    $line_no=unpack("v",substr($content,$index,$len));
    $index+=$len;
    #printf("eol=%x index=%x\n",$eol,$index);
    $token=sprintf("%5d",$line_no); 
    $token_space=1; #need space between tokens
    $token_type=GENERIC;
    $parse_line=1;

    while($parse_line) {
        $byte=ord(substr($content,$index++,1));
        if ($index==$eol) {
            if ($byte==0) {
                print $token;
                print("\n");
                $parse_line=0; #break reset scanner status variables outside the loop
            } else {
                printf(STDERR " <=\nError: [0x%04x] - NON-NULL character 0x%02x found\n", $index,$byte);
                exit 1;
            }    
        } else {
REDO_CHARACTER:
            if ($token_type==STRING) {
                if ($byte==0x22) {
                    pq("\""); 
                    $token_type=GENERIC;
                } else {
                    if ($byte>=0x20 && $byte<=0x7f) {
                        $token.=chr($byte);
                    } else {
                        #$token.=sprintf("\\x%02x",$byte);
                        switch ($byte)
                        { 
                            case [0x80..0xff] {}
                            else { printf(STDERR "WARNING: [0x%04x] - convert unicode 0x%02x character\n", $index,$byte); }
                        }
                        $byte=chr($utf_shift+$byte);
                        utf8::encode($byte);
                        $token.=$byte;
                    }
                }
            } elsif ($token_type==REM) {
                switch($byte) { 
                    case [0x20..0x7e] { $token.=chr($byte); }
                    else { 
                        $token.=chr($byte);
                        printf(STDERR "??<=\nWarning: [0x%04x] - non-printable character 0x%02x found in comment\n", $index,$byte); 
                        exit 1;
                    }
                }
            } elsif ($token_type==NUMBER) {
                switch($byte) { 
                    case [0x2e,0x30..0x39] { $token.=chr($byte); } #.
                    else {
                        $token_type=GENERIC;
                        $token_space=1;
                        goto REDO_CHARACTER;
                    }
                }
            } elsif ($token_type==SYMBOL) {
                switch($byte) { 
                    case [0x24,0x30..0x39,0x41..0x5a] { $token.=chr($byte); }  #$-sign is part of a symbol 
                    else {
                        $token_type=GENERIC;
                        goto REDO_CHARACTER;
                    }
                }
            } else {
                switch($byte)
                {
                    case 0x00 { print $token;
                                print("\n");
                                $parse_line=0; $index=$eol; } #TODO WARNING of hidden bytes
                    case 0x22 { pr("\""); $token_type=STRING; }
                    case [0x30..0x39] { pr(chr($byte)); $token_type=NUMBER; }
                    case [0x2d..0x2e] { pq(chr($byte)); $token_type=NUMBER; }  # [-.] #JKCEMU did not add any SPACE on the output  
                    case [0x41..0x5a] { pr(chr($byte)); $token_type=SYMBOL; }
                    case [0x20,0x28..0x29,0x2c,0x3a..0x3b] { pq(chr($byte)); } # [ (),:]
                    case 0x80 { pr("END"); }
                    case 0x81 { pr("FOR"); }
                    case 0x82 { pr("NEXT"); }
                    case 0x83 { pr("DATA"); }

                    case 0x84 { pr("INPUT"); }
                    case 0x85 { pr("DIM"); }
                    case 0x86 { pr("READ"); }
                    case 0x87 { pr("LET"); }

                    case 0x88 { pr("GOTO"); }
                    case 0x89 { pr("RUN"); }
                    case 0x8a { pr("IF"); }
                    case 0x8b { pr("RESTORE"); }

                    case 0x8c { pr("GOSUB"); }
                    case 0x8d { pr("RETURN"); }
                    case 0x8e { pr("REM"); $token_type=REM; }
                    case 0x8f { pr("STOP"); }

                    case 0x90 { pr("OUT"); }
                    case 0x91 { pr("ON"); }
                    case 0x92 { pr("NULL"); }
                    case 0x93 { pr("WAIT"); }

                    case 0x94 { pr("DEF"); }
                    case 0x95 { pr("POKE"); }
                    case 0x96 { pr("DOKE"); }
                    case 0x97 { pr("AUTO"); }

                    case 0x98 { pr("LINES"); }
                    case 0x99 { pr("CLS"); }
                    case 0x9a { pr("WIDTH"); }
                    case 0x9b { pr("BYE"); }

                    case 0x9c { pq("!"); $token_type=REM;  }
                    case 0x9d { pr("CALL"); }
                    case 0x9e { pr("PRINT"); }
                    case 0x9f { pr("CONT"); }

                    case 0xa0 { pr("LIST"); }
                    case 0xa1 { pr("CLEAR"); }
                    case 0xa2 { pr("CLOAD"); }
                    case 0xa3 { pr("CSAVE"); }

                    case 0xa4 { pr("NEW"); }
                    case 0xa5 { pr("TAB("); $token_space=0; }
                    case 0xa6 { pr("TO"); }
                    case 0xa7 { pr("FN"); }

                    case 0xa8 { pr("SPC("); $token_space=0; }
                    case 0xa9 { pr("THEN"); }
                    case 0xaa { pr("NOT"); }
                    case 0xab { pr("STEP"); }

                    case 0xac { pq("+"); }
                    case 0xad { pq("-"); }
                    case 0xae { pq("*"); }
                    case 0xaf { pq("/"); }

                    case 0xb0 { pq("^"); }
                    case 0xb1 { pr("AND"); }
                    case 0xb2 { pr("OR"); }
                    case 0xb3 { pq(">"); }

                    case 0xb4 { pq("="); }
                    case 0xb5 { pq("<"); }
                    case 0xb6 { pr("SGN"); }
                    case 0xb7 { pr("INT"); }

                    case 0xb8 { pr("ABS"); }
                    case 0xb9 { pr("USR"); }
                    case 0xba { pr("FRE"); }
                    case 0xbb { pr("INP"); }

                    case 0xbc { pr("POS"); }
                    case 0xbd { pr("SQR"); }
                    case 0xbe { pr("RND"); }
                    case 0xbf { pr("LN"); }

                    case 0xc0 { pr("EXP"); }
                    case 0xc1 { pr("COS"); }
                    case 0xc2 { pr("SIN"); }
                    case 0xc3 { pr("TAN"); }

                    case 0xc4 { pr("ATN"); }
                    case 0xc5 { pr("PEEK"); }
                    case 0xc6 { pr("DEEK"); }
                    case 0xc7 { pr("PI"); }

                    case 0xc8 { pr("LEN"); }
                    case 0xc9 { pr("STR\$"); }
                    case 0xca { pr("VAL"); }
                    case 0xcb { pr("ASC"); }

                    case 0xcc { pr("CHR\$"); }
                    case 0xcd { pr("LEFT\$"); }
                    case 0xce { pr("RIGHT\$"); }
                    case 0xcf { pr("MID\$"); }

                    case 0xd0 { pr("LOAD"); }
                    case 0xd1 { pr("TRON"); }
                    case 0xd2 { pr("TROFF"); }
                    case 0xd3 { pr("EDIT"); }

                    case 0xd4 { pr("ELSE"); }
                    case 0xd5 { pr("INKEY\$"); }
                    case 0xd6 { pr("JOYST\$"); }
                    case 0xd7 { pr("STRING\$"); }
                    
                    case 0xd8 { pr("INSTR"); }
                    case 0xd9 { pr("RENUMBER"); }
                    case 0xda { pr("DELETE"); }
                    case 0xdb { pr("PAUSE"); }

                    case 0xdc { pr("BEEP"); }
                    case 0xdd { pr("WINDOW"); }
                    case 0xde { pr("BORDER"); }
                    case 0xdf { pr("INK"); }

                    case 0xe0 { pr("PAPER"); }                    
                    case 0xe1 { pr("AT"); }                    
                    case 0xe2 { pr("HSAVE"); }                    
                    case 0xe3 { pr("HLOAD"); }

                    case 0xe4 { pr("PSET"); }                    
                    case 0xe5 { pr("PRES"); }
                    
                    else { printf(STDERR "??<=\nError: [0x%04x] - unknown character 0x%02x after '%s' found\n", $index,$byte,$token); exit 1;}
                }
            }
        }
    }
}


