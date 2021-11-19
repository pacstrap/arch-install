#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ nano /etc/vconsole.conf\e[0m\n"; confirm;
cat > /etc/vconsole.conf <<EOF
KEYMAP=en_AU.UTF-8
FONT=ter-i16n
EOF
nano /etc/vconsole.conf

printf "\e[1;32m$ nano /etc/hostname\e[0m\n"; confirm;
cat > /etc/hostname <<EOF
archlinux
EOF
nano /etc/hostname

printf "\e[1;32m$ nano /etc/hosts\e[0m\n"; confirm;
cat > /etc/hosts <<EOF
127.0.0.1   localhost
::1         localhost
127.0.1.1   archlinux.localdomain archlinux
EOF
nano /etc/hosts

printf "\e[1;32m$ nano /etc/locale.gen\e[0m\n"; confirm;
cat > /etc/locale.gen <<EOF
en_AU.UTF-8 UTF-8
EOF
nano /etc/locale.gen

printf "\e[1;32m$ locale-gen\e[0m\n"; confirm;
locale-gen

printf "\e[1;32m$ nano /etc/locale.conf\e[0m\n"; confirm;
cat > /etc/locale.conf <<EOF
LANG=en_AU.UTF-8
EOF
nano /etc/locale.conf

printf "\e[1;32m$ nano /etc/environment\e[0m\n"; confirm;
cat > /etc/environment <<EOF
LANG=en_AU.UTF-8
QT_QPA_PLATFORMTHEME=qt5ct
EDITOR=vim
EOF
nano /etc/environment

printf "\e[1;32m$ ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime\e[0m\n"; confirm;
ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime

printf "\e[1;32m$ hwclock --systohc --utc\e[0m\n"; confirm;
hwclock --systohc --utc

printf "\e[1;32m$ passwd\e[0m\n"; confirm;
echo root:password | chpasswd

printf "\e[1;32m$ useradd -m -G wheel -s /bin/bash skippy\e[0m\n"; confirm;
useradd -m -G wheel -s /bin/bash skippy
echo skippy:password | chpasswd

printf "\e[1;32m$ EDITOR=nano visudo\e[0m\n"; confirm;
EDITOR=nano visudo

printf "\e[1;32m$ nano /etc/mkinitcpio.conf\e[0m\n"; confirm;
cat > /etc/mkinitcpio.conf <<EOF
MODULES=(amdgpu radeon)
BINARIES=()
FILES=()
HOOKS=(base udev autodetect keyboard modconf block lvm2 filesystems resume fsck)
EOF
nano /etc/mkinitcpio.conf

printf "\e[1;32m$ mkinitcpio -p linux\e[0m\n"; confirm;
mkinitcpio -p linux

printf "\e[1;32m$ bootctl --path=/boot install\e[0m\n"; confirm;
bootctl --path=/boot install

printf "\e[1;32m$ nano /boot/loader/entries/linux.conf\e[0m\n"; confirm;
cat > /boot/loader/entries/linux.conf <<EOF
title Arch Linux
linux /vmlinuz-linux
initrd /amd-ucode.img
initrd /initramfs-linux.img
options root=UUID=$(blkid -s UUID -o value /dev/vg1/lv_root) resume=UUID=$(blkid -s UUID -o value /dev/nvme0n1p2) rw
EOF
nano /boot/loader/entries/linux.conf

printf "\e[1;32m$ nano /boot/loader/entries/linux-fallback.conf\e[0m\n"; confirm;
cat > /boot/loader/entries/linux-fallback.conf <<EOF
title Arch Linux (fallback)
linux /vmlinuz-linux
initrd /amd-ucode.img
initrd /initramfs-linux-fallback.img
options root=UUID=$(blkid -s UUID -o value /dev/vg1/lv_root) resume=UUID=$(blkid -s UUID -o value /dev/nvme0n1p2) rw
EOF
nano /boot/loader/entries/linux-fallback.conf

printf "\e[1;32m$ nano /boot/loader/loader.conf\e[0m\n"; confirm;
cat > /boot/loader/loader.conf <<EOF
default linux
timeout 5
editor 0
EOF
nano /boot/loader/loader.conf

printf "\e[1;32m$ reflector -c Australia -a 6 --sort rate --save /etc/pacman.d/mirrorlist --verbose\e[0m\n"; confirm;
reflector -c Australia -a 6 --sort rate --save /etc/pacman.d/mirrorlist --verbose

printf "\e[1;32m$ pacman -Syyu\e[0m\n"; confirm;
pacman -Syyu

