#!/bin/bash
x='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
#pass=""
for i in {1..8}
do
	y=$[RANDOM%62]
#	pa=${x:y:1}
#	pass=$pass$pa
	echo -n ${x:y:1} >> /shell/password.txt
done


pass=`cat /shell/password.txt`
echo $pass

	
read -p "输入用户名：" user
useradd $user
echo $pass | passwd --stdin $user
echo "$user--$pass" | mail -s NEWUSER fanao1991@163.com

> /shell/password.txt
