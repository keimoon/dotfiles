#!/usr/bin/env bash

function ramp {
    load=$1
    if (( $(echo "$average < 12" |bc -l) )); then
        echo -n ▁
    elif (( $(echo "$average < 25" |bc -l) )); then
        echo -n ▂
    elif (( $(echo "$average < 37" |bc -l) )); then
        echo -n ▃
    elif (( $(echo "$average < 50" |bc -l) )); then
        echo -n ▄
    elif (( $(echo "$average < 62" |bc -l) )); then
        echo -n ▅
    elif (( $(echo "$average < 75" |bc -l) )); then
        echo -n ▆
    elif (( $(echo "$average < 87" |bc -l) )); then
        echo -n ▇
    else
        echo -n █
    fi
}

output=`mpstat -P ALL 1 1`

average=`echo "$output" | grep Average | grep all | awk '{print $3}'`

if (( $(echo "$average < 40" |bc -l) )); then
    class=normal
elif (( $(echo "$average < 75" |bc -l) )); then
    class=warning
else
    class=critical
fi

text="$average%"
for load in `echo "$output" | grep Average | grep -v all | grep -v CPU | awk '{print $3}'`; do
    value=`ramp $load`
    text="$text $value"
done

echo "{\"percentage\": $average, \"class\": \"$class\", \"tooltip\": \"$average%\", \"text\": \"$text\"}"
