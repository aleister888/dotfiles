#!/bin/sh
option0=".."
option1="torlook"
option2="torrentsearcher.herokuapp.com"
option3="torrentseeker"
option4="nyaa.si"
options="$option0\n$option1\n$option2
$option3\n$option4"
#
chosen="$(echo "$options" | dmenu -l 13 -p "browser")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) browser gw1.torlook.info;;
$option2) browser torrentsearcher.herokuapp.com;;
$option3) browser torrentseeker.com/;;
$option4) browser nyaa.si;;
esac
