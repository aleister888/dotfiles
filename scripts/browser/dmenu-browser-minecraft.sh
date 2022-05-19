#!/bin/sh
option0=".."
option1="biome finder (minecraft)"
option2="nethercalculator (minecraft)"
options="$option0\n$option1\n$option2"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER chunkbase.com/apps/biome-finder;;
$option2) $BROWSER nethercalculator.com;;
esac
