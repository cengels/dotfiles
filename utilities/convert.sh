#!/bin/bash

# PNG to ICO script
# by cengels, v0.1
#
# This script can be used to convert a PNG file to an ICO with six layers corresponding to the sizes
# 16 by 16, 32 by 32, 48 by 48, 64 by 64, 128 by 128, and 256 by 256.
# Two syntaxes are possible. Use:
# ./convert.sh SOURCE_FILE TARGET_FILE
# to convert a single PNG to an ICO or use
# ./convert.sh SOURCE_DIR TARGET_DIR
# to convert all PNG files in a directory to ICOs and place them in the specified TARGET_DIR.

shopt -s extglob

if [ $# -ne 2 ]; then
	echo "Invalid number of arguments."
	exit 1
fi

if [ -d "$1" ] && [ -d "$2" ]; then
	for filename in ${1}/*.png; do
		[ -e "$filename" ] || continue
		./$0 $filename $2/$(basename $filename .png).ico
	done
elif [ -f "$1" ]; then
	convert $1 -define icon:auto-resize=16,32,48,64,128,256 -compress zip $2
	echo "Generated $2"
else
	echo "Invalid arguments. Arguments must either both be files or directories."
	exit 1
fi
