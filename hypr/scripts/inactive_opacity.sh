#!/bin/bash

current_opacity=$(hyprctl getoption decoration:inactive_opacity -j | jq -r '.float')

if (( $(echo "$current_opacity == 0.8" | bc -l) )); then
    new_opacity=1
else
    new_opacity=0.8
fi

hyprctl keyword decoration:inactive_opacity $new_opacity

