#!/bin/bash


sudo apt-get update
sudo apt-get install dchroot debootstrap
sudo mkdir /JAIL/

sudo chmod 777 /etc/schroot/schroot.conf
sudo cat schroot.conf >> /etc/schroot/schroot.conf

sudo debootstrap --variant=buildd --arch amd64 xenial /JAIL/ http://mirror.math.princeton.edu/pub/ubuntu/
sudo mount proc /JAIL/proc -t proc
ls /JAIL

sudo cp setup-chroot.sh /JAIL
sudo cat /JAIL/setup-chroot.sh
sudo chmod +x /JAIL/setup-chroot.sh
sudo chroot /JAIL ./setup-chroot.sh

sudo mount proc /JAIL/proc -t proc
sudo mkdir /JAIL/home/runs