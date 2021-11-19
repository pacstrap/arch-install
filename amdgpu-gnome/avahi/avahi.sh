#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ pacman -S avahi nss-mdns\e[0m\n"; confirm;
pacman -S avahi nss-mdns

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
nano /etc/nsswitch.conf

printf "\e[1;32m$ systemctl disable --now systemd-resolved.service\e[0m\n"; confirm;
systemctl disable --now systemd-resolved.service

printf "\e[1;32m$ systemctl enable --now avahi-daemon.service\e[0m\n"; confirm;
systemctl enable --now avahi-daemon.service

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit
