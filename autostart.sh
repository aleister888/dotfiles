#!/bin/sh

# changes wallpaper every 10min
while true; do
	feh --randomize --no-fehbg --bg-fill $HOME/Pictures/Wallpapers
	sleep 600
done &

# prevents mic gain from reseting
while true; do
	pactl set-source-volume alsa_input.pci-0000_00_1f.3.analog-stereo 17694
	sleep 1
done &

# autosuspend feature
while true; do
	$HOME/.local/scripts/auto-suspend
	sleep 5
done &

# trackpad options
xinput set-prop 'ELAN1205:00 04F3:30E9 Touchpad' 'libinput Accel Profile Enabled' &
xinput set-prop 'ELAN1205:00 04F3:30E9 Touchpad' 'libinput Accel Speed' 1.000000 &
xinput set-prop 'ELAN1205:00 04F3:30E9 Touchpad' 'libinput Tapping Enabled' 1 &

export LC_ALL="es_ES.UTF-8" 
export QT_QPA_PLATFORMTHEME="qt5ct"
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
xset -dpms & xset s off

# apps
lxsession &
gnome-keyring-daemon --start &
pkill dwmblocks; dwmblocks &
dunst &
picom &
parcellite &
sxhkd &
nm-applet &
blueman-applet &
unclutter --idle 3 &

# turns of laptop display if external one is connected
if [ "$(xrandr | grep HDMI-0 | awk {'print $2'} 2>&1)" = "connected" ]; then
	xrandr --output "$(xrandr | grep eDP | awk {'print $1'})" --off && \
	sleep 1 && feh --randomize --no-fehbg --bg-fill $HOME/Pictures/Wallpapers
fi
