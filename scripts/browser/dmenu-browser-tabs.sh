#!/bin/sh
option0=".."
option1="primanota.ru"
option2="songsterr"
option3="gtptabs"
options="$option0\n$option1\n$option2
$option3"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER primanota.ru;;
$option2) $BROWSER www.songsterr.com;;
$option3) $BROWSER gtptabs.com;;
esac
