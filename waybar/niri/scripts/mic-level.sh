#!/usr/bin/env bash

while true; do
    DB=$(sox -q -t pulseaudio default -n trim 0 0.3 stat 2>&1 | \
        awk '/Maximum amplitude/ {if ($3 > 0) printf "%.0f", 20*log($3)/log(10)}')
    [ -z "$DB" ] && DB="0"
    echo "{\"text\": \"$DB\", \"tooltip\": \"Peak mic volume\"}"
done
