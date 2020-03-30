#!/usr/bin/env bash

function convertSpeed {
    speedKB=$1
    if (( $(echo "$speedKB < 1" | bc -l) )); then
        speed=`echo "$speedKB * 1024" | bc -l`
        unit=" B/s"
    elif (( $(echo "$speedKB < 1024" | bc -l) )); then
        speed=$speedKB
        unit="KB/s"
    else
        speed=`echo "$speedKB / 1024" | bc -l`
        unit="MB/s"
    fi
    printf "%-6.1f %s" $speed "$unit"
}

if [ $# -lt 1 ]; then
    echo "No interface"
    exit 0
fi

output=`sar -n DEV 1 1`

downSpeed=`echo "$output" | grep Average | grep $1 | awk '{print $5}'`
upSpeed=`echo "$output" | grep Average | grep $1 | awk '{print $6}'`

convertedDownSpeed=`convertSpeed $downSpeed`
convertedUpSpeed=`convertSpeed $upSpeed`

echo " $convertedDownSpeed    $convertedUpSpeed"
