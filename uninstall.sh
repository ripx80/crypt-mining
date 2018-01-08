#!/bin/bash
rm -r /usr/share/sm 
rm /etc/rc.local
systemctl stop rc-local
systemctl disable rc-local
systemctl disable rc-local-restart.timer
rm /etc/systemd/system/rc-local.service
rm /etc/systemd/system/rc-local-restart.service
rm /etc/systemd/system/rc-local-restart.timer
echo "uninstalled"
exit 0
