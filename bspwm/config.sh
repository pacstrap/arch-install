#!/usr/bin/sh

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ mkdir -p {~/.config/bspwm,~/.config/sxhkd}\e[0m\n"; confirm;
mkdir -p {~/.config/bspwm,~/.config/sxhkd}

printf "\e[1;32m$ install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc\e[0m\n"; confirm;
install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc

printf "\e[1;32m$ install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc\e[0m\n"; confirm;
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

printf "\e[1;32m$ nano ~/.config/bspwm/bspwmrc\e[0m\n"; confirm;
cat > ~/.config/bspwm/bspwmrc <<EOF
#! /bin/sh

pgrep -x sxhkd > /dev/null || sxhkd &

bspc monitor -d I II III IV V VI VII VIII IX X

setxkbmap au &
numlockx &
xsetroot -cursor_name left_ptr &
light-locker &
xrandr --output eDP --mode 1920x1080 &
picom --no-fading-openclose &
nitrogen --restore &
bash /home/skippy/.config/polybar/launch.sh &
nm-applet &
xfce4-power-manager &
/usr/bin/dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

bspc config border_width         2
bspc config window_gap          12

bspc config split_ratio          0.52
bspc config borderless_monocle   true
bspc config gapless_monocle      true

bspc config normal_border_color "#44475a"
bspc config active_border_color "#bd93f9"
bspc config focused_border_color "#ff79c6"
bspc config presel_feedback_color "#6272a4"

bspc rule -a Arandr state=floating rectangle=960x540+480+270
bspc rule -a Insync state=floating rectangle=960x540+480+270
bspc rule -a Lxappearance state=floating rectangle=960x540+480+270
bspc rule -a Nitrogen state=floating rectangle=960x540+480+270
bspc rule -a Pavucontrol state=floating rectangle=960x540+480+270
bspc rule -a Xfce4-power-manager-settings state=floating rectangle=960x540+480+270

EOF
nano ~/.config/bspwm/bspwmrc 

printf "\e[1;32m$ nano ~/.config/sxhkd/sxhkdrc\e[0m\n"; confirm;
cat > ~/.config/sxhkd/sxhkdrc <<EOF
#
# wm independent hotkeys
#

# make sxhkd reload its configuration files:
super + Escape
	pkill -USR1 -x sxhkd

#
# bspwm hotkeys
#

# quit/restart bspwm
super + alt + {q,r}
	bspc {quit,wm -r}

# close and kill
super + {_,shift + }w
	bspc node -{c,k}

# alternate between the tiled and monocle layout
super + m
	bspc desktop -l next

# send the newest marked node to the newest preselected node
super + y
	bspc node newest.marked.local -n newest.!automatic.local

# swap the current node and the biggest window
super + g
	bspc node -s biggest.window

#
# state/flags
#

# set the window state
super + {t,shift + t,s,f}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# set the node flags
super + ctrl + {m,x,y,z}
	bspc node -g {marked,locked,sticky,private}

#
# focus/swap
#

# focus the node in the given direction
super + {_,shift + }{h,j,k,l}
	bspc node -{f,s} {west,south,north,east}

# focus the node for the given path jump
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# focus the next/previous window in the current desktop
super + {_,shift + }c
	bspc node -f {next,prev}.local.!hidden.window

# focus the next/previous desktop in the current monitor
super + bracket{left,right}
	bspc desktop -f {prev,next}.local

# focus the last node/desktop
super + {grave,Tab}
	bspc {node,desktop} -f last

# focus the older or newer node in the focus history
super + {o,i}
	bspc wm -h off; \
	bspc node {older,newer} -f; \
	bspc wm -h on

# focus or send to the given desktop
super + {_,shift + }{1-9,0}
	bspc {desktop -f,node -d} '^{1-9,10}'

#
# preselect
#

# preselect the direction
super + ctrl + {h,j,k,l}
	bspc node -p {west,south,north,east}

# preselect the ratio
super + ctrl + {1-9}
	bspc node -o 0.{1-9}

# cancel the preselection for the focused node
super + ctrl + space
	bspc node -p cancel

# cancel the preselection for the focused desktop
super + ctrl + shift + space
	bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

#
# move/resize
#

# expand a window by moving one of its side outward
super + alt + {h,j,k,l}
	bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}

# contract a window by moving one of its side inward
super + alt + shift + {h,j,k,l}
	bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}

# move a floating window
super + {Left,Down,Up,Right}
	bspc node -v {-20 0,0 20,0 -20,20 0}

#
# custom bindings
#

# terminal emulator
super + Return
	alacritty 

# program launcher
super + @space
	dmenu_run -h 24 -nf '#ebeef3' -nb '#1e1f29' -sb '#6d5890' -sf '#ebeef3' -fn 'monospace-10' -p ''

# password manager
super + F1
	/opt/enpass/Enpass

# web browser
super + F2	
	/usr/bin/chromium

# file manager
super + F3
	thunar

# email client
super + F4
	/opt/ramboxpro/ramboxpro --no-sandbox

# text editor
super + F5
	subl

# launch xkill
super + F12
	xkill

# poweroff
ctrl + alt + Delete
	systemctl poweroff

# reboot
ctrl + alt + r
	systemctl reboot

EOF
nano ~/.config/sxhkd/sxhkdrc

printf "\e[1;32m$ exit\e[0m\n"
exit
