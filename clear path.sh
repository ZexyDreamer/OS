#!/bin/bash
b=""
if test "$1" = "-h" -o "$1" = "--help"
then
	echo "The program displays non-empty folders"
	exit
fi
if [[ -z "$*" ]]
then
	path=$PATH
else
	d=""
	c=$(find "$1")
	if test "$c" != ""; then
		for i in $c
		do
			if [[ -f $i ]]; then
				a=$(dirname "$i")
				if test "$a" != "$d"; then
					echo "$a"
					d="$a"
				fi
			fi
		done
	exit
	else
		echo "The directory doesn't exist"
		exit
	fi
fi
IFS=$':'
for j in $path
do
	e=$(find "$j" -executable -type f -not -empty)
	if [[ $e != "" ]]; then
		b=$b:$j
	fi
done
echo "$b"
