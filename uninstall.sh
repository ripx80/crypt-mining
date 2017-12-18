#!/bin/bash
rm -r /usr/share/sm 
rm /etc/rc.local
systemctl stop rc-local
systemctl disable rc-local
rm /etc/systemd/system/rc-local.service
echo "uninstalled"
exit 0
