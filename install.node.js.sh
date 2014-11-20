#!/bin/bash

# Can you use a package on http://nodejs.org/download/ ?
#
# On platforms like the PI we need to build from src, 
# and that is what this scripts does.

project=~/funtech/node.js/
url=http://nodejs.org/dist/v0.10.33/node-v0.10.33.tar.gz
file=$(basename $url)
version=$(basename $url .tar.gz)

echo "About to install node.js"
echo "url : $url"
echo "file: $file"
echo "ver : $version"

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



./configure || exit 30
make -j     || exit 32

#sudo make install || exit 31


popd

echo "Done..."
exit 0
