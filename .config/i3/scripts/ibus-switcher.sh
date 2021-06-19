#!/usr/bin/env bash

if ! ps -ef | grep ibus-daemon | grep -v -q grep; then
    echo "Ibus daemon is not running"
fi

currentEngine=`ibus engine`

if [ "$currentEngine" == "xkb:us::eng" ]; then
    ibus engine Unikey
else
    ibus engine xkb:us::eng
fi
