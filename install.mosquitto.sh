#!/bin/bash

project=~/funtech/mosquitto/
version=mosquitto-1.3.4
file=mosquitto-1.3.4.tar.gz
url=http://mosquitto.org/files/source/mosquitto-1.3.4.tar.gz

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

sudo cp service/monit/mosquitto.monit /etc/monit/conf.d/mosquitto || exit 40

popd

if [ ! -f /etc/init.d/mosquitto ]
then
    echo "Fixing: /etc/init.d/mosquitto"
    wget https://bitbucket.org/oojah/mosquitto-packaging/raw/1648d3dfd80b672abdc5d473d824620729cb4513/debian/mosquitto.init || exit 50
    sed -i 's/^DAEMON=.*/DAEMON=\/usr\/local\/sbin\/mosquitto/g' mosquitto.init || exit 51
    sudo cp mosquitto.init /etc/init.d/mosquitto || exit 52
    sudo chmod 755 /etc/init.d/mosquitto || exit 54
fi

if [ ! -f /etc/mosquitto/mosquitto.conf ]
then
    echo "Fixing: /etc/mosquitto/mosquitto.conf"
    sudo cp /etc/mosquitto/mosquitto.conf.example /etc/mosquitto/mosquitto.conf || exit 60
    sudo sed -i 's/#user .*/user '$USER'/g' /etc/mosquitto/mosquitto.conf  || exit 62
fi

echo "Done..."
exit 0
