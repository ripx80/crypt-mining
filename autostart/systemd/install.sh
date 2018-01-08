#!/bin/bash
cp rc.local /etc/
cp rc-local.service /etc/systemd/system/
cp rc-local-restart.timer /etc/systemd/system/
cp rc-local-restart.service /etc/systemd/system/
chmod +x /etc/rc.local
systemctl enable --now rc-local-restart.timer
systemctl enable rc-local
systemctl start rc-local.service
#systemctl status rc-local.service
exit 0
