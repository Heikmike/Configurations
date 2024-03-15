#!/bin/bash

# Command to list all loaded wallpapers
listWallpapersCommand="hyprctl hyprpaper listloaded"

# Get the list of wallpapers
wallpapers=($($listWallpapersCommand))

# Path to store the index of the current wallpaper
currentIndexFile="/tmp/hyprpaper_current_index"

# Read the current index if the file exists, otherwise start with -1
if [[ -f "$currentIndexFile" ]]; then
    currentIndex=$(cat "$currentIndexFile")
else
    currentIndex=-1
fi

# Increment the index to move to the next wallpaper
currentIndex=$((currentIndex+1))

# If we've reached the end of the wallpapers list, loop back to the start
if [[ $currentIndex -ge ${#wallpapers[@]} ]]; then
    currentIndex=0
fi

hyprctl hyprpaper wallpaper "eDP-1,${wallpapers[$currentIndex]}"

# Save the new current index
echo $currentIndex > "$currentIndexFile"
