#!/usr/bin/env bash

if xrandr | grep -q 'HDMI-1 connected '; then
    if xrandr | grep -q '+1920'; then
        exit 0
    fi
fi
xrandr --output HDMI-1 --auto --left-of eDP-1
