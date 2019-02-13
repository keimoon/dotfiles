#!/usr/bin/env bash

here=`cd $(dirname $BASH_SOURCE); pwd`

POLYBAR_CONFIG_FOLDER=$here/config.d
POLYBAR_CONFIG_FILE=$here/config

function buildConfig {
    cat > $POLYBAR_CONFIG_FILE <<EOF
; This is an auto-generated file, do not edit it manually.
; Run ~/.config/polybar/launch.sh to relaunch the bar
EOF
    for fname in `ls $POLYBAR_CONFIG_FOLDER`; do
        cat $POLYBAR_CONFIG_FOLDER/$fname >> $POLYBAR_CONFIG_FILE
        echo >> $POLYBAR_CONFIG_FILE
    done
}

function runPolybar {
    killall -q polybar

    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    for m in $(polybar --list-monitors | cut -d":" -f1); do
        WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}') MONITOR=$m polybar --reload top > /dev/null 2>&1 &
	    WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}') MONITOR=$m polybar --reload bottom > /dev/null 2>&1 &

        # A little sleep here to put system tray to HDMI output
        sleep 1
    done
}

buildConfig && runPolybar
