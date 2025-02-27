SimplyPi - old repository! Find the latest version based on CustoPiZer here; https://github.com/SimplyPrint/SimplyPi
======

.. image:: https://raw.githubusercontent.com/guysoft/OctoPi/devel/media/OctoPi.png
.. :scale: 50 %
.. :alt: OctoPi logo

A `Raspberry Pi <http://www.raspberrypi.org/>`_ distribution for 3D printers. It includes the `SimplyPrint <https://simplyprint.io/>`_ system and `OctoPrint <http://octoprint.org>`_ host software.

This repository contains the source script to generate the distribution out of an existing `Raspbian <http://www.raspbian.org/>`_ distro image.

**DIRECT DOWNLOAD;** https://download.simplyprint.io/SimplyPi.img

Download the latest stable build via this button:

.. image:: https://i.imgur.com/NvUOGfS.png
   :target: https://octopi.octoprint.org/latest

Official mirror is `here <https://github.com/guysoft/OctoPi/releases>`_

Nightly builds are available `here <http://unofficialpi.org/Distros/OctoPi/nightly/>`_

64bit Nightly builds are available `here <http://unofficialpi.org/Distros/OctoPi/nightly-arm64/>`_

We recently had to move to building location, donations for somewhere with HTTPS would be great.

How to use it?
--------------

#. Unzip the image and install it to an sd card `like any other Raspberry Pi image <https://www.raspberrypi.org/documentation/installation/installing-images/README.md>`_
#. Configure your WiFi by editing ``octopi-wpa-supplicant.txt`` on the root of the flashed card when using it like a thumb drive
#. Boot the Pi from the card
#. Log into your Pi via SSH (it is located at ``octopi.local`` `if your computer supports bonjour <https://learn.adafruit.com/bonjour-zeroconf-networking-for-windows-and-linux/overview>`_ or the IP address assigned by your router), default username is "pi", default password is "raspberry". Run ``sudo raspi-config``. Once that is open:

   a. Change the password via "Change User Password"
   b. Optionally: Change the configured timezone via "Localization Options" > "Timezone".
   c. Optionally: Change the hostname via "Network Options" > "Hostname". Your OctoPi instance will then no longer be reachable under ``octopi.local`` but rather the hostname you chose postfixed with ``.local``, so keep that in mind.
  
   You can navigate in the menus using the arrow keys and Enter. To switch to selecting the buttons at the bottom use Tab.
   
   You do not need to expand the filesystem, current versions of OctoPi do this automatically.

OctoPrint is located at `http://octopi.local <http://octopi.local>`_ and also at `https://octopi.local <https://octopi.local>`_. Since the SSL certificate is self signed (and generated upon first boot), you will get a certificate warning at the latter location, please ignore it.

To install plugins from the commandline instead of OctoPrint's built-in plugin manager, :code:`pip` may be found at :code:`/home/pi/oprint/bin/pip`.  Thus, an example install cmd may be:  :code:`/home/pi/oprint/bin/pip install <plugin-uri>`

If a USB webcam or the Raspberry Pi camera is detected, MJPG-streamer will be started automatically as webcam server. OctoPrint on OctoPi ships with correctly configured stream and snapshot URLs pointing at it. If necessary, you can reach it under `http://octopi.local/webcam/?action=stream <http://octopi.local/webcam/?action=stream>`_ and SSL respectively, or directly on its configured port 8080: `http://octopi.local:8080/?action=stream <octopi.local:8080/?action=stream>`_.

Features
--------

* `SimplyPrint <https://simplyprint.io>`_ system
* `OctoPrint <http://octoprint.org>`_ host software for 3D printers out of the box
* `Raspbian <http://www.raspbian.org/>`_ tweaked for maximum performance for printing out of the box
* `mjpg-streamer with RaspiCam support <https://github.com/jacksonliam/mjpg-streamer>`_ for live viewing of prints and timelapse video creation.

Developing
----------

Requirements
~~~~~~~~~~~~

#. `qemu-arm-static <http://packages.debian.org/sid/qemu-user-static>`_
#. `CustomPiOS <https://github.com/guysoft/CustomPiOS>`_
#. Downloaded `Raspbian <http://www.raspbian.org/>`_ image.
#. root privileges for chroot
#. Bash
#. git
#. sudo (the script itself calls it, running as root without sudo won't work)

Build SimplyPi From within SimplyPi / Raspbian / Debian / Ubuntu
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SimplyPi can be built from Debian, Ubuntu, Raspbian, or even SimplyPi.
Build requires about 2.5 GB of free space available.
You can build it by issuing the following commands::

    sudo apt-get install gawk util-linux qemu-user-static git p7zip-full python3
    
    git clone https://github.com/guysoft/CustomPiOS.git
    git clone https://github.com/guysoft/OctoPi.git
    cd OctoPi/src/image
    wget -c --trust-server-names 'https://downloads.raspberrypi.org/raspios_lite_armhf_latest'
    cd ..
    ../../CustomPiOS/src/update-custompios-paths
    sudo modprobe loop
    sudo bash -x ./build_dist
    
    sudo apt-get install gawk util-linux qemu-user-static git p7zip-full python3
    
    git clone https://github.com/SimplyPrint/SimplyPi.git
    cd SimplyPi/
    sudo bash simplypi_build.sh
    

Usage
~~~~~

#. If needed, override existing config settings by creating a new file ``src/config.local``. You can override all settings found in ``src/modules/octopi/config``. If you need to override the path to the Raspbian image to use for building SimplyPi, override the path to be used in ``ZIP_IMG``. By default the most recent file matching ``*-raspbian.zip`` found in ``src/image`` will be used.
#. Run ``src/build_dist`` as root.
#. The final image will be created at the ``src/workspace``

Code contribution would be appreciated!
