#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ pacman -S binutils gzip p7zip tar unrar unzip xz zip\e[0m\n"; confirm;
pacman -S binutils gzip p7zip tar unrar unzip xz zip

printf "\e[1;32m$ pacman -S ranger atool cpio ffmpegthumbnailer highlight mediainfo odt2txt w3m ueberzug\e[0m\n"; confirm;
pacman -S ranger atool cpio ffmpegthumbnailer highlight mediainfo odt2txt w3m ueberzug

printf "\e[1;32m$ pacman -S curl git libgit2 wget gparted gpart dosfstools mtools ntfs-3g rclone rsync sshfs\e[0m\n"; confirm;
pacman -S curl git libgit2 wget gparted gpart dosfstools mtools ntfs-3g rclone rsync sshfs

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit       
