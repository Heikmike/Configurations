#! /bin/bash

home="/home/heikmike"
configs="/home/heikmike/Documents/Repositories/Configurations"

paths=(
    "$home/.zshrc"
    "$configs/nvim/"
    "$configs/kitty/kitty.conf"
    "$configs/hypr/"
    "$configs/eww/"
    "$configs/"
)

names=(
    "Zsh"
    "Nvim"
    "Kitty"
    "Hypr"
    "Eww"
    "All"
)

for ((i = 0; i < ${#paths[@]}; i++)); do

    if [ $# -eq 0 ]; then
        echo -en "${names[$i]}\n"
    fi

    if [ $# -eq 1 ]; then
        if [ "$1" == "${names[$i]}" ]; then
            if [ -f "${paths[$i]}" ]; then
                coproc kitty zsh -c "nvim ${paths[$i]}" &
            elif [ -d "${paths[$i]}" ]; then
                coproc kitty zsh -c "cd ${paths[$i]} && nvim" &
            fi
            exit
        fi
    fi

done
