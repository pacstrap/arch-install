#!/bin/bash

# insync
git clone https://aur.archlinux.org/insync.git
git clone https://aur.archlinux.org/insync-nautilus.git

# enpass-bin
git clone https://aur.archlinux.org/enpass-bin.git
sudo pacman -S libxdg-basedir

# brave-bin
git clone https://aur.archlinux.org/brave-bin.git
sudo pacman -S chrome-gnome-shell libgnome-keyring libnotify
git clone https://aur.archlinux.org/flashplugin.git

# rambox-pro-bin
git clone https://aur.archlinux.org/rambox-pro-bin.git

# discord
sudo pacman -S discord libpulse xdg-utils

# qbittorrent
sudo pacman -S qbittorrent

# mkvtoolnix-gui
sudo pacman -S mkvtoolnix-gui fdkaac

# celluloid
--volume-max=500

# easytag
sudo pacman -S easytag
xdg-mime default org.gnome.Nautilus.desktop inode/directory

# lollypop
sudo pacman -S gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly kid3-qt libsecret youtube-dl

# hydrogen
$ sudo pacman -S hydrogen jack2 jack2-dbus realtime-privileges ...
$ sudo gpasswd -a skippy realtime

# musescore
sudo pacman -S musescore lame
Exec=env PULSE_LATENCY_MSEC=30 mscore %F 

# texmaker
sudo pacman -S texmaker texlive-core texlive-bin texlive-bibtexextra biber ed dialog java-runtime
sudo pacman -S texlive-fontsextra texlive-formatsextra texlive-latexextra

# jabref
git clone https://aur.archlinux.org/jabref.git
git clone https://aur.archlinux.org/archlinux-java-run.git

# masterpdfeditor
git clone https://aur.archlinux.org/masterpdfeditor.git

# krita
sudo pacman -S krita ffmpeg kimageformats krita-plugin-gmic kseexpr libheif opencolorio1 poppler-qt5 python-pyqt5

# python
sudo pacman -S python-pip python-pipenv python-virtualenv jupyterlab python-ipykernel

# rstudio
sudo pacman -S r
git clone https://aur.archlinux.org/rstudio-desktop-bin.git
# If you are experiencing segmentation fault, delete the ".rstudio-desktop" folder from your home directory then restart the program should fix the issue.

# sublime-text
git clone https://aur.archlinux.org/gconf.git
git clone https://aur.archlinux.org/libgksu.git
git clone https://aur.archlinux.org/gksu.git
sudo pacman -S gtk2

# terminator
sudo pacman -S terminator python-nautilus 
git clone https://aur.archlinux.org/nautilus-open-any-terminal.git
com.github.stunkymonkey.nautilus-open-any-terminal

# ~/.config/terminator/config
[global_config]
  enabled_plugins = LaunchpadBugURLHandler, LaunchpadCodeURLHandler, APTURLHandler, TerminatorThemes
[keybindings]
[profiles]
  [[default]]
    background_color = "#300a24"
    cursor_color = "#bbbbbb"
    font = Source Code Pro 14
    foreground_color = "#eeeeec"
    show_titlebar = False
    palette = "#2e3436:#cc0000:#4e9a06:#c4a000:#3465a4:#75507b:#06989a:#d3d7cf:#555753:#ef2929:#8ae234:#fce94f:#729fcf:#ad7fa8:#34e2e2:#eeeeec"
    use_system_font = False
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
[plugins]

# tilix
sudo pacman -S tilix python-nautilus 

# libreoffice-fresh
sudo pacman -S libreoffice-fresh libreoffice-fresh-en-gb jre-openjdk hunspell hunspell-en_GB hyphen hyphen-en libmythes mythes-en

# fonts
sudo pacman -S adobe-source-{code-pro-fonts,sans-pro-fonts,serif-pro-fonts} noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra powerline-fonts ttf-{caladea,carlito,dejavu,liberation,linux-libertine-g,roboto,roboto-mono}

# printing
sudo pacman -S cups cups-pdf gutenprint hplip sane python-reportlab python-pillow

# file & file system related
sudo pacman -S curl git libgit2 rclone rsync wget dosfstools gparted gpart mtools ntfs-3g sshfs lrzip p7zip squashfs-tools unace unrar

# theme related
sudo pacman -S gtk-engine-murrine gtk-engines inkscape kvantum-qt5 optipng sassc

# games
sudo pacman -S extremetuxracer minetest supertux supertuxkart

# kodi
sudo pacman -S kodi

# firewalld
sudo pacman -S ebtables firewalld ipset

# terminal
sudo pacman -S asp bash-completion bat cmatrix mlocate neofetch pacman-contrib powerline reflector vifm vim zsh zsh-completions

# other packages
sudo pacman -S acpid cmake cockpit gcc-fortran gimp inetutils packagekit tk tlp tree

# enable services
sudo systemctl enable avahi-daemon.service
sudo systemctl enable bluetooth.service
sudo systemctl enable cups.service / sudo systemctl enable cups.socket
sudo systemctl enable firewalld.service
sudo systemctl enable sshd.service

sudo systemctl enable acpid.service
sudo systemctl enable cockpit.socket # https://localhost:9090/ 
sudo systemctl enable fstrim.timer
sudo systemctl enable reflector.timer
sudo systemctl enable tlp.service
