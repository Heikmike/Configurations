#!/bin/bash

# Minimum battery percentage to trigger the notification
MIN_BATTERY_PERCENTAGE=20

while true; do
    # Get the current battery percentage
    BATTERY_PERCENTAGE=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    # Check if the battery percentage is below the threshold
    if [[ $BATTERY_PERCENTAGE -lt $MIN_BATTERY_PERCENTAGE ]]; then
        # Send a notification using Dunst
        dunstify --urgency=critical "Battery Low" "Battery is at ${BATTERY_PERCENTAGE}%."
    fi

    # Sleep for 5 minutes before checking again
    sleep 180
done
