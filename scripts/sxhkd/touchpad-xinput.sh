#!/bin/sh
# disable or enable touchpad

pkill dunst; dunst &

TOUCHPAD=$(xinput | grep Touchpad | awk {'print $6'} | sed 's/^...//')
LOGITECH_TOUCHPAD=$(xinput | grep 'K400 Plus' | grep pointer | awk {'print $6'} | sed 's/^...//')

if	[ "$(xinput | grep 'K400 Plus' 2>&1)" = "" ]; then
	if	[ "$(xinput --list-props $TOUCHPAD | grep "Device Enabled" | awk {'print $4'} 2>&1)" = "1" ]; then
		xinput set-prop $TOUCHPAD "Device Enabled" 0 && notify-send 'Touchpad disabled'
	else
		xinput set-prop $TOUCHPAD "Device Enabled" 1 && notify-send 'Touchpad enabled'
	fi
else
	if	[ "$(xinput --list-props $LOGITECH_TOUCHPAD | grep "Device Enabled" | awk {'print $4'} 2>&1)" = "1" ]; then
			xinput set-prop $LOGITECH_TOUCHPAD "Device Enabled" 0 && notify-send 'Logitech Touchpad disabled' && \
			xinput set-prop $TOUCHPAD "Device Enabled" 0
	else
			xinput set-prop $LOGITECH_TOUCHPAD "Device Enabled" 1 && notify-send 'Logitech Touchpad enabled' && \
			xinput set-prop $TOUCHPAD "Device Enabled" 1
	fi
fi
