#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/"
WALLPAPER=$(fdfind . "$WALLPAPER_DIR" | shuf -n 1)

awww img "$WALLPAPER" --resize=crop --filter=Nearest --transition-type wipe
