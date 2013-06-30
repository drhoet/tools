#!/bin/sh
# Creates a selection file based on the pictures in a directory

if [ $# -ne 3 ]
then
	echo "Usage: create-selection selection-dir picture-library target-file"
	echo
	echo "Creates a selection file based on the pictures in a directory"
	echo " selection-dir        The directory that contains the selected pictures"
	echo " picture-library      The root directory of the picture library. The selection file will use this directory as a base dir"
	echo " target-file          The file to write the selection to"
	
	exit 65
fi

selection_dir=`readlink -m "$1"` #full path name
picture_lib=`readlink -m "$2"`   #full path name
target_file_fullpath=`readlink -m "$3"` #path of target file
target_file_path=`dirname "$target_file_fullpath"` #path of target file

for file in `ls "$selection_dir"`
do
	fullpath=`find "$picture_lib" -path "$selection_dir" -prune -o -name "$file" -print`
	path=.${fullpath#$target_file_path}
	echo Adding $path
	echo $path >> "$3"
done
