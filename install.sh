#!/bin/bash
## By Hebert F. Barros 2020
## Removing any apt ## crashes
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt-get update

# Install some required libraries
sudo apt-get install php build-essential php-pear libaio1 alien

# Download the oracle-instantclient-basic.
echo 'Downloading the oracle-instantclient-basic.'
wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-basic-linuxx64.rpm

# Converting package .rpm to .deb.
echo 'Converting package .rpm to .deb.'

sudo alien oracle-instantclient-basic-linuxx64.rpm && sleep 170

# Installing oracle-instantclient-basic.deb.
echo 'Installing oracle-instantclient-basic_21.1.0.0.0-2_amd64.deb.'
sudo dpkg -i oracle-instantclient-basic_21.1.0.0.0-2_amd64.deb

# Removing packages.
echo 'Removing packages.'
rm -rf oracle-instantclient-basic-linuxx64.rpm oracle-instantclient-basic_21.1.0.0.0-2_amd64.deb
