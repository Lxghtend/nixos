#!/usr/bin/env bash

get_sony_event() {
    grep -r "Sony Computer Entertainment Wireless Controller$" /sys/class/input/*/device/name 2>/dev/null \
        | head -1 \
        | sed 's|/sys/class/input/\(event[0-9]*\)/.*|\1|'
}

while true; do
    EVENT=$(get_sony_event)
    if [ -z "$EVENT" ]; then
        echo "Waiting for Sony controller..."
        sleep 2
        continue
    fi
    
    echo "Found controller at /dev/input/$EVENT"
    evtest /dev/input/$EVENT | while read line; do
        if echo "$line" | grep -q "BTN_MODE.*value 1"; then
            obs-cmd replay save
        fi
    done
    
    echo "Controller disconnected, retrying..."
    sleep 2
done
