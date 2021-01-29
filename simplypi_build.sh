#!/usr/bin/env bash

THEPATH=$PWD

yes | sudo apt-get install gawk util-linux qemu-user-static git p7zip-full python3
sudo -u $SUDO_USER git pull
cd ../

CUSTOMPIOS_CHECK=CustomPiOS

if [ -d "$CUSTOMPIOS_CHECK" ]; then
  printf "Pulling for latest CustomPiOS"
  cd $CUSTOMPIOS_CHECK
  sudo -u $SUDO_USER git pull
  printf "Pulled"
else
  printf "Cloning CustomPiOS..."
  sudo -u $SUDO_USER git clone https://github.com/guysoft/CustomPiOS.git
  printf "Cloned"
fi

cd $THEPATH/src/image
# Check if we should download the new RaspiOS file
DWNLDURL="https://downloads.raspberrypi.org/raspios_lite_armhf_latest"
NEWPIOS=$(curl -s -v -X HEAD $DWNLDURL 2>&1 | grep 'location:')
NEWPIOS="${NEWPIOS##*/}"

echo
echo "----- image download -----"
echo
echo "RaspiOS name; $NEWPIOS"
echo

if test -f "$NEWPIOS"; then
  echo "Latest RaspiOS file not fond - downloading newest..."
  find . -name "*.zip" -type f -delete
  wget -c --trust-server-names "$DWNLDURL"
else
  echo "Got latest RaspiOS file - no need to download anew"
fi

echo
echo "/----- image download -----\\"
echo

cd $THEPATH/src
../../CustomPiOS/src/update-custompios-paths
sudo modprobe loop

printf "Starting build!"
sudo bash -x ./build_dist SimplyPi
