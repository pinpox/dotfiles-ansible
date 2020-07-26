#!/bin/bash

SCROTFOLDER="$HOME/Pictures/Screenshots"
tmpfile=$(mktemp /tmp/shadow-scrot.XXXXXX.png)
outfile="$SCROTFOLDER/scrot-$(date +'%Y-%m-%dT%H-%M-%S').png"

# echo $tmpfile
# echo $outfile

scrot -szb $tmpfile
convert "$tmpfile" \( +clone -background black -shadow 80x20+0+15 \) +swap -background transparent -layers merge +repage "$outfile"
xclip -selection clipboard -t image/png -i $outfile
rm $tmpfile
