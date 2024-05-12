#!/bin/bash

INTERVAL=5
status=$(playerctl status | grep -o Playing)
command=$(pgrep -xf 'sway-audio-idle-inhibit')

while true; do
  # Check if the video is playing and that no other `sway-audio-idle-inhibit` is running
  if [[ $status && !$command ]]; then
    sway-audio-idle-inhibit
  else
    killall sway-audio-idle-inhibit
  fi
  
  sleep $INTERVAL
done
