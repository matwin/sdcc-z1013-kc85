#!/usr/bin/perl -w

use Data::Dumper;
use Digest::MD5 qw(md5_hex);
use File::Basename;
use Cwd 'abs_path';
use Switch;
use GD::Simple;

our $index;
our $content;

our $img = GD::Simple->new(4100, 3900);
our $black = $img->colorAllocate(0,0,0);
our $white = $img->colorAllocate(255,255,255);
$img->setAntiAliased($black);

our $left_margin=0;
our $line_spacing=0; #n/72 inch

sub get_byte()
{
    my $b=ord(substr($content,$index++,1));
    return $b;    
}

sub get_word()
{
    my $l=ord(substr($content,$index++,1));
    my $h=ord(substr($content,$index++,1));
    return $h*256+$l;    
}

our $scale=10;
our $x=$scale/2;
our $y=$scale/2;

sub paint($)
{
    my $val=shift;
    for(my $i=0;$i<8;$i++) {
        if ($val&0x80) {
            $img->filledEllipse($x,$y+$i*$scale,10,10,$black);
            for ($j=0; $j<20; $j++) {
              my $dx = rand($scale);
              my $dy = rand($scale);
              $img->setPixel($x+$dx-$scale/2,$dy-$scale/2+$y+$i*$scale,$white);
            }
            for (my $j=0; $j<10; $j++) {
              my $dx = rand($scale);
              my $dy = rand($scale);
              $img->setPixel($x+$dx-$scale/2,$dy-$scale/2+$y+$i*$scale,$black);
            }
        }
        $val*=2;
    }
}

sub print_dots($ $)
{
    my $count=shift;
    my $x_inc=shift;
    while ($count) {
        my $b=get_byte();
        paint($b);
        $x+=$x_inc;
        $count--;
    }
}

#hitachi-lcd-dot-font-sheet.png
our %font=(
" "=>"12345678",
"W"=>"\x00\xfc\x02\x1c\x02\xfc\x00\x00", #57
"g"=>"\x00\x30\x4a\x4a\x4a\x7c\x00\x00"  #67
);

sub print_char($)
{
    my $char=shift;
    my $x_inc=$scale;
    my $pixels=$font{$char};
    if (!defined($pixels)) {
        $pixels=$font{" "};
    }

    for (my $i=0;$i<length $pixels;$i++) { 
        my $bit=ord(substr($pixels,$i,1));   
        #printf("char: 0x%02x\n",$bit);
        paint($bit);
        $x+=$x_inc;
    }
}


$file=$ARGV[0];
my $len=$ARGV[1];
if (!defined($len)) {
    $len=-s "$file";
}
if (substr($len,0,2) eq "0x") {
    $len=hex $len;
}

open(FILE,"<:raw", $file);
read(FILE,$content,$len);
close(FILE);

printf("len=%d\n",$len);
$index=0;

# create a new image (width, height)

while($index<$len) {
    $b=substr($content,$index,1);
    $index++;
    if ($b eq "\x1b") {
        printf("ESC+");
        $b=substr($content,$index,1);
        $index++;
        switch($b)
        {
            case "9" { print "PE detection enabled\n"; }
            case "@" { print "RESET\n"; }
            case "*" { $mode=get_byte(); $count=get_word(); printf ("* %d:%d\n",$mode,$count); print_dots($count,$scale); }
            case "3" { $line_spaceing=get_byte(); printf ("line_spaceing 216''=%d\n",$line_spaceing); }
            case "A" { $line_spaceing=get_byte(); printf ("line_spaceing 72'' =%d\n",$line_spaceing); }
            #double density 120dpi horizontal 60dpi vertical
            case "L" { $count=get_word(); printf ("L 960-dpl:%d\n",$count); print_dots($count,$scale); }
            case "O" { print "cancel bottom margin\n"; }
            case "l" { $left_margin=get_byte(); printf ("left margin=%d\n",$left_margin); }
            else { printf("unhandled ESC+0x%02x'%s':[%04x]\n",ord($b),$b,$index-1); exit 1;}
        }
    } else {
        switch($b)
        {
            case "\x0" { print "NUL\n"; }
            case "\xa" { $y+=8*$scale;} #LF
            case "\xd" { $x=$scale/2; } #CR
            # nochmal testen space sollte 8*scale Platz machen case " " { $x+=$scale; } #SPACE
            case "g" { print_char($b); } #dot matrix g
            case "W" { print_char($b); } #dot matrix g
            else {
                printf("unknown character [%04x,%d]%02x\n",$index,$index,ord($b));
                exit 1;
            }
        }
        
    }
}

open my $out, '>', 'tmp.png' or die;
binmode $out;
print $out $img->png;
printf("output: \"%s\"\n","tmp.png");
system("convert tmp.png -motion-blur 2x6+45 -resize 33% -normalize -rotate 180 -quality 70% final_blur.png" );
printf("output: \"%s\"\n","final_blur.png");

