#! /bin/zsh

while true
do
    # Get battery value and check if charging
    battery=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    is_charging=$(acpi -b | grep -P -o 'Charging')

    # If battery is less than 20% and not charging
    if [ $battery -lt 20 ] && [ -z "$is_charging" ] ; then
      dunstify -u critical -I "/home/heikmike/Documents/Repositories/Configurations/dunst/icons/battery_low_white.png" -t 10000 "Battery Low" "${battery}% left"
    fi

    sleep 180
done
