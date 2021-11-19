#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

# celluloid
printf "\e[1;32m$ pacman -S celluloid youtube-dl\e[0m\n"; confirm;
pacman -S celluloid youtube-dl
# --volume-max=500

# discord
printf "\e[1;32m$ pacman -S discord libpulse xdg-utils\e[0m\n"; confirm;
pacman -S discord libpulse xdg-utils

# gimp
printf "\e[1;32m$ pacman -S gimp gutenprint\e[0m\n"; confirm;
pacman -S gimp gutenprint

# kodi 
printf "\e[1;32m$ pacman -S kodi\e[0m\n"; confirm;
pacman -S kodi

# lollypop
printf "\e[1;32m$ pacman -S lollypop gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly kid3-qt libsecret\e[0m\n"; confirm;
pacman -S lollypop gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly kid3-qt

# mkvtoolnix-gui
printf "\e[1;32m$ pacman -S mkvtoolnix-gui fdkaac\e[0m\n"; confirm;
pacman -S mkvtoolnix-gui fdkaac

# musescore
printf "\e[1;32m$ pacman -S musescore lame\e[0m\n"; confirm;
pacman -S musescore lame
# Exec=env PULSE_LATENCY_MSEC=30 mscore %F

# system tray icons
printf "\e[1;32m$ pacman -S gnome-shell-extension-appindicator libappindicator-gtk2 libappindicator-gtk3\e[0m\n"; confirm;
pacman -S gnome-shell-extension-appindicator libappindicator-gtk2 libappindicator-gtk3

# exit
printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit

# easytag
# pacman -S easytag
# xdg-mime default org.gnome.Nautilus.desktop inode/directory

# fonts
# pacman -S awesome-terminal-fonts ttf-font-awesome
# pacman -S adobe-source-{code-pro-fonts,sans-pro-fonts,serif-pro-fonts} 
# pacman -S noto-fonts noto-fonts-{cjk,emoji,extra} 
# pacman -S cantarell-fonts gnu-free-fonts 
# pacman -S ttf-{bitstream-vera,caladea,carlito,dejavu,droid,fira-code,fira-mono,hack,inconsolata,jetbrains-mono}
# pacman -S ttf-{liberation,linux-libertine,opensans,roboto,roboto-mono,ubuntu-font-family}

# games
# pacman -S extremetuxracer minetest supertux supertuxkart

# hydrogen
# pacman -S hydrogen jack2 jack2-dbus realtime-privileges
# gpasswd -a skippy realtime

# krita
# pacman -S krita ffmpeg kimageformats krita-plugin-gmic kseexpr libheif opencolorio1 poppler-qt5 python-pyqt5

# latex
# pacman -S texlive-core texlive-bin texlive-bibtexextra texlive-fontsextra texlive-formatsextra texlive-latexextra biber dialog ed java-runtime texmaker

# libreoffice-fresh
#  pacman -S libreoffice-fresh libreoffice-fresh-en-gb jre-openjdk hunspell hunspell-en_GB hyphen hyphen-en libmythes mythes-en

# materia-gtk-theme
# pacman -S materia-gtk-theme kvantum-theme-materia

# python
# pacman -S python-pip python-pipenv python-virtualenv jupyterlab python-ipykernel

# terminator
# pacman -S terminator python-nautilus 
# git clone https://aur.archlinux.org/nautilus-open-any-terminal.git
# com.github.stunkymonkey.nautilus-open-any-terminal

# tilix
# pacman -S tilix python-nautilus
