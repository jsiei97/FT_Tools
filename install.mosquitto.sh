#!/bin/bash

project=~/funtech/mosquitto/

mkdir -p $project/
pushd $project || exit 10

# First fix a libwebsockets that works with newer mosq...
echo "About to build libwebsockets"

if [ -d libwebsockets.deb ]
then
    rm -rf libwebsockets.deb || exit 20
fi

git clone git@github.com:jsiei97/libwebsockets.deb.git || exit 22

pushd libwebsockets.deb || exit 23
git submodule update --init --recursive || exit 24
./build.sh || exit $?
popd || exit 29

# Then build mosquitto 1.4 with websockets
echo "About to build mosquitto"

if [ -d mosquitto.deb ]
then
    rm -rf mosquitto.deb || exit 80
fi

git clone git@github.com:jsiei97/mosquitto.deb.git mosquitto.deb || exit 82

pushd mosquitto.deb || exit 84
git submodule update --init --recursive || exit 86
./build.sh || exit $?
popd

echo "Done..."
exit 0
