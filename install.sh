#!/bin/bash
pacman -S git --no-confirm
#check inet connection with nc
echo -e "GET http://google.com HTTP/1.0\n\n" | nc google.com 80 > /dev/null 2>&1
if [ $? -eq 0 ]; then
    git clone https://github.com/ripx80/crypt-mining/ /usr/share/sm
else
    mkdir -p /usr/share/sm
    cp -r miners sm.sh .git /usr/share/sm/
fi

chmod +x /usr/share/sm/sm.sh
cd autostart/systemd
/bin/bash install.sh
echo "installed"
exit 0
