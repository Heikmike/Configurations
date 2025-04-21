#! /bin/zsh

icon="/home/heikmike/Documents/Repositories/Configurations/dunst/icons/battery_low.svg"
appname="Battery"
title="Battery Low"
timeout=10000
test="0"

while true
do
    # Get battery value and check if charging
    first_battery=$(acpi -b | grep -P -o '[0-9]+(?=%)' | head -n 1)
    second_battery=$(acpi -b | grep -P -o '[0-9]+(?=%)' | head -n 2 | tail -1)

    if [[ $first_battery == "0" ]]; then
      battery=$second_battery
    else
      battery=$first_battery
    fi

    is_charging=$(acpi -b | grep -P -o 'Charging')
    message="${battery}% left"

    # If battery is less than 20% and not charging
    if [ $battery -lt 20 ] && [ -z "$is_charging" ] ; then
      dunstify -I $icon -a $appname -t $timeout $title $message
    fi

    sleep 180
done
