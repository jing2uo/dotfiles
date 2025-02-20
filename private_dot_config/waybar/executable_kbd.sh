#!/bin/bash
#  _____                 _
# |_   _|__   __ _  __ _| | ___
#   | |/ _ \ / _` |/ _` | |/ _ \
#   | | (_) | (_| | (_| | |  __/
#   |_|\___/ \__, |\__, |_|\___|
#            |___/ |___/
#

CACHE_DIR="/tmp"
CACHE_FILE="laptop-keyboard-disabled"
CACHE="$CACHE_DIR/$CACHE_FILE"

if [ "$1" == "--toggle" ]; then
  if [ -f "$CACHE" ]; then
    rm "$CACHE"
    sh -c "hyprctl keyword 'device[at-translated-set-2-keyboard]:enabled' 1"
  else
    touch "$CACHE"
    sh -c "hyprctl keyword 'device[at-translated-set-2-keyboard]:enabled' 0"
  fi
else
  count=$(ls $CACHE_DIR | grep $CACHE_FILE | wc -l)
  if [ $count -gt 0 ]; then
    echo "Off"
  else
    echo "On"
  fi
fi
