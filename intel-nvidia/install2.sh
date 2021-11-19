#!/bin/bash

# start script functions
continue () { read -p "Press [Enter] to continue..."; clear; }
# end script functions

clear

read -p "Press [Enter] to continue arch linux installation..."
clear

read -p "nano /etc/vconsole.conf"
cat > /etc/vconsole.conf <<EOF
KEYMAP=en_AU.UTF-8
FONT=ter-i16n
EOF
nano /etc/vconsole.conf
clear

read -p "nano /etc/hostname"
cat > /etc/hostname <<EOF
archlinux
EOF
nano /etc/hostname
clear

read -p "nano /etc/hosts"
cat > /etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   archlinux.localdomain archlinux
EOF
nano /etc/hosts
clear

read -p "nano /etc/locale.gen (Uncomment: #LANG=en_AU.UTF-8)"
nano /etc/locale.gen
clear

read -p "locale-gen"
locale-gen
continue

read -p "nano /etc/locale.conf"
cat > /etc/locale.conf <<EOF
LANG=en_AU.UTF-8
EOF
nano /etc/locale.conf
clear

read -p "nano /etc/environment"
cat > /etc/environment <<EOF
LANG=en_AU.UTF-8
QT_QPA_PLATFORMTHEME=qt5ct
EDITOR=vim
EOF
nano /etc/environment
clear

read -p "ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime"
ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime
continue

read -p "hwclock --systohc --utc"
hwclock --systohc --utc
continue

read -p "passwd"
clear
passwd
continue

read -p "useradd -m -G wheel -s /bin/bash skippy"
useradd -m -G wheel -s /bin/bash skippy
passwd skippy
continue

read -p "EDITOR=nano visudo"
EDITOR=nano visudo
clear

read -p "nano /etc/mkinitcpio.conf (...block lvm2 filesystems resume...)"
nano /etc/mkinitcpio.conf
clear

read -p "mkinitcpio -p linux"
mkinitcpio -p linux
continue

read -p "bootctl --path=/boot install"
bootctl --path=/boot install
continue

read -p "nano /boot/loader/entries/linux.conf"
cat > /boot/loader/entries/linux.conf <<EOF
title Arch Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options root=UUID=$(blkid -s UUID -o value /dev/vg1/lv_root) resume=UUID=$(blkid -s UUID -o value /dev/nvme0n1p2) rw pcie_aspm=off acpi_backlight=vendor loglevel=3 rd.systemd.show_status=auto rd.udev.log_priority=3
EOF
nano /boot/loader/entries/linux.conf
clear

read -p "nano /boot/loader/entries/linux-fallback.conf"
cat > /boot/loader/entries/linux-fallback.conf <<EOF
title Arch Linux (fallback)
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux-fallback.img
options root=UUID=$(blkid -s UUID -o value /dev/vg1/lv_root) resume=UUID=$(blkid -s UUID -o value /dev/nvme0n1p2) rw pcie_aspm=off acpi_backlight=vendor loglevel=3 rd.systemd.show_status=auto rd.udev.log_priority=3
EOF
nano /boot/loader/entries/linux-fallback.conf
clear

read -p "nano /boot/loader/loader.conf"
cat > /boot/loader/loader.conf <<EOF
default linux
timeout 5
editor 0
EOF
nano /boot/loader/loader.conf
clear

read -p "reflector -c Australia -a 6 --sort rate --save /etc/pacman.d/mirrorlist --verbose"
reflector -c Australia -a 6 --sort rate --save /etc/pacman.d/mirrorlist --verbose
continue

read -p "pacman -Syyu"
pacman -Syyu
continue

read -p "pacman-key --init && pacman-key --populate archlinux"
pacman-key --init && pacman-key --populate archlinux
continue

read -p "install xorg packages & drivers"
pacman -S xorg xorg-xinit xdg-{utils,user-dirs} xf86-input-libinput xf86-video-{fbdev,vesa,intel,nouveau} nvidia nvidia-settings nvidia-utils
continue

read -p "install gnome, gnome-extra & additional applications"
pacman -S gnome dconf-editor ghex gnome-{sound-recorder,todo,tweaks,usage} celluloid lollypop tilix python-nautilus
continue

read -p "remove unwanted applications"
pacman -Rns epiphany gedit gnome-boxes gnome-music gnome-software gnome-terminal totem
continue

read -p "nano /etc/X11/xorg.conf.d/00-keyboard.conf"
cat > /etc/X11/xorg.conf.d/00-keyboard.conf <<EOF
Section "InputClass"
	Identifier "system-keyboard"
	MatchIsKeyboard "on"
	Option "XkbLayout" "au"
EndSection
EOF
nano /etc/X11/xorg.conf.d/00-keyboard.conf
clear

read -p "nano /etc/X11/xorg.conf.d/30-touchpad.conf"
cat > /etc/X11/xorg.conf.d/30-touchpad.conf <<EOF
Section "InputClass"
	Identifier "touchpad"
	Driver "libinput"
	MatchIsTouchpad "on"
	Option "Tapping" "on"
EndSection
EOF
nano /etc/X11/xorg.conf.d/30-touchpad.conf
clear

read -p "systemctl enable NetworkManager.service"
systemctl enable NetworkManager.service
continue

read -p "systemctl enable gdm.service"
systemctl enable gdm.service
continue
