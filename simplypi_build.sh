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
wget -c --trust-server-names 'https://downloads.raspberrypi.org/raspios_lite_armhf_latest'
cd $THEPATH/src
../../CustomPiOS/src/update-custompios-paths
sudo modprobe loop

printf "Starting build!"
sudo bash -x ./build_dist SimplyPi
