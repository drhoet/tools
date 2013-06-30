#!/bin/sh
# Copies all files from the selection file to the given directory

if [ $# -ne 2 ]
then
	echo "Usage: export-selection selection-file target-dir"
	echo
	echo "Copies all pictures given in the selection file to a target directory."
	echo "This command must be run from the base library directory of the selection-file."
	echo " selection-file       The file containing the selection picture filenames"
	echo " target-dir           The directory to extract the selected pictures to"
	
	exit 65
fi
cat $1 | while read line ; do cp -v $line $2/ ; done
