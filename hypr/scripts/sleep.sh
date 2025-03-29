#!/bin/bash

current_brightness=$(brightnessctl get)

swayidle -w timeout 300 'swaylock -f' \
            timeout 330 'brightnessctl set 0' \
            resume "brightnessctl set $current_brightness" \
            timeout 390 'systemctl suspend' \
            before-sleep 'swaylock -f' &
