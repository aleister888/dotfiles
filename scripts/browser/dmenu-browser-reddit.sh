#!/bin/sh
option0=".."
option1="r/archlinux"
option2="r/Cringetopia"
option3="r/groff"
option4="r/okbuddyretard"
option5="r/unixporn"
option6="r/wallpapers"
option7="r/196"
option8="r/MakeMeSuffer"
option9="r/deftones"
options="$option0\n$option1\n$option2
$option3\n$option4\n$option5\n$option6
$option7\n$option8\n$option9"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER reddit.com/r/archlinux/;;
$option2) $BROWSER reddit.com/r/Cringetopia/;;
$option3) $BROWSER reddit.com/r/groff/;;
$option4) $BROWSER reddit.com/r/okbuddyretard/;;
$option5) $BROWSER reddit.com/r/unixporn/;;
$option6) $BROWSER reddit.com/r/wallpapers/;;
$option7) $BROWSER reddit.com/r/196;;
$option8) $BROWSER reddit.com/r/MakeMeSuffer;;
$option9) $BROWSER https://www.reddit.com/r/deftones;;
esac
