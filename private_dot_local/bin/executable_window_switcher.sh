#!/bin/bash
windows=$(hyprctl clients | grep "title:" | awk -F'title: ' '{print $2}')
selected=$(echo "$windows" | fuzzel --dmenu)
if [ -n "$selected" ]; then
  hyprctl dispatch focuswindow "title:$selected"
fi
