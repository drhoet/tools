#!/bin/sh
cd /etc/bash_completion.d

for filename in `ls *.bak`
do
	mv $filename `echo $filename | cut -d'.' --complement -f2-`
done
