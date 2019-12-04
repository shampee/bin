#!/bin/ksh
if [ -z "$1" ]; then
	redshift -x > /dev/null
else
	redshift -x > /dev/null
	redshift -O "$1" &> /dev/null
fi
