#!/usr/bin/env bash

# This script is intended to make switching between laptop and external displays easier when using i3+dmenu
# To run this script, map it to some shortcut in your i3 config, e.g:
# bindsym $mod+p exec --no-startup-id $config/display.sh
# IMPORTANT: run chmod +x on the script to make it executable
# The result is 4 options appearing in dmenu, from which you can choose

# This is your default laptop screen, detect by running `xrandr --query` and seeing which display you are currently on
INTERNAL_OUTPUT="eDP-1"

# choices will be displayed in dmenu
choices="laptop\ndual\nexternal\nclone"

# Your choice in dmenu will determine what xrandr command to run
chosen=$(echo -e $choices | rofi -dmenu)

# This is used to determine which external display you have connected
# This may vary between OS. e.g VGA1 instead of VGA-1
if [ `xrandr | grep VGA-1 | grep -c ' connected '` -eq 1 ]; then
    EXTERNAL_OUTPUT="VGA-1"
fi
if [ `xrandr | grep DVI-1 | grep -c ' connected '` -eq 1 ]; then
    EXTERNAL_OUTPUT="DVI-1"
fi
if [ `xrandr | grep HDMI-1 | grep -c ' connected '` -eq 1 ]; then
    EXTERNAL_OUTPUT="HDMI-1"
fi
if [ `xrandr | grep HDMI-2 | grep -c ' connected '` -eq 1 ]; then
    EXTERNAL_OUTPUT="HDMI-2"
fi
if [ `xrandr | grep HDMI-3 | grep -c ' connected '` -eq 1 ]; then
    EXTERNAL_OUTPUT="HDMI-3"
fi
if [ `xrandr | grep DP-1 | grep -c ' connected '` -eq 1 ]; then
    EXTERNAL_OUTPUT="DP-1"
fi
if [ `xrandr | grep DP-2 | grep -c ' connected '` -eq 1 ]; then
    EXTERNAL_OUTPUT="DP-2"
fi
if [ `xrandr | grep DP-3 | grep -c ' connected '` -eq 1 ]; then
    EXTERNAL_OUTPUT="DP-3"
fi

# xrander will run and turn on the display you want, if you have an option for 3 displays, this will need some modifications
case "$chosen" in
    external) xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto --primary ;;
    laptop) xrandr --output $INTERNAL_OUTPUT --auto --primary --output $EXTERNAL_OUTPUT --off ;;
    clone) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT ;;
    dual) xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT --primary ;;
esac
