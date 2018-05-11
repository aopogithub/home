#!/bin/bash
num=$[RANDOM%100]
while :
do
	read -p "请猜：" cai
	let nu+=1
	if [ $num -eq $cai ];then
	  echo "恭喜！！！！"
	  echo "共猜了$nu次"
	  exit
	elif [ $num -lt $cai ];then
	  echo "猜大了"
	else 
	  echo "猜小了"
	fi
done
