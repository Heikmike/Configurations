#!/bin/bash

function toggle_border() {
    grep_result=$(hyprctl getoption general:border_size 0 | grep "int: 0")
    if [ -z "$grep_result" ]; then
        hyprctl keyword animations:enabled no # prevents flickering
        hyprctl keyword general:border_size 0
        hyprctl dispatch forcerendererreload none
        sleep 0.5 # needed to prevent flickering
        hyprctl keyword animations:enabled yes
    else
        hyprctl keyword animations:enabled no # prevents flickering
        hyprctl keyword general:border_size 2
        hyprctl dispatch forcerendererreload none
        sleep 0.5 # needed to prevent flickering
        hyprctl keyword animations:enabled yes
    fi
}

toggle_border
