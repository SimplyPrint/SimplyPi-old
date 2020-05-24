#!/usr/bin/env bash
cd src/variants/SimplyPi/filesystem/home/pi

rm -rf SimplyPrint
mkdir SimplyPrint &&
sudo chmod -R 757 SimplyPrint &&
cd SimplyPrint &&
curl -sS https://simplyprint.dk/software/SimplyPrint-files.zip > updated_file.zip &&
unzip updated_file.zip &&
sudo rm -rf updated_file.zip &&
sudo chmod -R 757 ../SimplyPrint

cd /home/pi/SimplyPi
../../CustomPiOS/src/update-custompios-paths
sudo modprobe loop

sudo bash -x ./build_dist SimplyPi
