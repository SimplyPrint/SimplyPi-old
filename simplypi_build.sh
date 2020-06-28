#!/usr/bin/env bash

yes | sudo apt-get install gawk util-linux qemu-user-static git p7zip-full python3
git pull
cd ../
git clone https://github.com/guysoft/CustomPiOS.git
cd SimplyPi

cd src/variants/SimplyPi/filesystem/home/pi

rm -rf SimplyPrint
mkdir SimplyPrint &&
sudo chmod -R 757 SimplyPrint &&
cd SimplyPrint &&
curl -sS https://simplyprint.dk/software/SimplyPrint-files.zip > updated_file.zip &&
unzip updated_file.zip &&
sudo rm -rf updated_file.zip &&
sudo chmod -R 757 ../SimplyPrint

cd /home/pi/SimplyPi/src
../../CustomPiOS/src/update-custompios-paths
sudo modprobe loop

sudo bash -x ./build_dist SimplyPi
