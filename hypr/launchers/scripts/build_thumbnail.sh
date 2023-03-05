#!/bin/bash

evincethumb() {
    SAVE_FOLDER=$HOME/.cache/thumbnails/xlarge
    full_path="file://$(realpath -s "$1")"
    md5name=$(printf %s "${full_path// /%20}" | md5sum)
    echo "$md5name" >> /tmp/log
    if [ -f "$SAVE_FOLDER/${md5name%% *}.png" ]; then
        rm "$SAVE_FOLDER/${md5name%% *}.png"
    fi
    evince-thumbnailer -s 512 -l "$1" $SAVE_FOLDER/${md5name%% *}.png 2>/dev/null
}

export -f evincethumb

for folder in "$@"; do
    find "$folder" -type f -exec bash -c 'evincethumb "{}"' \;
done
