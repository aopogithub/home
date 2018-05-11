#!/bin/bash
read -p "Input an number(1-9):" num

#判断输入是否为数字，通过sed替换并通过判断字符串长度是否为0（-z）判断；
#if [ ! -z "$(echo $num | sed 's#[0-9]##g')" ];then
#  echo "Please input a number" >&2
#  exit 2
#fi
#判断输入数字是否在1～9之间；
#if [ "$num" = "" ]||[ $num -lt 1 ]||[ $num -gt 9 ];then
#  echo "Please input a required number" >&2
#  exit 1
#fi
#for ((a=1;a<=$num;a++))
#  do
#  for ((b=1;b<=$num;b++)) 
#    do 
#      [ $b -le $a ] && echo -n "$a×$b=$[$a*$b]`printf "\t"`"
#  done
#      printf "\n"
#done



case $num in 
[1-9])
  for ((a=1;a<=$num;a++))
  do
    for ((b=1;b<=$num;b++)) 
    do 
      [ $b -le $a ] && echo -ne "$a×$b=$[$a*$b]\t"
    done
    printf "\n"
  done
;;
*)
  echo "Please input a required number" >&2
  exit 1
;;
esac
