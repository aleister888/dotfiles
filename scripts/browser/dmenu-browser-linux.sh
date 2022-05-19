#!/bin/sh
option0=".."
option1="Gentoo Wiki"
option2="Arch Wiki"
option3="Void Linux Handbook"
option4="Void Linux (chroot installation)"
option5="Configure Bootloader (Gentoo Wiki)"
option6="Scripting Color Formatting"
option7="LoL - Linux Troubleshooting"
option8="Keysym Naming (2 Tabs)"
options="$option0\n$option1\n$option2
$option3\n$option4\n$option5\n$option6
$option7\n$option8"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER https://wiki.gentoo.org/wiki/Main_Page;;
$option2) $BROWSER https://wiki.archlinux.org/;;
$option3) $BROWSER https://docs.voidlinux.org/;;
$option4) $BROWSER https://docs.voidlinux.org/installation/guides/chroot.html;;
$option5) $BROWSER https://wiki.gentoo.org/wiki/Handbook:AMD64/Installation/Bootloader;;
$option6) $BROWSER https://misc.flogisoft.com/bash/tip_colors_and_formatting;;
$option7) $BROWSER https://old.reddit.com/r/leagueoflinux/wiki/index#wiki_3_-_.1F527_tech_support_and_troubleshooting;;
$option8) $BROWSER https://wiki.linuxquestions.org/wiki/List_of_Keysyms_Recognised_by_Xmodmap & sleep 0.5 && browser https://wiki.linuxquestions.org/wiki/XF86_keyboard_symbols;;
esac
