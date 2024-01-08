#!/usr/bin/env bash

DEVICE=enp2s0
LINK=$(cat /sys/class/net/$DEVICE/operstate);

if [ $LINK == up ]; then
    echo "%{F#00ff00}󰈀%{F-}"
else
    echo "%{F#ff0000}󰈀%{F-}"
fi
