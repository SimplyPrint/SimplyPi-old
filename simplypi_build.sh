cd src/variants/SimplyPi/filesystem/home/pi

rm -rf SimplyPrint
mkdir SimplyPrint &&
sudo chmod -R 757 SimplyPrint &&
cd SimplyPrint &&
curl -sS https://simplyprint.dk/software/SimplyPrint-files.zip > updated_file.zip &&
unzip updated_file.zip &&
sudo rm -rf updated_file.zip &&
sudo chmod -R 757 ../SimplyPrint &&
sudo /home/pi/oprint/bin/python2 -m pip --disable-pip-version-check install SimplyPrint-OctoPrint-Plugin.zip --no-cache-dir && \\
sudo rm -rf SimplyPrint-OctoPrint-Plugin.zip
