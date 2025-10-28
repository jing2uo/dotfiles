#!/bin/bash
WALLPAPER_DIR=~/Pictures/Wallpapers

# 随机选择一张壁纸
WALLPAPER=$(ls "$WALLPAPER_DIR"/*.{jpg,png} 2>/dev/null | shuf -n 1)

# 如果没有找到壁纸，退出
if [ -z "$WALLPAPER" ]; then
  echo "No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

# 使用 swww 设置壁纸
swww img "$WALLPAPER" --resize=crop --filter=Nearest --transition-type wipe
