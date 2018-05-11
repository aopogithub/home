#!/bin/bash
for a in {30..36}
do 
	ping -c 4 176.233.4.$a > /mnt/14ping.txt
	if [ $(grep "ttl" /mnt/14ping.txt | wc -l)  -eq 0 ];then
	  echo "Host 176.233.4.$a is down."
	else 
	  echo "Host 176.233.4.$a is up."
	fi
done
	
	
	
  
