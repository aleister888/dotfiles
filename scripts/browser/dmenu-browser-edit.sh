#!/bin/sh
option0="edit this script"
option1="dmenu-browser"
option2="dmenu-browser-reddit.sh"
option3="dmenu-browser-tabs.sh"
option4="dmenu-browser-image-tools.sh"
option5="dmenu-browser-draw-references-sfw.sh"
option7="dmenu-browser-internet-tools.sh"
option8="dmenu-browser-minecraft.sh"
option9="dmenu-browser-groff.sh"
option10="dmenu-browser-latex.sh"
option11="dmenu-browser-torrenting.sh"
option13="dmenu-browser-linux.sh"
options="$option0\n$option1\n$option2\n$option3
$option4\n$option5\n$option7\n$option8\n$option9
$option10\n$option11\n$option13"
#
chosen="$(echo "$options" | dmenu -l 13 -p "edit bookmarks")"
case $chosen in
$option0) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-edit.sh;;
$option1) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option2) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-reddit.sh;;
$option3) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-tabs.sh;;
$option4) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-image-tools.sh;;
$option5) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-draw-references.sh;;
$option7) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-internet-tools.sh;;
$option8) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-minecraft.sh;;
$option9) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-groff.sh;;
$option10) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-latex.sh;;
$option11) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-torrenting.sh;;
$option13) $TERMINAL vim $HOME/.local/scripts/browser/dmenu-browser-linux.sh;;
esac
