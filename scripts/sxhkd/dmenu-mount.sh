#!/bin/sh

# A dmenu prompt to mount drives.
getmount() { \
	[ -z "$chosen" ] && exit 1
        # shellcheck disable=SC2086
	mp="$(find $1 2>/dev/null | dmenu -p "Type in mount point.")" || exit 1
	test -z "$mp" && exit 1
	if [ ! -d "$mp" ]; then
		mkdiryn=$(printf "No\\nYes" | dmenu -p "$mp does not exist. Create it?") || exit 1
		[ "$mkdiryn" = "Yes" ] && (mkdir -p "$mp" || sudo -A mkdir -p "$mp")
	fi
	}

mountusb() { \
	chosen="$(echo "$usbdrives" | dmenu -p "Mount which drive?")" || exit 1
	chosen="$(echo "$chosen" | awk '{print $1}')"
	pkexec sudo -A mount "$chosen" 2>/dev/null && notify-send "💻 USB mounting" "$chosen mounted." && exit 0
	alreadymounted=$(lsblk -nrpo "name,type,mountpoint" | awk '$3!~/\/boot|\/home$|SWAP/&&length($3)>1{printf "-not ( -path *%s -prune ) ",$3}')
	getmount "$HOME/.local/mnt/*/ -maxdepth 0 -type d $alreadymounted"
	partitiontype="$(lsblk -no "fstype" "$chosen")"
	case "$partitiontype" in
		"vfat") pkexev sudo -A mount -t vfat "$chosen" "$mp" -o rw,umask=0000;;
		"exfat") pkexec sudo -A mount "$chosen" "$mp" -o uid="$(id -u)",gid="$(id -g)";;
		*) pkexec sudo -A mount "$chosen" "$mp"; user="$(whoami)"; ug="$(groups | awk '{print $1}')"; pkexec sudo -A chown "$user":"$ug" "$mp";;
	esac
	notify-send "💻 USB mounting" "$chosen mounted to $mp."
	}

mountandroid() { \
	chosen="$(echo "$anddrives" | dmenu -p "Which Android device?")" || exit 1
	chosen="$(echo "$chosen" | cut -d : -f 1)"
	getmount "$HOME/.local/mnt/*/ -maxdepth 0 -type d"
        simple-mtpfs --device "$chosen" "$mp"
	echo "OK" | dmenu -p "Tap Allow on your phone if it asks for permission and then press enter" || exit 1
	simple-mtpfs --device "$chosen" "$mp"
	notify-send "🤖 Android Mounting" "Android device mounted to $mp."
	}

asktype() { \
	choice="$(printf "USB\\nAndroid" | dmenu -p "Mount a USB drive or Android device?")" || exit 1
	case $choice in
		USB) mountusb ;;
		Android) mountandroid ;;
	esac
	}

nousb() { \
	option0="Cancel"
	option1="Exec 'mount -a'"
	options="$option0\n$option1"
	chosen="$(echo "$options" | dmenu -p "No USB drive or Android device detected")"
	case $chosen in
	$option0) exit;;
	$option1) pkexec sudo mount -a && notify-send "💻 USB Automounting";;
	esac
	}

anddrives=$(simple-mtpfs -l 2>/dev/null)
usbdrives="$(lsblk -rpo "name,type,size,mountpoint" | grep 'part\|rom' | awk '$4==""{printf "%s (%s)\n",$1,$3}')"

if [ -z "$usbdrives" ]; then
	[ -z "$anddrives" ] && nousb & exit
	echo "Android device(s) detected."
	mountandroid
else
	if [ -z "$anddrives" ]; then
		echo "USB drive(s) detected."
		mountusb
	else
		echo "Mountable USB drive(s) and Android device(s) detected."
		asktype
	fi
fi
