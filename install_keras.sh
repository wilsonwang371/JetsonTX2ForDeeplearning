#!/usr/bin/env bash
set -e
set -x
echo "Install dependencies"
sudo apt-get -y install libhdf5-serial-dev hdf5-tools
# for python3
sudo -H pip3 install keras
# for python2
sudo -H pip2 install keras
