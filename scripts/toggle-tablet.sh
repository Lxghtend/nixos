#!/usr/bin/env bash

STATE_FILE="/tmp/tablet-output"

if [ ! -f "$STATE_FILE" ] || [ "$(cat $STATE_FILE)" = "DP-1" ]; then
    echo "HDMI-A-1" > "$STATE_FILE"
    OUTPUT="HDMI-A-1"
else
    echo "DP-1" > "$STATE_FILE"
    OUTPUT="DP-1"
fi

hyprctl keyword device[xppen-deco-01-v3-pen]:output "$OUTPUT"
