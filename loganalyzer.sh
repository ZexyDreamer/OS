#!/bin/bash
if test "$1" == "-h" -o "$1" == "--help"
then
	echo "This program write the most popular resource"
else
	sort -k7 "$1" > sorted.txt;
	cut -c51-150 sorted.txt | uniq -c | sort -k1 -n | tail -1 | tr -d [0-9] | tr -d "|";
	rm -f sorted.txt;
fi
