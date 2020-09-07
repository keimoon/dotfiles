#!/usr/bin/env bash

here=`cd $(dirname $BASH_SOURCE); pwd`

LOGFILE=/tmp/waybar-launch.log

function buildStyle {
    sass $here/style.scss $here/style.css
}

function run {
    killall -q waybar

    while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

    waybar -c $here/config-top.json >> $LOGFILE 2>&1 &
    waybar -c $here/config-bottom.json >> $LOGFILE 2>&1 &
}

buildStyle && run
