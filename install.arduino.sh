#!/bin/bash

#Installation dir
dest=/opt/arduino

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	# 64-bit stuff here
	url=http://arduino.googlecode.com/files/arduino-1.0.5-linux64.tgz
else
	# 32-bit stuff here
	url=http://arduino.googlecode.com/files/arduino-1.0.5-linux32.tgz
fi

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

tar xzf $name || exit 30

shortname=$(echo $name | sed 's/-linux.*//')
target="$PWD/$shortname/arduino"
if [ -f "$target" ]
then
	echo ok
	cd ~/bin || exit 40
	ln -s $target arduino || exit 41
fi

echo "Done...."
exit 0
