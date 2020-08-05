#!/bin/sh
if [ $# -gt 0 ]; then
	redshift -x 1>/dev/null; redshift -O "$(echo "$1""K" | numfmt --from=si)" 1>/dev/null
else
	redshift -x 1>/dev/null
fi
