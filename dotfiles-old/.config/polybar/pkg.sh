#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(yay -Qum 2> /dev/null | wc -l)

check=$((pac + aur))
if [[ "$check" != "0" ]]
then
	echo "$pac %{F#$(xrdb -query | grep color5 | cut -d'#' -f2)}%{F-} $aur"
fi
