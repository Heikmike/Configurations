#!/bin/bash

# Minimum battery percentage to trigger the notification
MIN_BATTERY_PERCENTAGE=20

while true; do
    # Get the current battery percentage
    BATTERY_PERCENTAGE=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    # Check if the battery percentage is below the threshold
    if [[ $BATTERY_PERCENTAGE -lt $MIN_BATTERY_PERCENTAGE ]]; then
        # Send a notification using Dunst
        dunstify "Battery Low" "Battery level is ${BATTERY_PERCENTAGE}%. Please connect your charger."
    fi

    # Sleep for 5 minutes before checking again
    sleep 180
done
