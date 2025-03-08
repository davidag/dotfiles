#!/bin/bash

i3status --config ~/.config/i3/i3status.conf | while read line
do
	LG=$(setxkbmap -query | awk '/layout/ {print toupper($2)}')
	LGDATA=$(cat <<-END
		, {"full_text": "LG: $LG"} ]
		END
	)
	# Check line contains data (ie. skip first two i3status lines)
	if echo "$line" | grep -q '\[.*\]$' ; then
		echo "${line/]/$LGDATA}" || exit 1
	else
		echo "$line" || exit 1
	fi
done
