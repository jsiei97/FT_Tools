#!/bin/bash

# Raspian Arduino

apt-get -y update  || exit 10
apt-get -y upgrade || exit 11

apt-get -y install \
    arduino-core arduino \
    || exit 20

usermod -aG dialout $USER
usermod -aG plugdev $USER

# Add /opt/arduino/current
mkdir -p /opt/arduino
if [ -h /opt/arduino/current ]
then
    rm /opt/arduino/current || exit 32
fi
ln -s /usr/share/arduino/ /opt/arduino/current || exit 34

echo "Done..."
exit 0
