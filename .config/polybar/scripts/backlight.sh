#!/usr/bin/env bash

function getLightOutput {
    value=$(python -c 'print(int(round(int('`light`') / 10) * 10))')
    if [ "$value" -lt 20 ]; then
        ramp=🌕
    elif [ "$value" -lt 40 ]; then
        ramp=🌔
    elif [ "$value" -lt 60 ]; then
        ramp=🌓
    elif [ "$value" -lt 80 ]; then
        ramp=🌒
    else
        ramp=🌑
    fi
    echo $ramp $value"%"
}

getLightOutput
