#!/bin/bash

#Installation dir
dest=/opt/fritzing

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
	# 64-bit stuff here
	url=http://fritzing.org/download/0.8.7b/linux-64bit/fritzing-0.8.7b.linux.AMD64.tar.bz2
else
	# 32-bit stuff here
	url=http://fritzing.org/download/0.8.7b/linux-32bit/fritzing-0.8.7b.linux.i386.tar.bz2
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

tar xjf $name || exit 30

shortname=$(basename $name .tar.bz2)
target="$PWD/$shortname/Fritzing"
if [ -f "$target" ]
then
	echo ok
	cd ~/bin || exit 40
	ln -s $target fritzing || exit 41
fi

echo "Done...."
exit 0
