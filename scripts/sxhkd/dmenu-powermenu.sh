#!/bin/sh
option0=" lock"
option1=" logout"
option2=" suspend"
option3=" scheduled shutdown (10min)"
option4=" scheduled shutdown (30min)"
option5=" scheduled shutdown (60min)"
option6=" reboot"
option7=" shutdown"
options="$option0\n$option1\n$option2\n$option3
$option4\n$option5\n$option6\n$option7"
chosen="$(echo "$options" | dmenu -l 9 -p "")"
case $chosen in
$option0) i3lock-fancy;;
$option1) pkill dwm;;
$option2) systemctl suspend;;
$option3) sleep 600 && sudo systemctl poweroff;;
$option4) sleep 1800 && sudo systemctl poweroff;;
$option5) sleep 3600 && sudo systemctl poweroff;;
$option6) sudo systemctl reboot;;
$option7) sudo systemctl poweroff;;
$option8) sudo systemctl hibernate;;
esac
