#!/bin/sh
option0="duckduckgo"
option1="google"
option2="youtube"
option3="odysee"
option4="deezer (deemix)"
option5="discord"
option6="qutebrowser bindings"
option28="4chan"
#mail
option7="protonmail (e-mail)"
option8="gmail (e-mail)"
option9="cock.li (e-mail)"
option10="correo uni (e-mail)"
#general
option11="github"
option25="gitlab"
option12="aula virtual"
option13="netflix"
option14="komga"
option15="(traductor) google"
option16="(traductor) deepl"
option17="tauon music box - spanish translation"
option18="WhatsApp Web"
option19="monkeytype"
option20="replace text (vim)"
option22="my dotfiles"
option23="lukesmith dotfiles"
option24="noticias uno"
option26="instagram"
option27="router"
option29="u.gg"
option30="oppo a74 trwp"
#reddit
option21="reddit"
option999="/REDDIT" #$HOME/.local/scripts/browser/dmenu-browser-reddit.sh
#tabs
option998="/TABS" #$HOME/.local/scripts/browser/dmenu-browser-tabs.sh
#image tools
option997="/IMAGE TOOLS" #$HOME/.local/scripts/browser/dmenu-browser-image-tools.sh
#draw references
option996="/DRAW REFERENCES" #$HOME/.local/scripts/browser/dmenu-browser-draw-references.sh
option994="/INTERNET TOOLS" #$HOME/.local/scripts/browser/dmenu-browser-internet-tools.sh
#minecraft
option993="/MINECRAFT" #$HOME/.local/scripts/browser/dmenu-browser-minecraft.sh
#groff
option992="/GROFF" #$HOME/.local/scripts/browser/dmenu-browser-groff.sh
#latex
option991="/LATEX" #$HOME/.local/scripts/browser/dmenu-browser-latex.sh
#torrenting
option990="/TORRENTING" #$HOME/.local/scripts/browser/dmenu-browser-torrenting.sh
#linux
option989="/LINUX" #$HOME/.local/scripts/browser/dmenu-browser-linux.sh
#
options="$option0\n$option1\n$option2
$option3\n$option4\n$option5\n$option6
$option28\n$option7\n$option8\n$option9
$option10\n$option11\n$option25\n$option12
$option13\n$option14\n$option15\n$option16
$option17\n$option18\n$option19\n$option20
$option22\n$option23\n$option24\n$option26
$option27\n$option29\n$option21\n$option30
$option999\n$option998\n$option997\n$option996
$option994\n$option993\n$option992\n$option991
$option990\n$option989"
chosen="$(echo "$options" | dmenu -l 13 -p $BROWSER )"
case $chosen in
$option0) $BROWSER start.duckduckgo.com;;
$option1) $BROWSER google.com;;
$option2) $BROWSER youtube.com;;
$option3) $BROWSER odysee.com;;
$option4) $BROWSER deezer.com/us;;
$option5) $BROWSER https://discord.com/app;;
$option6) $BROWSER https://raw.githubusercontent.com/browser/browser/master/doc/img/cheatsheet-big.png;;
$option28) $BROWSER https://www.4chan.org/;;
$option7) $BROWSER protonmail.com/login;;
$option8) $BROWSER gmail.com;;
$option9) $BROWSER mail.cock.li;;
$option10) $BROWSER https://outlook.office365.com/mail/inbox;;
$option11) $BROWSER github.com;;
$option25) $BROWSER https://gitlab.com/gitlab-com;;
$option12) $BROWSER https://campusvirtual.uclm.es/my/;;
$option13) $BROWSER netflix.com/browse;;
$option14) $BROWSER browser http://localhost:8080 & notify-send "pacoe1000@protonmail.com" "5Kgdv4TNDzwaJh8 (Copied to clipboard)"; echo 5Kgdv4TNDzwaJh8 | xclip -selection clipboard;;
$option15) $BROWSER translate.google.com.mx/;;
$option16) $BROWSER deepl.com/translator;;
$option17) $BROWSER hosted.weblate.org/projects/tauon-music-box/tauon-music-box/es/;;
$option18) $BROWSER web.whatsapp.com;;
$option19) $BROWSER monkeytype.com;;
$option20) $BROWSER linuxize.com/post/vim-find-replace;;
$option21) $BROWSER reddit.com;;
$option22) $BROWSER https://github.com/aleister888/aleister888-dotfiles;;
$option23) $BROWSER https://github.com/LukeSmithxyz/voidrice;;
$option24) $BROWSER https://www.noticiasuno.com/category/emisiones/;;
$option26) $BROWSER https://www.instagram.com;;
$option27) $BROWSER https://192.168.0.1;;
$option29) $BROWSER https://u.gg;;
$option30) $BROWSER https://github.com/orgs/TeamWin/repositories?q=oppo&type=all&language=&sort=name;;
#
$option999) sh $HOME/.local/scripts/browser/dmenu-browser-reddit.sh;;
$option998) sh $HOME/.local/scripts/browser/dmenu-browser-tabs.sh;;
$option997) sh $HOME/.local/scripts/browser/dmenu-browser-image-tools.sh;;
$option996) sh $HOME/.local/scripts/browser/dmenu-browser-draw-references.sh;;
$option994) sh $HOME/.local/scripts/browser/dmenu-browser-internet-tools.sh;;
$option993) sh $HOME/.local/scripts/browser/dmenu-browser-minecraft.sh;;
$option992) sh $HOME/.local/scripts/browser/dmenu-browser-groff.sh;;
$option991) sh $HOME/.local/scripts/browser/dmenu-browser-latex.sh;;
$option990) sh $HOME/.local/scripts/browser/dmenu-browser-torrenting.sh;;
$option989) sh $HOME/.local/scripts/browser/dmenu-browser-linux.sh;;
esac
