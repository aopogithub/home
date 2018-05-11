#!/bin/bash
read -p "请输入用户名：" user
[ -z $user ]&&exit
read -p "请输入密码：" pass
useradd $user
echo "${pass:-123456}" | passwd --stdin $user
