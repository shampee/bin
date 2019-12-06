#!/bin/ksh
if [[ $# -eq 0 ]]; then
	redshift -x &> /dev/null
else
	redshift -x &> /dev/null

	sci=$(echo "$1" | upper | numfmt --from=si)
	redshift -O "$sci" &> /dev/null
fi
