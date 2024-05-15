#!/bin/bash

# Check if "1920x1080_tablet" mode exists for HDMI-0
if ! xrandr | grep "HDMI-0" | grep -q "1920x1080_tablet"; then
  # Create a new mode for the tablet if it does not exist
  xrandr --newmode "1920x1080_tablet" 148.50 1920 2008 2052 2200 1080 1084 1089 1125 +hsync +vsync
  # Add the new mode to the HDMI-0 output
  xrandr --addmode HDMI-0 "1920x1080_tablet"
fi

# Ensure the HDMI-0 is set to use the "1920x1080_tablet" mode
xrandr --output HDMI-0 --mode "1920x1080_tablet" --right-of DVI-D-0

# Dynamically find the ID for the Wacom Cintiq 16 Pen stylus
STYLUS_ID=$(xinput | grep "Wacom Cintiq 16 Pen stylus" | grep -o 'id=[0-9]*' | cut -d= -f2)

# Map the tablet to the new screen
xinput map-to-output $STYLUS_ID HDMI-0
