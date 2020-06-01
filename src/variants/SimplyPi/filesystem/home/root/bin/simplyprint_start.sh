#!/bin/sh

python3 /home/pi/SimplyPrint/crontab_manager.py -s > /dev/null 2>&1

search=octopi
if grep -q $search "/etc/hostname"; then
  replace="SimplyPrint-$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1)"
  sed -i "s/${search}/${replace}/g" /etc/hostname
  sed -i "s/${search}/${replace}/g" /etc/hosts
  reboot
fi
