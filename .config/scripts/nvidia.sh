#!/usr/bin/env bash

get_gpu(){
GPU=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits );
TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits );
}
get_gpu

if (("$TEMP" > 75)); then
   echo "$GPU% $TEMP°C "
else  
   echo "$GPU% $TEMP°C"       
fi 
