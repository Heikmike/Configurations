#!/bin/bash

kitty --single-instance --hold \
  -- bash -c "bc -l -q" &

sleep 0.1
hyprctl dispatch togglefloating
sleep 0.1
hyprctl dispatch resizeactive exact 800 500
