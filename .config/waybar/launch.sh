#!/usr/bin/env bash

here=`cd $(dirname $BASH_SOURCE); pwd`

function buildStyle {
    sass $here/style.scss $here/style.css
}

function run {
    killall -q waybar

    while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

    waybar -c $here/config-top.json > /dev/null 2>&1 &
    waybar -c $here/config-bottom.json > /dev/null 2>&1 &
}

buildStyle && run
