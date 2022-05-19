#!/bin/bash
# turns down brightness
pkill dunst; dunst &

BRIGHT=$(xrandr --verbose | grep -i brightnes | awk {'print $2'})
MONITOR=$(xrandr | grep primary | awk {'print $1'})
LAPTOP_MONITOR=$(xrandr | grep eDP | awk {'print $1'})

if [ "$(xrandr | grep HDMI-0 | awk {'print $2'} 2>&1)" = "connected" ]; then
	xrandr --output $MONITOR --brightness $(echo "scale=2; $BRIGHT - 0.1" | bc)
	notify-send "Brightnes set to $(echo "scale=2; $BRIGHT - 0.1" | bc)"
else
	xrandr --output $LAPTOP_MONITOR --brightness $(echo "scale=2; $BRIGHT - 0.1" | bc)
	notify-send "Brightnes set to $(echo "scale=2; $BRIGHT - 0.1" | bc)"
fi
