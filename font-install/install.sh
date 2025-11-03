#!/bin/bash

FONTS=$(cat fontlist.txt)
FONTTMPDIR=$(mktemp -d)
FONTDIR=$HOME/.local/share/fonts
mkdir -p $FONTTMPDIR
cd $FONTTMPDIR

for FONT in $FONTS;do
 echo "Downloading: $FONT"
 curl -sLO $FONT
done

for ZIPFILE in $(ls *.zip);do
 unzip -uo $ZIPFILE
done

mkdir -p $FONTDIR
cp -v *.ttf $FONTDIR
find . -iname "*.ttf" -exec cp {} $FONTDIR \;
fc-cache -fv

rm -rf $FONTTMPDIR
