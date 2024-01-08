#!/usr/bin/env bash

cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2}')
cpuTemp=$(($(cat /sys/class/thermal/thermal_zone*/temp) / 1000))

#echo $cpuUsage | bc -l
#echo $cpuUsage | awk '{print int($1+0.6)}'
printf "%.0f" $cpuUsage
echo "% $cpuTemp°C"
