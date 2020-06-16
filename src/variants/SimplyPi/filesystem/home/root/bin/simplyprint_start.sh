#!/bin/sh

echo "SimplyPi setup service started"
# python3 /home/pi/SimplyPrint/crontab_manager.py -s > /dev/null 2>&1
python3 /home/pi/SimplyPrint/crontab_manager.py -s

echo "Checking if the OctoPrint plugin needs to be installed..."
FILE=/home/pi/SimplyPrint/SimplyPrint-OctoPrint-Plugin.zip
if test -f "$FILE"; then
  echo "OctoPrint plugin needs to be installed"
  /home/pi/oprint/bin/python2 -m pip --disable-pip-version-check install $FILE --no-cache-dir &&
  service octoprint restart &&
  rm -f $FILE

  echo "Should have installed plugin and restarted the OctoPrint service (and cleaned up)"
fi

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
