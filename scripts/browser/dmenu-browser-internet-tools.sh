#!/bin/sh
option0=".."
option1="guerrillamail"
option2="temp-mail.org"
option3="fake name & identity"
option4="whats my ip?"
option5="pastebin.com"
option6="redditsave - download reddit videos"
option7="savetweetvid - download twitter videos"
option8="mega.nz"
option9="spyware.neocities"
option10="web browsers info (privacy respecting ranking)"
options="$option0\n$option1\n$option2
$option3\n$option4\n$option5\n$option6
$option7\n$option8\n$option9\n$option10"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER https://www.guerrillamail.com/es/;;
$option2) $BROWSER https://temp-mail.org/es;;
$option3) $BROWSER https://fauxid.com/;;
$option4) $BROWSER https://www.whatismyip.com/;;
$option5) $BROWSER pastebin.com;;
$option6) $BROWSER https://redditsave.com/;;
$option7) $BROWSER https://www.savetweetvid.com/;;
$option8) $BROWSER https://mega.io/;;
$option9) $BROWSER https://spyware.neocities.org/;;
$option10) $BROWSER https://tilde.club/~acz/shadow_wiki/browsers.xhtml;;
esac
