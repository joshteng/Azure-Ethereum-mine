#!/bin/bash
# Ethereum miner for Microsoft Azure
# Script by Ben Thompson
echo -e "\e[31;43m***** Installing Drivers and Prerequisites *****\e[0m"
sudo apt-get update
sudo apt-get install software-properties-common gcc make
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install build-essential ubuntu-desktop -y
sudo touch /etc/modprobe.d/nouveau.conf
sudo chmod 775 /etc/modprobe.d/nouveau.conf
sudo echo $'blacklist nouveau\nblacklist lbm-nouveau' > /etc/modprobe.d/nouveau.conf
sudo reboot
