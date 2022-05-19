#!/bin/sh

option0="1080p"
dwm1080() { \
	sed -i 's/Ubuntu Mono:bold:size=../Ubuntu Mono:bold:size=14/g' $HOME/.local/source/dwm/config.h; \
	sed -i 's/Symbols Nerd Font:size=../Symbols Nerd Font:size=12/g' $HOME/.local/source/dwm/config.h; \
	cd $HOME/.local/source/dwm; sudo make install; \
	sed -i 's/Ubuntu Mono:bold:size=../Ubuntu Mono:bold:size=14/g' $HOME/.local/source/dmenu/config.h; \
	sed -i 's/Symbols Nerd Font:size=../Symbols Nerd Font:size=13/g' $HOME/.local/source/dmenu/config.h; \
	cd $HOME/.local/source/dmenu; sudo make install; \
	sed -i 's+font_size ..+font_size 12+g' $HOME/.config/kitty/kitty.conf; \
	sed -i 's+font = Ubuntu Mono Bold ..+font = Ubuntu Mono Bold 10+' $HOME/.config/dunst/dunstrc
}

option1="1440p"
dwm1440() { \
	sed -i 's/Ubuntu Mono:bold:size=../Ubuntu Mono:bold:size=16/g' $HOME/.local/source/dwm/config.h; \
	sed -i 's/Symbols Nerd Font:size=../Symbols Nerd Font:size=14/g' $HOME/.local/source/dwm/config.h; \
	cd $HOME/.local/source/dwm; sudo make install; \
	sed -i 's/Ubuntu Mono:bold:size=../Ubuntu Mono:bold:size=16/g' $HOME/.local/source/dmenu/config.h; \
	sed -i 's/Symbols Nerd Font:size=../Symbols Nerd Font:size=14/g' $HOME/.local/source/dmenu/config.h; \
	cd $HOME/.local/source/dmenu; sudo make install; \
	sed -i 's+font_size ..+font_size 14+g' $HOME/.config/kitty/kitty.conf; \
	sed -i 's+font = Ubuntu Mono Bold ..+font = Ubuntu Mono Bold 14+' $HOME/.config/dunst/dunstrc
}

option2="2160p"
dwm2160() { \
	sed -i 's/Ubuntu Mono:bold:size=../Ubuntu Mono:bold:size=20/g' $HOME/.local/source/dwm/config.h; \
	sed -i 's/Symbols Nerd Font:size=../Symbols Nerd Font:size=16/g' $HOME/.local/source/dwm/config.h; \
	cd $HOME/.local/source/dwm; sudo make install; \
	sed -i 's/Ubuntu Mono:bold:size=../Ubuntu Mono:bold:size=20/g' $HOME/.local/source/dmenu/config.h; \
	sed -i 's/Symbols Nerd Font:size=../Symbols Nerd Font:size=16/g' $HOME/.local/source/dmenu/config.h; \
	cd $HOME/.local/source/dmenu; sudo make install; \
	sed -i 's+font_size ..+font_size 18+g' $HOME/.config/kitty/kitty.conf; \
	sed -i 's+font = Ubuntu Mono Bold ..+font = Ubuntu Mono Bold 18+' $HOME/.config/dunst/dunstrc
}

options="$option0\n$option1\n$option2"
chosen="$(echo "$options" | dmenu -p "Change font size:")"

case $chosen in
$option0) dwm1080;;
$option1) dwm1440;;
$option2) dwm2160;;
esac
