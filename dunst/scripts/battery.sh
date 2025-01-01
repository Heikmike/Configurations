#! /bin/zsh

icon="/home/heikmike/Documents/Repositories/Configurations/dunst/icons/archlinux.svg"
appname="Battery"
title="Battery Low"
timeout=10000

while true
do
    # Get battery value and check if charging
    battery=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    is_charging=$(acpi -b | grep -P -o 'Charging')
    message="${battery}% left"

    # If battery is less than 20% and not charging
    if [ $battery -lt 20 ] && [ -z "$is_charging" ] ; then
      dunstify -I $icon -a $appname -t $timeout $title $message
    fi

    sleep 180
done
