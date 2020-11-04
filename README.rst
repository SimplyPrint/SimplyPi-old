SimplyPi
======

.. image:: https://raw.githubusercontent.com/guysoft/OctoPi/devel/media/OctoPi.png
.. :scale: 50 %
.. :alt: OctoPi logo

A `Raspberry Pi <http://www.raspberrypi.org/>`_ distribution for 3D printers. It includes the `SimplyPrint <https://simplyprint.io/>`_ system and `OctoPrint <http://octoprint.org>`_ host software.

This repository contains the source script to generate the distribution out of an existing `Raspbian <http://www.raspbian.org/>`_ distro image.

**DIRECT DOWNLOAD;** https://download.simplyprint.io/SimplyPi.img


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

    sudo apt-get update
    sudo apt-get upgrade
    
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
