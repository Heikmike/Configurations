#! /bin/zsh

icon="/home/heikmike/Documents/Repositories/Configurations/dunst/icons/archlinux_original.svg"
appname="BatteryCheck"
title="Battery State"
timeout=3000

# Get battery value and check if charging
battery=$(acpi -b | grep -P -o '[0-9]+(?=%)')
message="${battery}% left"
dunstify -I $icon -a $appname -t $timeout $title $message

