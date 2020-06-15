#!/bin/sh

echo "SimplyPi setup service started"
# python3 /home/pi/SimplyPrint/crontab_manager.py -s > /dev/null 2>&1
python3 /home/pi/SimplyPrint/crontab_manager.py -s

search=octopi
if grep -q $search "/etc/hostname"; then
        echo "Hostname is 'octopi' - gonna change it"
        replace="SimplyPi-$(openssl rand -hex 2)"

        sed -i "s/${search}/${replace}/g" /etc/hostname
        sed -i "s/${search}/${replace}/g" /etc/hosts

        echo "Hostname changed. Rebooting."
        reboot
fi

echo "SimplyPi setup service done"
