#!/usr/bin/env bash

killall -q dunst

while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

dunst > /dev/null 2>&1 &
