#!/bin/bash

project=~/funtech/mosquitto/
version=mosquitto-1.3.1
file=mosquitto-1.3.1.tar.gz
url=http://mosquitto.org/files/source/mosquitto-1.3.1.tar.gz

mkdir -p $project/
pushd $project || exit 10

if [ -d $version ]
then
    echo "This version is ok: $project/$version"
    exit 0
fi

if [ ! -f $file ]
then
    wget $url || exit 20
fi

tar xvzf $file || exit 21
pushd $version || exit 22


# fatal error: openssl/ssl.h: No such file or directory
# sudo apt-get install libssl-dev

# fatal error: ares.h: No such file or directory
# sudo apt-get install libc-ares-dev

make ||  exit 30
sudo make install || exit 31

echo "Done..."
exit 0
