#!/bin/sh

cd /etc/bash_completion.d
for filename in `ls`
do
	if which $filename &> /dev/null
 	then
		echo $filename installed
	else
		mv $filename $filename.bak
	fi
done
