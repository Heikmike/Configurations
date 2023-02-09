#! /bin/zsh

# Get battery value using acpi
battery=$(acpi -b | grep -P -o '[0-9]+(?=%)')

while true
do
    # If battery is less than 20% and not charging
    if [ $battery -lt 20 ] 
    then
        # Send notification
        dunstify "Battery is low ($battery%)" -u critical -I /home/heikmike/.config/dunst/icons/battery_low.png
    fi

    sleep 180
done
