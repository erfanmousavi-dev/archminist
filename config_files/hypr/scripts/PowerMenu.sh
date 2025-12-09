#!/usr/bin/env bash

entries=" Lock\n Suspend\n Hibernate\n Reboot\n Shutdown"

selected=$(echo -e "$entries" | wofi --dmenu --prompt="Power Menu" --width=250 --height=140)

case "$selected" in
    " Lock") 
        hyprlock ;;
    " Suspend")
        systemctl suspend ;;
    " Hibernate")
        systemctl hibernate ;;
    " Reboot")
        systemctl reboot ;;
    " Shutdown")
        systemctl poweroff ;;
esac
