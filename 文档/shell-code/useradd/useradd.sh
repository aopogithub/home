#!/bin/bash
if [ ! -f $1 ];then
  echo "Input file not found"
  exit 1
fi
if [ $# -eq 0 ];then
  echo "Usage: /root/batchusers <userfile>"
  exit 2
fi
for a in $(cat $1)
do
  useradd -s /bin/false $a
  echo "用户$a创建成功"
done
