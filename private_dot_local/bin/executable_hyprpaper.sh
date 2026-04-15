#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
WALLPAPER=$(fdfind . "$WALLPAPER_DIR" | shuf -n 1)

hyprctl hyprpaper wallpaper ",$WALLPAPER,cover"
