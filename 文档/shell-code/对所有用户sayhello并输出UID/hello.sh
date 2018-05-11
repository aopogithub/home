#!/bin/bash



a=(`awk -F: '{print $1}' /etc/passwd`)
b=(`awk -F: '{print $3}' /etc/passwd`)
c=`cat /etc/passwd | wc -l`


for ((i=0;i<$c;i++))
do
	echo "hello ${a[$i]},your UID is ${b[$i]}"
done
echo "There are $c users"
