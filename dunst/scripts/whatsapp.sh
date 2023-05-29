#!/bin/bash

urgency="normal"
color="25D366"
icon_path="/home/heikmike/Pictures/whatsapp-logo.svg"

echo "Custom script executed at $(date)" >> /tmp/whatsapp.txt

notify-send -u "$urgency" -i "$icon_path" -a "$color" "WhatsApp" "$1"
