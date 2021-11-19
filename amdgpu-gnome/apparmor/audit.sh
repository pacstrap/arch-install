#!/bin/bash

confirm () { read -p "Proceed? (Enter) - (^C to abort)"; }

printf "\e[1;32m$ sudo groupadd -r audit\e[0m\n"; confirm;
sudo groupadd -r audit

printf "\e[1;32m$ sudo gpasswd -a skippy audit\e[0m\n"; confirm;
sudo gpasswd -a skippy audit

printf "\e[1;32m$ sudo nano /etc/audit/auditd.conf\e[0m\n"; confirm;
#echo "log_group = audit" | sudo tee -a /etc/audit/auditd.conf > /dev/null
sudo sed -i 's/log_group = root/log_group = audit/' /etc/audit/auditd.conf
sudo nano /etc/audit/auditd.conf

printf "\e[1;32m$ nano ~/.config/autostart/apparmor-notify.desktop\e[0m\n"; confirm;
cat > ~/.config/autostart/apparmor-notify.desktop <<EOF
[Desktop Entry]
Type=Application
Name=AppArmor Notify
Comment=Receive on screen notifications of AppArmor denials
TryExec=aa-notify
Exec=aa-notify -p -s 1 -w 60 -f /var/log/audit/audit.log
StartupNotify=false
NoDisplay=true
EOF
nano ~/.config/autostart/apparmor-notify.desktop

printf "\e[1;32m$ sudo nano /etc/apparmor/parser.conf\e[0m\n"; confirm;
sudo sed -i 's/#write-cache/write-cache/' /etc/apparmor/parser.conf
sudo nano /etc/apparmor/parser.conf 

printf "\e[1;32m$ exit\e[0m\n"; confirm;
exit
