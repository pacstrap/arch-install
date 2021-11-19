#!/usr/bin/sh

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; } 

printf "\e[1;32m$ pacman -S zsh zsh-completions\e[0m\n"; confirm;
pacman -S zsh zsh-completions

printf "\e[1;32m$ pacman -S terminus-font\e[0m\n"; confirm;
pacman -S terminus-font

printf "\e[1;32m$ pacman -S asp bat cmatrix dnsmasq dnsutils htop inetutils mlocate neofetch tk tmux tree vim\e[0m\n"; confirm;
pacman -S asp bat cmatrix dnsmasq dnsutils htop inetutils mlocate neofetch tk tmux tree vim

# other packages
printf "\e[1;32m$ pacman -S bash-completion cmake gcc-fortran packagekit pacman-contrib\e[0m\n"; confirm;
pacman -S bash-completion cmake gcc-fortran packagekit pacman-contrib

# powerline
# pacman -S powerline powerline-fonts 

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit
