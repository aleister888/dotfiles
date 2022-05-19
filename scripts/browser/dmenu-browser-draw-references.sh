#!/bin/sh
option0=".."
option1="justsketch.me"
option2="Anatomy & Perspective Art Lesson - YouTube"
option3="pixiv"
options="$option0\n$option1\n$option2\n$option3"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER app.justsketch.me;;
$option2) $BROWSER www.youtube.com/watch?v=ehz-lF3UwqQ;;
$option3) $BROWSER pixiv.net/en/users/6035423;;
esac
