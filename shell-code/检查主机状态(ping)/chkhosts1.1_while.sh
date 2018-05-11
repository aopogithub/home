#!/bin/bash
a=1
while [ $a -lt 36 ]
do 
	ping -c3 -i0.2 -W1 176.233.4.$a > /dev/null
	if [ $? -ne 0 ];then
	  echo "Host 176.233.4.$a is down."
	else 
	  echo "Host 176.233.4.$a is up."
	fi
	let a++
done
	
	
	
  
