#!/usr/bin/env bash
UPPACMAN=$(($(checkupdates 2> /dev/null | wc -l || echo 0)));
UPYAY=$(($(yay -Qua 2> /dev/null | wc -l || echo 0)));

if (( UPPACMAN > 0)); then
	checkupdates > updates.txt
	if (( UPYAY > 0 )); then
		echo "AUR:" >> updates.txt
		yay -Qua >> updates.txt
	fi
else
	echo "No updates available" > updates.txt
fi

yad \
    --title "Updates available" --height=350 --center --borders=20 \
    --text-info < updates.txt \
    --button="Exit":0
