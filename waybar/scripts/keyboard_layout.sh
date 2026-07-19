#!/bin/bash

while true; do
  hyprctl devices | grep 'active keymap' | awk -F ':' '{print $2}' | head -n 1
done
