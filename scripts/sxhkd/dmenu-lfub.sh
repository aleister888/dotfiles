#!/bin/sh
TERMINAL=kitty
#
option0="laTeX          ($HOME/Documents/laTeX)"
option1="Uni            ($HOME/Documents/Uni)"
option2="Tabs           ($HOME/Documents/Tabs)"
option3="Downloads      ($HOME/Downloads)"
option4="Pictures       ($HOME/Pictures)"
option5=".config        ($HOME/.config)"
option6=".local/source  ($HOME/.local/source)"
option7=".local         ($HOME/.local)"
option8="Music          (/media/aleister/Music)"
option9="Covers         (/media/aleister/Covers)"
option10="Videos         (/media/aleister/Videos)"
option11=".local/mnt     ($HOME/.local/mnt)"
option12="RocksmithSongs (/media/aleister/SteamLibrary/steamapps/common/Rocksmith2014/dlc)"
options="$option0\n$option1\n$option2
$option3\n$option4\n$option5\n$option6
$option7\n$option8\n$option9\n$option10
$option11\n$option12"
#
chosen="$(echo "$options" | dmenu -l 13)"
case $chosen in
$option0) $TERMINAL $HOME/.local/scripts/lfub $HOME/Documents/laTeX;;
$option1) $TERMINAL $HOME/.local/scripts/lfub $HOME/Documents/Uni;;
$option2) $TERMINAL $HOME/.local/scripts/lfub $HOME/Documents/Tabs;;
$option3) $TERMINAL $HOME/.local/scripts/lfub $HOME/Downloads;;
$option4) $TERMINAL $HOME/.local/scripts/lfub $HOME/Pictures;;
$option5) $TERMINAL $HOME/.local/scripts/lfub $HOME/.config;;
$option6) $TERMINAL $HOME/.local/scripts/lfub $HOME/.local/source;;
$option7) $TERMINAL $HOME/.local/scripts/lfub $HOME/.local;;
$option8) $TERMINAL $HOME/.local/scripts/lfub /media/aleister/Music;;
$option9) $TERMINAL $HOME/.local/scripts/lfub /media/aleister/Covers;;
$option10) $TERMINAL $HOME/.local/scripts/lfub /media/aleister/Videos;;
$option11) $TERMINAL $HOME/.local/scripts/lfub $HOME/.local/mnt;;
$option12) $TERMINAL $HOME/.local/scripts/lfub /media/aleister/SteamLibrary/steamapps/common/Rocksmith2014/dlc;;
esac
