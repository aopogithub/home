#!/bin/bash
fre=`free | tail -2 | head -1 | awk '{print $4}'`
if [ $fre -lt 9000000 ];then
	echo -e "`date` \t memory is low." >> /shell/memlog
	mail -s MEMELERT fanao1991@163.com < /shell/memlog
fi
