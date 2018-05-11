#!/bin/bash
read -p "Input an number(1-9):" num
if [ "$num" = "" ];then
  echo "Please input a required num." >&2
  exit 3
fi
if [ $num -lt 1 ];then
  echo "Please input a required num." >&2
  exit 1
fi
if [ $num -gt 9 ];then
  echo "Please input a required num." >&2
  exit 2
fi
for ((a=1;a<=$num;a++))
  do
  for ((b=1;b<=$num;b++)) 
    do 
      [ $b -le $a ] && echo -n "$a×$b=$[$a*$b] "
  done
    echo ""
done   

