#!/usr/bin/env bash

if playerctl -l 2>&1 | grep -q "No players"; then
    text="No player"
    echo "{\"text\":\"$text\",\"class\":\"$status\"}"
    exit 0
fi

availblePlayers=`playerctl -l | grep -v chrome`

if [ -z "$availblePlayers" ]; then
    text="No player"
    echo "{\"text\":\"$text\",\"class\":\"$status\"}"
    exit 0
fi


status=`playerctl -p spotifyd status 2>/dev/null | tr A-Z a-z`
text=`playerctl -p spotifyd metadata -f '{{artist}} - {{title}}' 2>/dev/null`

if [ -z "$text" ]; then
    text="Nothing is playing"
fi

echo "{\"text\":\"$text\",\"class\":\"$status\"}"

