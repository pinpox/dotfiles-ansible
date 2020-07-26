#!/usr/bin/env bash
function main(){
	pandoc -s -o $1.html $1 >> /dev/null 2>&1
	surf $1.html >> /dev/null 2>&1
	rm $tmpfile $tmpfile.html 2>&1
}

tmpfile="/tmp/$(uuidgen)"
cp "$@" $tmpfile
main "$tmpfile" &
