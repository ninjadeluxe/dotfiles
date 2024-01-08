#!/usr/bin/env bash

#UPDATES=$(($(checkupdates 2> /dev/null | wc -l || echo 0) + $(yay -Qu 2> /dev/null | wc -l || echo 0)));
get_total_updates() { UPDATES=$(($(checkupdates 2> /dev/null | wc -l || echo 0) + $(yay -Qu 2> /dev/null | wc -l || echo 0))); }
UPPACMAN=$(($(checkupdates 2> /dev/null | wc -l || echo 0)));
UPYAY=$(($(yay -Qua 2> /dev/null | wc -l || echo 0)));
while true; do
    get_total_updates

    if hash notify-send &>/dev/null; then
        if (( UPDATES > 50 )); then
            notify-send -u critical -i $NOTIFY_ICON \
                "You really need to update!!" "$UPDATES New packages"
        elif (( UPDATES > 25 )); then
            notify-send -u normal -i $NOTIFY_ICON \
                "You should update soon" "$UPDATES New packages"
        elif (( UPDATES > 2 )); then
            notify-send -u low -i $NOTIFY_ICON \
                "$UPDATES New packages"
        fi
    fi
    
    while (( UPDATES > 0 )); do
        echo " $UPPACMAN/$UPYAY"
        sleep 300
        get_total_updates
    done
    
    while (( UPDATES == 0 )); do
        echo " -/-"
        sleep 1800
        get_total_updates
    done
done
