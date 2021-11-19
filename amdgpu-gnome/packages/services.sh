#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

# install packages
printf "\e[1;32m$ pacman -S acpi acpi_call acpid avahi nss-mdns cups firewalld iptables-nft ipset networkmanager openssh tlp ethtool\e[0m\n"; confirm;
pacman -S acpi acpi_call acpid avahi nss-mdns cups firewalld iptables-nft ipset networkmanager openssh tlp ethtool 

# configure services
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

printf "\e[1;32m$ systemctl enable sshd.service\e[0m\n"; confirm;
systemctl enable sshd.service

printf "\e[1;32m$ systemctl enable tlp.service\e[0m\n"; confirm;
systemctl enable tlp.service

# set default firewall zone
printf "\e[1;32m$ firewall-cmd --set-default-zone=home\e[0m\n"; confirm;
firewall-cmd --set-default-zone=home

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit
