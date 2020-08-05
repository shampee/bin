#!/bin/sh
if [ $# -gt 0 ]; then
	if [ "$1" -gt 10 ]; then
		redshift -x 1>/dev/null; redshift -O "$(echo "$(echo "$1" / 10 | bc)""K" | numfmt --from=si)" 1>/dev/null
	else
		redshift -x 1>/dev/null; redshift -O "$(echo "$1""K" | numfmt --from=si)" 1>/dev/null
	fi
else
	redshift -x 1>/dev/null
fi
