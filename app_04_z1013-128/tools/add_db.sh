#!/bin/bash

file=$1
file=`eval echo \"$file\"` 
pushd . >/dev/null

command -v greadlink >/dev/null
if [ $? -eq 0 ];then
   dbroot_rel=`greadlink -f "$0"`
else
    dbroot_rel=`readlink -f "$0"`
fi
dbroot_rel=`dirname "$dbroot_rel"`
dbroot_rel=`dirname "$dbroot_rel"`
dbroot_rel="$dbroot_rel/assets/db";
dbroot=$dbroot_rel
cd $dbroot
dbroot=`pwd`
popd >/dev/null

echo bewege \"$file\" in die Datenbank

md5=`md5sum -b "$file" | awk '{ print $1; }'`
base=`basename "$file" .z80`
mkdir "$dbroot/$md5-$base"

echo Ziel: "$dbroot/$md5-$base"
git mv "$file" "$dbroot/$md5-$base/"
#kein link /db/ ist noch nicht der Zielordner
#machen wir spaeter, nachdem es einsortiert wurde
#ln -s "$dbroot_rel_gehtnichtmehr/$md5-$base/$file"

#mv ~/jkcemu.gif "$dbroot/$md5-$base/"
if [ -e ~/jkcemu_video_text.txt ]
then
    mv ~/jkcemu_video_text.txt "$dbroot/$md5-$base/"
fi

if [ -e ~/jkcemu_screen_01.txt ]
then
    mv ~/jkcemu_screen_01.txt "$dbroot/$md5-$base/"
fi

if [ -e ~/jkcemu_screen_02.txt ]
then
    mv ~/jkcemu_screen_02.txt "$dbroot/$md5-$base/"
fi

if [ -e ~/jkcemu_screen_03.txt ]
then
    mv ~/jkcemu_screen_03.txt "$dbroot/$md5-$base/"
fi

if [ -e ~/jkcemu_screen_04.txt ]
then
    mv ~/jkcemu_screen_04.txt "$dbroot/$md5-$base/"
fi

rm -f ~/jkcemu_screen_*
rm -f ~/jkcemu.gif

#if [ -e ~/jkcemu.gif ]
#then 
#    ffmpeg -i ~/jkcemu.gif -r 5 -y -pix_fmt yuv420p "$dbroot/$md5-$base/animation.mp4"
#    mv ~/jkcemu.gif ~/jkcemu.gif.old
#fi

cp "$dbroot/info.txt" "$dbroot/$md5-$base/"

#list.txt wird nur für 0.5 MEGArom verwendet 
#echo list.txt:
#echo db/$md5-$base/$file
#echo Kompatibilitätsliste.txt:
echo $md5 "*"$file
gedit --new-document "$dbroot/$md5-$base/info.txt" &
#symbolic link in ~/bin directory
generate_fingerprint_db.pl 

