#!/usr/bin/env bash
until [ -e /dev/input/event258 ]; do
    echo "Waiting for /dev/input/event258..."
    sleep 2
done
evtest /dev/input/event258 | while read line; do
    if echo "$line" | grep -q "BTN_MODE.*value 1"; then
        obs-cmd replay save
    fi
done
