#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ pacman -S alsa alsa-utils alsa-plugins alsa-firmware pulseaudio pavucontrol\e[0m\n"; confirm;
pacman -S alsa alsa-utils alsa-plugins alsa-firmware pulseaudio pavucontrol

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit
