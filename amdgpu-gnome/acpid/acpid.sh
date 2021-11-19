#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ pacman -S acpi acpi_call acpid\e[0m\n"; confirm;
pacman -S acpi acpi_call acpid

printf "\e[1;32m$ systemctl enable --now acpid.service\e[0m\n"; confirm;
systemctl enable --now acpid.service

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit
