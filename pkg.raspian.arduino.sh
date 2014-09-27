#!/bin/bash

# Raspian Arduino

apt-get -y update  || exit 10
apt-get -y upgrade || exit 11

apt-get -y install \
    arduino-core arduino \
    || exit 20

usermod -aG dialout $USER
usermod -aG plugdev $USER

echo "Done..."
exit 0
