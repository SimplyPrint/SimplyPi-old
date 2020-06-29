#!/usr/bin/env bash

yes | sudo apt-get install gawk util-linux qemu-user-static git p7zip-full python3
sudo -u $SUDO_USER git pull
cd ../

CUSTOMPIOS_CHECK=CustomPiOS

if [ -d "$CUSTOMPIOS_CHECK" ]; then
  printf "Pulling for latest CustomPiOS"
  cd $CUSTOMPIOS_CHECK
  sudo -u $SUDO_USER git pull
  cd ../
  printf "Pulled"
else
  printf "Cloning CustomPiOS..."
  sudo -u $SUDO_USER git clone https://github.com/guysoft/CustomPiOS.git
  printf "Cloned"
fi

cd SimplyPi/src/image
wget -c --trust-server-names 'https://downloads.raspberrypi.org/raspios_lite_armhf_latest'
cd ../variants/SimplyPi/filesystem/home/pi

rm -rf SimplyPrint
mkdir SimplyPrint &&
  sudo chmod -R 757 SimplyPrint &&
  cd SimplyPrint &&
  curl -sS https://simplyprint.dk/software/SimplyPrint-files.zip >updated_file.zip &&
  unzip updated_file.zip &&
  sudo rm -rf updated_file.zip &&
  sudo chmod -R 757 ../SimplyPrint

cd ../../../../../src
../../CustomPiOS/src/update-custompios-paths
sudo modprobe loop

sudo bash -x ./build_dist SimplyPi
