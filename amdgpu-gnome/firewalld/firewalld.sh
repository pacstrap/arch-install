#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ pacman -S firewalld python-pyqt5 python-pyqt5-sip\e[0m\n"; confirm;
pacman -S firewalld python-pyqt5 python-pyqt5-sip

printf "\e[1;32m$ systemctl enable --now firewalld.service\e[0m\n"; confirm;
systemctl enable --now firewalld.service

printf "\e[1;32m$ firewall-cmd --set-default-zone=home\e[0m\n"; confirm;
firewall-cmd --set-default-zone=home

printf "\e[1;32m$ firewall-cmd --add-port=1025-65535/tcp --permanent\e[0m\n"; confirm;
firewall-cmd --add-port=1025-65535/tcp --permanent

printf "\e[1;32m$ firewall-cmd --add-port=1025-65535/udp --permanent\e[0m\n"; confirm;
firewall-cmd --add-port=1025-65535/udp --permanent

printf "\e[1;32m$ firewall-cmd --reload\e[0m\n"; confirm;
firewall-cmd --reload

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit
