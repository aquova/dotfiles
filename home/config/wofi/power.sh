#!/bin/bash

entries="Logout\nReboot\nShutdown"

selected=$(echo -e $entries | wofi --dmenu | awk `{print tolower($1)}`)

case $selected in
    logout)
        ;;
    reboot)
        exec systemctl reboot;;
    shutdown)
        exec systemctl poweroff -i;;
esac

