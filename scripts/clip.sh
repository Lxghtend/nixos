#!/usr/bin/env bash 
evtest /dev/input/event258 | while read line; do
    if echo "$line" | grep -q "BTN_MODE.*value 1"; then
        obs-cmd replay save
    fi
done
