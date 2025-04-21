#! /bin/zsh

icon="/home/heikmike/Documents/Repositories/Configurations/dunst/icons/battery_check.svg"
appname="BatteryCheck"
title="Battery State"
timeout=3000

# Get battery value and check if charging
first_battery=$(acpi -b | grep -P -o '[0-9]+(?=%)' | head -n 1)
second_battery=$(acpi -b | grep -P -o '[0-9]+(?=%)' | head -n 2 | tail -1)

if [[ $first_battery == "0" ]]; then
  battery=$second_battery
else
  battery=$first_battery
fi

message="${battery}% left"
dunstify -I $icon -a $appname -t $timeout $title $message

