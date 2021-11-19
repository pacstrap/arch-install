#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ pacman -S gtk-engine-murrine gtk-engines inkscape optipng qt5ct sassc\e[0m\n"; confirm;
pacman -S gtk-engine-murrine gtk-engines inkscape optipng qt5ct sassc

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit
