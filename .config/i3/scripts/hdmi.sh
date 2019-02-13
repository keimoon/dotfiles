#!/usr/bin/env bash

if xrandr | grep -q 'HDMI-1 connected '; then
    exit 0
fi
xrandr --output HDMI-1 --auto --left-of eDP-1
