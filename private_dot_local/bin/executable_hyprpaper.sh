#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
WALLPAPER=$(fdfind . "$WALLPAPER_DIR" | shuf -n 1)
MONITOR=$(hyprctl monitors -j | jq -r '.[0].name')

hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER,cover"
