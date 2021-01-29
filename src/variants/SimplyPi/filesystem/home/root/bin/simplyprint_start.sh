#!/bin/sh

echo "SimplyPi setup service started"

echo "Checking if the OctoPrint plugin needs to be installed..."
FILE=/home/pi/SimplyPrint/SimplyPrint-OctoPrint-Plugin.zip
if test -f "$FILE"; then
  echo "OctoPrint plugin needs to be installed"
  /home/pi/oprint/bin/python2 -m pip --disable-pip-version-check install $FILE --no-cache-dir &&
    #service octoprint restart && # < hopefully all this happens BEFORE OctoPrint is started
    rm -f $FILE

  echo "Should have installed plugin"
fi

echo "SimplyPi setup service done"
