#!/bin/bash
file=/etc/passwd
l=`wc -l $file | cut -d" " -f1`


for i in `sed 's/ //g' $file`
do
	usr=`echo "$i" | cut -d: -f1`
	bas=`echo "$i" | cut -d: -f3`
	echo -e "\033[31;42mhello $usr,your UID is $bas\033[0m"
done


echo "There are $l users."
