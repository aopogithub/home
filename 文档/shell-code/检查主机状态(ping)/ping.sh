#!/bin/bash
rm -rf subnet.txt
rm -rf detail_ip.txt
while read line
do
iplist=`echo $line| awk '{cmd="ipcalc "$1; while(cmd|getline){if(/HostMin/)ips=$2;if(/HostMax/)ipe=$2};close(cmd);print ipe,ips}' >> subnet.txt`
done < ip_list.txt


while read line
do
line2=`echo $(echo $line |awk -F"[ ]" '{print $2 " " $1}')`
three2=`echo $(echo $line |awk -F"[ ]" '{print $1}')|awk -F"[.]" '{print $3}'`
three1=`echo $(echo $line |awk -F"[ ]" '{print $2}')|awk -F"[.]" '{print $3}'`
fronttwo=`echo $(echo $line |awk -F"[ ]" '{print $1}')|awk -F"[.]" '{print $1 "."$2}'`
for ((i=$three1;i<=$three2;i++))
do
    for ((j=1;j<=254;j++))
   do
     echo $fronttwo.$i.$j >> detail_ip.txt
   done 
done 
done < subnet.txt
