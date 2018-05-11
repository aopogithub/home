#!/bin/bash
for a in 176.233.4.{1..254}	
do
(
	ping -c2 -W1 $a &> /dev/null 
	if [ $? -eq 0 ];then
	  echo "Host $a is up."
	else 
	  echo "Host $a is down."
	fi
)&
done 
wait
