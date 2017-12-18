#!/bin/bash
mkdir -p /usr/share/sm/
cp -r miners sm.sh /usr/share/sm/
chmod +x /usr/share/sm/sm.sh
cd autostart/systemd
/bin/bash install.sh
echo "installed"
exit 0
