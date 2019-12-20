#!/bin/ksh
if [[ $# -gt 0 ]]; then
	redshift -x &> /dev/null
	redshift -O "$(echo "$1" | upper | numfmt --from=si)" &> /dev/null
	if [[ "$1" == +([0-9]) && "$1" -lt "1000" && "$1" ]]; then
		"$HOME"/bin/rs "$1"k
	fi
else
	redshift -x &> /dev/null
fi
	# "$var" == +([0-9]) && "$var" -lt 1000 || "$HOME"/bin/rs "$var"K
