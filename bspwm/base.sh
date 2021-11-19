#!/usr/bin/sh

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ pvcreate --dataalignment 1m /dev/nvme0n1p3\e[0m\n"; confirm;
pvcreate --dataalignment 1m /dev/nvme0n1p3

printf "\e[1;32m$ vgcreate vg1 /dev/nvme0n1p3\e[0m\n"; confirm;
vgcreate vg1 /dev/nvme0n1p3

printf "\e[1;32m$ lvcreate -L 64G vg1 -n lv_root\e[0m\n"; confirm;
lvcreate -L 64G vg1 -n lv_root

printf "\e[1;32m$ lvcreate -L 64G vg1 -n lv_home\e[0m\n"; confirm;
lvcreate -L 64G vg1 -n lv_home

printf "\e[1;32m$ lvcreate -L 256G vg1 -n lv_storage\e[0m\n"; confirm;
lvcreate -L 256G vg1 -n lv_storage

#printf "\e[1;32m$ lvcreate -l 100%FREE vg1 -n lv_storage\e[0m\n"; confirm;
#lvcreate -l 100%FREE vg1 -n lv_storage

printf "\e[1;32m$ modprobe dm_mod\e[0m\n"; confirm;
modprobe dm_mod

printf "\e[1;32m$ vgscan\e[0m\n"; confirm;
vgscan

printf "\e[1;32m$ vgchange -ay\e[0m\n"; confirm;
vgchange -ay

printf "\e[1;32m$ mkfs.fat -F32 -n BOOT /dev/nvme0n1p1\e[0m\n"; confirm;
mkfs.fat -F32 -n BOOT /dev/nvme0n1p1

printf "\e[1;32m$ mkswap -L SWAP /dev/nvme0n1p2\e[0m\n"; confirm;
mkswap -L SWAP /dev/nvme0n1p2

printf "\e[1;32m$ swapon /dev/nvme0n1p2\e[0m\n"; confirm;
swapon /dev/nvme0n1p2

printf "\e[1;32m$ mkfs.ext4 -L ROOT /dev/vg1/lv_root\e[0m\n"; confirm;
mkfs.ext4 -L ROOT /dev/vg1/lv_root

printf "\e[1;32m$ mkfs.ext4 -L HOME /dev/vg1/lv_home\e[0m\n"; confirm;
mkfs.ext4 -L HOME /dev/vg1/lv_home

printf "\e[1;32m$ mkfs.ext4 -L STORAGE /dev/vg1/lv_storage\e[0m\n"; confirm;
mkfs.ext4 -L STORAGE /dev/vg1/lv_storage

printf "\e[1;32m$ mount /dev/vg1/lv_root /mnt\e[0m\n"; confirm;
mount /dev/vg1/lv_root /mnt

printf "\e[1;32m$ mkdir -p {/mnt/boot,/mnt/home,/mnt/storage}\e[0m\n"; confirm;
mkdir -p {/mnt/boot,/mnt/home,/mnt/storage}

printf "\e[1;32m$ mount /dev/nvme0n1p1 /mnt/boot && mount /dev/vg1/lv_home /mnt/home && mount /dev/vg1/lv_storage /mnt/storage\e[0m\n"; confirm;
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/vg1/lv_home /mnt/home
mount /dev/vg1/lv_storage /mnt/storage

printf "\e[1;32m$ pacman -Syy\e[0m\n"; confirm;
pacman -Syy

printf "\e[1;32m$ pacstrap -i /mnt base base-devel linux linux-firmware linux-headers amd-ucode nano reflector rsync lvm2 networkmanager\e[0m\n"; confirm;
pacstrap -i /mnt base base-devel linux linux-firmware linux-headers amd-ucode nano reflector rsync lvm2 networkmanager

printf "\e[1;32m$ genfstab -U -p /mnt >> /mnt/etc/fstab\e[0m\n"; confirm;
genfstab -U -p /mnt >> /mnt/etc/fstab

printf "\e[1;32m$ nano /mnt/etc/fstab\e[0m\n"; confirm;
nano /mnt/etc/fstab

printf "\e[1;32m$ arch-chroot /mnt /bin/bash\e[0m\n"; confirm;
cp bspwm.sh /mnt
arch-chroot /mnt /bin/bash -c "chmod +x bspwm.sh && ./bspwm.sh"

rm /mnt/bspwm.sh
printf "\e[1;32mDone. Now you can exit, umount -a, reboot...\e[0m\n"
exit
