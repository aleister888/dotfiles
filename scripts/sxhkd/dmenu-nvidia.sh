#!/bin/sh
option0="Switch to NVIDIA"
option1="Switch to Intel"
option2="Switch to Hybrid"
options="$option0\n$option1\n$option2"
chosen="$(echo "$options" | dmenu -p "Graphic Card:")"
case $chosen in
$option0) optimus-manager --switch nvidia --no-confirm;;
$option1) optimus-manager --switch integrated --no-confirm;;
$option2) optimus-manager --switch hybrid --no-confirm;;
esac
