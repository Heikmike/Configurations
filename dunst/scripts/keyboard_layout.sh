#!/bin/bash


hyprctl \
  --batch "$(
    hyprctl devices -j |
      jq -r '.keyboards[] | .name' |
      while IFS= read -r keyboard; do
        printf '%s %s %s;' 'switchxkblayout' "${keyboard}" 'next'
      done
  )"

current_layout=$(hyprctl devices | grep 'active keymap' | awk -F ':' '{print $2}' | head -n 1)
icon="/home/heikmike/Documents/Repositories/Configurations/dunst/icons/keyboard.svg"
title="$current_layout"
timeout=1000
appname="KeyboardLayout"

# dunstify -I $icon -a $appname -t $timeout $title 'test'
dunstify \
  -I "$icon" \
  -a "$appname" \
  -t "$timeout" \
  "$title"
