#!/bin/sh
option0=".."
option1="image noise"
option2="resize image"
option3="waifu2x"
option4="invert image colors"
option5="blur image"
option6="vectorizer"
option7="gradient to image"
option8="dual tone"
option9="GIF > PNG"
option10="file converter"
option11="catbox (upload images)"
option12="imgbb (upload images)"
options="$option0\n$option1\n$option2
$option3\n$option4\n$option5\n$option6
$option7\n$option8\n$option9\n$option10
$option11\n$option12"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER noise.imageonline.co;;
$option2) $BROWSER resizeimage.net;;
$option3) $BROWSER waifu2x.udp.jp;;
$option4) $BROWSER pinetools.com/invert-image-colors;;
$option5) $BROWSER pinetools.com/blur-image;;
$option6) $BROWSER vectorizer.com;;
$option7) $BROWSER angrytools.com/gradient/image/;;
$option8) $BROWSER www10.lunapic.com/editor/?action=twotone;;
$option9) $BROWSER https://www.freeconvert.com/gif-to-png;;
$option10) $BROWSER https://www.freeconvert.com;;
$option11) $BROWSER https://catbox.moe/;;
$option12) $BROWSER https://imgbb.com/;;
esac
