#!/bin/sh
option0=".."
option1="accents"
option2="basic macros"
option3="luke-smith templates"
option4="font sizes"
option5="arara"
option6="text alignment"
option7="tiny text"
option8="overleaf gallery"
option9="greek letters and math symbols"
options="$option0\n$option1\n$option2
$option3\n$option4\n$option5\n$option6
$option7\n$option8\n$option9"
#
chosen="$(echo "$options" | dmenu -l 13 -p "$BROWSER")"
case $chosen in
$option0) sh $HOME/.local/scripts/browser/dmenu-browser.sh;;
$option1) $BROWSER tex.stackexchange.com/tags/accents/info;;
$option2) $BROWSER https://www.vim.org.local/scripts/browser/script.php?script_id=93;;
$option3) $BROWSER github.com/LukeSmithxyz/latex-templates;;
$option4) $BROWSER latex-tutorial.com/changing-font-size/;;
$option5) $BROWSER github.com/islandoftex/arara;;
$option6) $BROWSER overleaf.com/learn/latex/Text_alignment;;
$option7) $BROWSER stackoverflow.com/questions/54723341/how-to-right-align-text-and-justify-it-latex;;
$option8) $BROWSER https://www.overleaf.com/gallery;;
$option9) $BROWSER https://www.overleaf.com/learn/latex/List_of_Greek_letters_and_math_symbols;;
esac
