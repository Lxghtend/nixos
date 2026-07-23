#!/usr/bin/env bash

CACHE_FILE="/tmp/waybar_mic_cache"

DB=$(sox -q -t pulseaudio default -n trim 0 1 stat 2>&1 | awk '/Maximum amplitude/ {if ($3 > 0) printf "%.0f", 20*log($3)/log(10)}')

if [ -n "$DB" ]; then
    echo "$DB" > "$CACHE_FILE"
else
    if [ -f "$CACHE_FILE" ]; then
        DB=$(cat "$CACHE_FILE")
    else
        DB="0"
    fi
fi

echo "{\"text\": \"$DB\", \"tooltip\": \"Peak mic volume\"}"
