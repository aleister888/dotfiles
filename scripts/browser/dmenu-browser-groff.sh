#!/bin/sh
option0=".."
option1="groff install-font.sh guide"
option2="groff install-font.sh download"
option3="groff paper size"
option4="gpic.pdf"
option5="control registers"
options="$option0\n$option1\n$option2
$option3\n$option4\n$option5"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER https://tkurtbond.github.io/posts/2021/07/17/groff-and-install-fontsh-and-installing-fonts-for-use-in-groff/;;
$option2) $BROWSER schaffter.ca/mom/mom-05.html\#install-font;;
$option3) $BROWSER https://www.gnu.org/software/groff/manual/html_node/Paper-Size.html;;
$option4) $BROWSER http://yingtongdiddleipo.ee.wits.ac.za/help/gpic.pdf;;
$option5) $BROWSER https://www.gnu.org/software/groff/manual/html_node/ms-Document-Control-Registers.html#ms-Document-Control-Registers;;
esac
