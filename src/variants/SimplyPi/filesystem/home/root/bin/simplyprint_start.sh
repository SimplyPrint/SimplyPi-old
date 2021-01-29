#!/bin/sh

echo "SimplyPi setup service started"

echo "Checking if the OctoPrint plugin needs to be installed..."
FILE=/home/pi/SimplyPrint-OctoPrint-Plugin.zip
if test -f "$FILE"; then
  echo "OctoPrint plugin needs to be installed"

  wget -q --spider https://github.com/SimplyPrint/OctoPrint-SimplyPrint/archive/master.zip
  if [ $? -eq 0 ]; then
    # Get newest version from GitHub
    echo "Online; install plugin from GitHub"
    sudo -u pi /home/pi/oprint/bin/pip --disable-pip-version-check install https://github.com/SimplyPrint/OctoPrint-SimplyPrint/archive/master.zip --no-cache-dir &&
      rm -f $FILE
  else
    # Offline, just install local
    echo "Offline; install from local zip"
    sudo -u pi /home/pi/oprint/bin/pip --disable-pip-version-check install $FILE --no-cache-dir &&
      rm -f $FILE
  fi

  echo "Should have installed plugin"
fi

echo "SimplyPi setup service done"