printf "\e[1;32m$ pacman-key --init && pacman-key --populate archlinux\e[0m\n"; confirm;
pacman-key --init && pacman-key --populate archlinux

printf "\e[1;32m$ pacman -S xorg xorg-xinit xdg-{user-dirs,utils} xf86-input-libinput xf86-video-{fbdev,vesa,amdgpu,ati}\e[0m\n"; confirm;
pacman -S xorg xorg-xinit xdg-{user-dirs,utils} xf86-input-libinput xf86-video-{fbdev,vesa,amdgpu,ati}

printf "\e[1;32m$ pacman -S gnome dconf-editor ghex gnome-sound-recorder gnome-todo gnome-tweaks gnome-usage\e[0m\n"; confirm;
pacman -S gnome dconf-editor ghex gnome-sound-recorder gnome-todo gnome-tweaks gnome-usage

printf "\e[1;32m$ pacman -S acpi acpi_call acpid avahi nss-mdns cups firewalld iptables-nft ipset networkmanager ntp openssh tlp ethtool\e[0m\n"; confirm;
pacman -S acpi acpi_call acpid avahi nss-mdns cups firewalld iptables-nft ipset networkmanager ntp openssh tlp ethtool 

printf "\e[1;32m$ nano /etc/X11/xorg.conf.d/00-keyboard.conf\e[0m\n"; confirm;
cat > /etc/X11/xorg.conf.d/00-keyboard.conf <<EOF
Section "InputClass"
	Identifier "system-keyboard"
	MatchIsKeyboard "on"
	Option "XkbLayout" "au"
EndSection
EOF
nano /etc/X11/xorg.conf.d/00-keyboard.conf

printf "\e[1;32m$ nano /etc/X11/xorg.conf.d/20-amdgpu.conf\e[0m\n"; confirm;
cat > /etc/X11/xorg.conf.d/20-amdgpu.conf <<EOF
Section "Device"
	Identifier "AMD"
	Driver "amdgpu"
	Option "DRI" "3"
	Option "AccelMethod" "SNA"
	Option "TearFree" "true"
EndSection
EOF
nano /etc/X11/xorg.conf.d/20-amdgpu.conf

printf "\e[1;32m$ nano /etc/X11/xorg.conf.d/30-touchpad.conf\e[0m\n"; confirm;
cat > /etc/X11/xorg.conf.d/30-touchpad.conf <<EOF
Section "InputClass"
	Identifier "touchpad"
	Driver "libinput"
	MatchIsTouchpad "on"
	Option "Tapping" "on"
	Option "NaturalScrolling" "true"
EndSection
EOF
nano /etc/X11/xorg.conf.d/30-touchpad.conf

printf "\e[1;32m$ nano /etc/nsswitch.conf\e[0m\n"; confirm;
cat > /etc/nsswitch.conf <<EOF
# Name Service Switch configuration file.
# See nsswitch.conf(5) for details.

passwd: files systemd
group: files [SUCCESS=merge] systemd
shadow: files

publickey: files

hosts: files mymachines myhostname mdns4_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

netgroup: files
EOF
nano nano /etc/nsswitch.conf

# disable services
printf "\e[1;32m$ systemctl disable bluetooth.service\e[0m\n"; confirm;
systemctl disable bluetooth.service

printf "\e[1;32m$ systemctl disable systemd-resolved.service\e[0m\n"; confirm;
systemctl disable systemd-resolved.service

# enable services
printf "\e[1;32m$ systemctl enable acpid.service\e[0m\n"; confirm;
systemctl enable acpid.service

printf "\e[1;32m$ systemctl enable avahi-daemon.service\e[0m\n"; confirm;
systemctl enable avahi-daemon.service

printf "\e[1;32m$ systemctl enable cups.service\e[0m\n"; confirm;
systemctl enable cups.service

printf "\e[1;32m$ systemctl enable firewalld.service\e[0m\n"; confirm;
systemctl enable firewalld.service

printf "\e[1;32m$ systemctl enable gdm.service\e[0m\n"; confirm;
systemctl enable gdm.service

printf "\e[1;32m$ systemctl enable NetworkManager.service\e[0m\n"; confirm;
systemctl enable NetworkManager.service

printf "\e[1;32m$ systemctl enable ntpd.service\e[0m\n"; confirm;
systemctl enable ntpd.service

printf "\e[1;32m$ systemctl enable sshd.service\e[0m\n"; confirm;
systemctl enable sshd.service

printf "\e[1;32m$ systemctl enable tlp.service\e[0m\n"; confirm;
systemctl enable tlp.service
