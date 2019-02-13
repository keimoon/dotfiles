#!/usr/bin/env bash

function findTrackpadId {
    xinput list | grep -i touchpad | head -1 | grep -o 'id=[0-9]*' | sed 's/id=//' 2>/dev/null
}

function enableTabToClick {
    local id=$1
    propId=`xinput list-props $id | grep 'Tapping Enabled' | head -1 | grep -o '([0-9]*)' | sed 's/[()]//g' 2>/dev/null`
    if [ -z "$propId" ]; then
        echo "Tapping feature not found"
        return 1
    fi
    xinput set-prop $id $propId 1
}

function enableTrackpadFeatures {
    trackpadId=`findTrackpadId`
    if [ -z "$trackpadId" ]; then
        echo "Trackpad not found"
        return 1
    fi
    enableTabToClick $trackpadId
}

enableTrackpadFeatures
