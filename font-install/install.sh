#!/bin/bash

FONTS=$(cat fontlist.txt)
TMP=$(mktemp -d)
FONTDIR=$HOME/.local/share/fonts
mkdir -p $TMP
cd $TMP

for FONT in $FONTS;do
 echo "Downloading: $FONT"
 curl -sLO $FONT
done

for ZIPFILE in $(ls *.zip);do
 unzip -uo $ZIPFILE
done

mkdir -p $FONTDIR
cp -v *.ttf $FONTDIR
fc-cache -fv

rm -rf $TMP
