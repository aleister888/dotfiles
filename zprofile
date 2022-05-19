#!/bin/zsh
# set keyboard -> spanish
doas loadkeys es
# App Settings
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="qutebrowser"
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME="qt5ct"
# ~/ Clean Up
export CUDA_CACHE_PATH="$HOME/.cache/nv"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$HOME/.config/java"
export XAUTHORITY="$HOME/.config/Xauthority"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
export WINEPREFIX="$HOME/.config/wineprefixes"
export LESSHISTFILE="-"
export TERMINFO_DIRS="$HOME/.config/terminfo:/usr/share/terminfo"
# hid-nintendo SDL2 mappings
export SDL_GAMECONTROLLERCONFIG="050000007e0500000920000001800000,Nintendo Switch Pro Controller,platform:Linux,a:b0,b:b1,x:b3,y:b2,back:b9,guide:b11,start:b10,leftstick:b12,rightstick:b13,leftshoulder:b5,rightshoulder:b6,dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b7,righttrigger:b8,
030000007e0500000920000011810000,Nintendo Switch Pro Controller,platform:Linux,a:b0,b:b1,x:b3,y:b2,back:b9,guide:b11,start:b10,leftstick:b12,rightstick:b13,leftshoulder:b5,rightshoulder:b6,dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b7,righttrigger:b8,
060000007e0500000620000000000000,Nintendo Switch Combined Joy-Cons,platform:Linux,a:b0,b:b1,x:b3,y:b2,back:b9,guide:b11,start:b10,leftstick:b12,rightstick:b13,leftshoulder:b5,rightshoulder:b6,dpup:b14,dpdown:b15,dpleft:b16,dpright:b17,leftx:a0,lefty:a1,rightx:a2,righty:a3,lefttrigger:b7,righttrigger:b8,
"
# lf Icons
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📁:\
ex=🎯:\
ln=📁:\
or=❌:\
*.dll=🪟:\
*.vst3=🪟:\
*.exe=🎯:\
*.txt=📜:\
*.ms=📜:\
*.tex=📜:\
*.markdown=📜:\
*.vim=📜:\
*.png=📸::\
*.webp=📸::\
*.ico=📸::\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.JPG=📸:\
*.gif=📸:\
*.svg=📸:\
*.tif=📸:\
*.tiff=📸:\
*.xcf=📸:\
*.eps=📸:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.kra=🎨:\
*.pdf=📚:\
*.docx=📚:\
*.djvu=📚:\
*.epub=📚:\
*.cbr=📚:\
*.cbz=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.md=📘:\
*README=📘:\
*LICENSE=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎵:\
*.wav=🎵:\
*.tg=🎼:\
*.gp=🎼:\
*.gp3=🎼:\
*.gp4=🎼:\
*.gp5=🎼:\
*.gpx=🎼:\
*.vst3=🔮:\
*.so=🔮:\
*.mid=🎹:\
*.mkv=🎥:\
*.mp4=🎥:\
*.m4v=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.MOV=🎥:\
*.kdenlive=🎬:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.tar.xz=📦:\
*.xnb=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.log=📙:\
*.reg=📙:\
*.aux=📙:\
*.toc=📙:\
*.iso=📀:\
*.img=💿:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.kdbx=🔑:\
*.jar=☕:\
*.java=☕:\
*.js=☕:\
*.RPP=🎺:\
*.RPP-bak=🎺:\
*.rpp=🎺:\
*.rpp-bak=🎺:\
*.rpp-PROX=🎺:\
*.reapeaks=🎸:\
*other.wav=🎸:\
*.psarc=🎸:\
*vocals.wav=🎤:\
*bass.wav=🎶:\
*drums.wav=🎶:\
*.vtt=🧾:\
*.desktop=🔄:\
*.lnk=🔄:\
*.conf=🔧:\
*.cfg=🔧:\
*.vdf=🔧:\
*.dmx=🔧:\
*.toml=🔧:\
*config.h=🔧:\
*config.def.h=🔧:\
*.json=🔧:\
*.ini=🔧:\
*.yml=🔧:\
*PKGBUILD=🔩:\
*Makefile=🔩:\
*Makefile.inc=🔩:\
*.mk=🔩:\
*.c=🔨:\
*.o=🔨:\
*.h=🔨:\
*.go=🔨:\
*.cache=⌛:\
*.tmp=⌛:\
*.history=⌛:\
*.mask=👺:\
*Dockerfile=🐳:\
*.vader=🧥:\
*.sh=🏄:\
*.py=🐍:\
*.blend=🧊:\
"
# start dwm (with external display setup)
if [[ "$(tty)" = "/dev/tty1" ]]; then
        startx /home/aleister/.config/xinit/dwm
fi
if [[ "$(tty)" = "/dev/tty1" ]]; then
trap '. $HOME/.config/logout; exit' 0
fi
if [[ "$(tty)" = "/dev/tty1" ]]; then
exit 0
fi

# start dwm (laptop display)
if [[ "$(tty)" = "/dev/tty2" ]]; then
        startx /home/aleister/.config/xinit/dwm-1080
fi
if [[ "$(tty)" = "/dev/tty2" ]]; then
trap '. $HOME/.config/logout; exit' 0
fi
if [[ "$(tty)" = "/dev/tty2" ]]; then
exit 0
fi
