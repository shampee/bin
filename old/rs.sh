#!/bin/sh
if [ $# -gt 0 ]; then
	if [ "$1" -lt 10 ]; then
		redshift -x 1>/dev/null; redshift -O "$(echo "$1 * 1000" | bc)"  1>/dev/null
	else
		redshift -x 1>/dev/null; redshift -O "$(echo "$1 * 100" | bc)" 1>/dev/null
	fi
else
	redshift -x 1>/dev/null
fi
