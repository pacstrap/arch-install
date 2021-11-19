#!/bin/bash

# start script functions
continue () { read -p "Press [Enter] to continue..."; clear; }
# end script functions

clear

read -p "Press [Enter] to start arch linux installation..."
clear

read -p "pvcreate --dataalignment 1m /dev/nvme0n1p3"
pvcreate --dataalignment 1m /dev/nvme0n1p3
continue

read -p "vgcreate vg1 /dev/nvme0n1p3"
vgcreate vg1 /dev/nvme0n1p3
continue

read -p "lvcreate -L 64GB vg1 -n lv_root"
lvcreate -L 64GB vg1 -n lv_root
continue

read -p "lvcreate -L 64GB vg1 -n lv_home"
lvcreate -L 64GB vg1 -n lv_home
continue

read -p "lvcreate -l 100%FREE vg1 -n lv_storage"
lvcreate -l 100%FREE vg1 -n lv_storage
continue

read -p "modprobe dm_mod"
modprobe dm_mod
continue

read -p "vgscan"
vgscan
continue

read -p "vgchange -ay"
vgchange -ay
continue

read -p "mkfs.fat -F32 -n BOOT /dev/nvme0n1p1"
mkfs.fat -F32 -n BOOT /dev/nvme0n1p1
continue

read -p "mkswap -L SWAP /dev/nvme0n1p2"
mkswap -L SWAP /dev/nvme0n1p2
continue

read -p "swapon /dev/nvme0n1p2"
swapon /dev/nvme0n1p2
continue

read -p "mkfs.ext4 -L ROOT /dev/vg1/lv_root"
mkfs.ext4 -L ROOT /dev/vg1/lv_root
continue

read -p "mkfs.ext4 -L HOME /dev/vg1/lv_home"
mkfs.ext4 -L HOME /dev/vg1/lv_home
continue

read -p "mkfs.ext4 -L STORAGE /dev/vg1/lv_storage"
mkfs.ext4 -L STORAGE /dev/vg1/lv_storage
continue

read -p "mount /dev/vg1/lv_root /mnt"
mount /dev/vg1/lv_root /mnt
continue

read -p "mkdir -p /mnt/boot /mnt/home /mnt/storage"
mkdir -p /mnt/boot /mnt/home /mnt/storage
continue

read -p "mount /dev/nvme0n1p1 /mnt/boot && mount /dev/vg1/lv_home /mnt/home && mount /dev/vg1/lv_storage /mnt/storage"
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/vg1/lv_home /mnt/home
mount /dev/vg1/lv_storage /mnt/storage
continue

read -p "pacman -Syy"
pacman -Syy
continue

read -p "pacstrap -i /mnt base base-devel linux linux-firmware linux-headers intel-ucode nano reflector lvm2 networkmanager"
pacstrap -i /mnt base base-devel linux linux-firmware linux-headers intel-ucode nano reflector lvm2 networkmanager
continue

read -p "genfstab -U -p /mnt >> /mnt/etc/fstab"
genfstab -U -p /mnt >> /mnt/etc/fstab
continue

read -p "nano /mnt/etc/fstab"
nano /mnt/etc/fstab
clear

read -p "arch-chroot /mnt /bin/bash"
cp install2.sh /mnt
arch-chroot /mnt /bin/bash -c "chmod +x install2.sh && ./install2.sh"

read -p "Finished. Press [Enter] to exit..."
rm /mnt/install2.sh
exit
