swayidle -w timeout 300 'swaylock -f' \
            timeout 330 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            timeout 390 'systemctl suspend' \
            before-sleep 'swaylock -f' \
            after-resume 'hyprctl dispatch dpms on' &
