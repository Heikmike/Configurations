#!/bin/bash

name_of_screenshot=$(zenity --entry --title="Screenshot Name" --text="Enter the name of the screenshot:")

if [ -n "$name_of_screenshot" ]; then
    grimblast copysave area ~/Pictures/Screenshots/"$name_of_screenshot".png
else
    zenity --error --text="No name entered. Screenshot not saved."
fi
