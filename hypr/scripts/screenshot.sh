#!/bin/bash

name_of_screenshot=$(zenity --width=900 --height=600 --entry --title="<big>Screenshot Name" --text="Enter the name of the screenshot:")

if [ -n "$name_of_screenshot" ]; then
    grimblast copysave area ~/Pictures/Screenshots/"$name_of_screenshot".png
else
    zenity --width=1000 --height=800 --error --text="No name entered. Screenshot not saved."
fi
