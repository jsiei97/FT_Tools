#!/bin/bash

# Depends on:
# sudo apt-get install lib32ncurses5

#Installation dir
dest=/opt/linaro_baremetal

url='https://launchpad.net/gcc-arm-embedded/5.0/5-2015-q4-major/+download/gcc-arm-none-eabi-5_2-2015q4-20151219-linux.tar.bz2'

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

tar -xjf $name || exit 30



cat > ~/bin/funtech_linaro_baremetal_setup.sh << EOF
export PATH=/opt/linaro_baremetal/gcc-arm-none-eabi-5_2-2015q4/bin/:\$PATH

EOF
chmod 755 ~/bin/funtech_linaro_baremetal_setup.sh


echo Run this with: source ~/bin/funtech_linaro_baremetal_setup.sh in the active terminal


echo "Done...."
exit 0
