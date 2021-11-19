#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ pacman -S apparmor audit python-notify2 python-psutil\e[0m\n"; confirm;
pacman -S apparmor audit python-notify2 python-psutil

printf "\e[1;32m$ nano /boot/loader/entries/linux.conf\e[0m\n"; confirm;
echo "lsm=landlock,lockdown,yama,apparmor,bpf audit=1" | tee -a /boot/loader/entries/linux.conf > /dev/null 
nano /boot/loader/entries/linux.conf

printf "\e[1;32m$ nano /boot/loader/entries/linux-fallback.conf\e[0m\n"; confirm;
echo "lsm=landlock,lockdown,yama,apparmor,bpf audit=1" | tee -a /boot/loader/entries/linux-fallback.conf > /dev/null
nano /boot/loader/entries/linux-fallback.conf

printf "\e[1;32m$ systemctl enable apparmor.service\e[0m\n"; confirm;
systemctl enable apparmor.service

printf "\e[1;32m$ systemctl enable auditd.service\e[0m\n"; confirm;
systemctl enable auditd.service

printf "\e[1;32m$ exit...then reboot\e[0m\n"; confirm;
exit
