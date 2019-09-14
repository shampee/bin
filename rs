#!/bin/sh

temp=${HOME}/var/tmp/temp

if [ $# -eq 0 ] ; then
	redshift -x && echo "4000" >> $temp
else
	redshift -x; redshift -v -O $1 | tail -c 6 | head -c 4 >> $temp
fi
notify-send "Temperature" "Was set to $(cat /var/tmp/temp) degrees"
rm $temp
