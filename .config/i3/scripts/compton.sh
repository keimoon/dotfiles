#!/usr/bin/env bash

killall -q compton

while pgrep -u $UID -x compton >/dev/null; do sleep 1; done

compton --config ~/.config/compton.conf -b > /dev/null 2>&1 &
