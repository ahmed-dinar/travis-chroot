#!/bin/bash

# install debootstrap
sudo apt-get update
sudo apt-get install dchroot debootstrap
sudo mkdir /JAIL/

# setup schroot config
sudo chmod 777 /etc/schroot/schroot.conf
sudo cat schroot.conf >> /etc/schroot/schroot.conf

# install chroot
sudo debootstrap --variant=buildd --arch amd64 xenial /JAIL/ http://mirror.math.princeton.edu/pub/ubuntu/

# mount proc to chroot
sudo mount proc /JAIL/proc -t proc
ls /JAIL

# setup chroot, check gcc, insall java, check java
sudo cp setup-chroot.sh /JAIL
sudo cat /JAIL/setup-chroot.sh
sudo chmod +x /JAIL/setup-chroot.sh
sudo chroot /JAIL ./setup-chroot.sh

# make programm run directory inside chroot
sudo mkdir /JAIL/home/runs
ls /JAIL/home/runs