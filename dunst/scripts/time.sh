#! /bin/zsh

time=$(date +"%H:%M")
timeout=3000
icon="/home/heikmike/Documents/Repositories/Configurations/dunst/icons/clock.svg"
appname="Time"
dunstify -I $icon -t $timeout -a $appname $time
