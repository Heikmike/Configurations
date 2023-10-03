#!/bin/bash

kitty --class calculator --title calculator --name calculator --single-instance --hold -- bash -c "bc -l; read -p 'Press enter to close'" &

sleep 0.1
hyprctl dispatch togglefloating
sleep 0.1
hyprctl dispatch resizeactive exact 800 500
# sleep 0.5
# hyprctl dispatch centerwindow
# sleep 0.5
# hyprctl dispatch moveactive exact 500 -300

