#!/bin/bash

#Installation dir
dest=/opt/arduino

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    # 64-bit stuff here
    url='http://arduino.cc/download.php?f=/arduino-1.6.13-linux64.tar.xz'
else
    # 32-bit stuff here
    url='http://arduino.cc/download.php?f=/arduino-1.6.13-linux32.tar.xz'
fi

# todo add for arm
# uname -m -> armv6l
# url='http://arduino.cc/download.php?f=/arduino-1.6.13-linuxarm.tar.xz

name=$(basename $url)

if [ ! -d "$dest" ]
then
    sudo mkdir -p $dest    || exit 10
    sudo chown $USER $dest || exit 11
fi

cd $dest || exit 20

if [ ! -f "$name" ]
then
    echo "Download file $name"
    echo $url -O $name
    wget $url -O $name || exit 21
fi

tar -xJf $name || exit 30

shortname=$(echo $name | sed 's/-linux.*//')
target="$PWD/$shortname/arduino"

# Add /opt/arduino/current/
if [ -h current ]
then
    rm current
fi
ln -s $shortname current || exit 36

# Add ~/bin/arduino
if [ -f "$target" ]
then
    echo ok
    mkdir -p ~/bin/
    cd ~/bin || exit 40

    if [ -f arduino ]
    then
        rm arduino
    fi
    ln -s $target arduino || exit 41
fi


sudo usermod -aG dialout $USER
sudo usermod -aG plugdev $USER

ufile="/etc/udev/rules.d/80-avrisp.rules"
if [ ! -f $ufile ]
then
sudo bash <<EOF
echo 'ATTRS{idProduct}=="2104", ATTRS{idVendor}=="03eb", MODE="666", GROUP="plugdev"' >> $ufile
echo 'ATTRS{idProduct}=="0043", ATTRS{idVendor}=="2341", MODE="666", GROUP="plugdev"' >> $ufile
EOF
fi


echo "Done...."
exit 0
