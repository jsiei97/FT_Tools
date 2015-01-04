#!/bin/bash

project=~/funtech/mosquitto/

mkdir -p $project/
pushd $project || exit 10

# First fix a libwebsockets that works with mosq...
if [ -d libwebsockets ]
then
    rm -rf libwebsockets || exit 20
fi
git clone git@github.com:jsiei97/libwebsockets.git libwebsockets || exit 22

mkdir -p libwebsockets/build
pushd libwebsockets/build || exit 24

cmake ..          || exit 26
make              || exit 27
sudo make install || exit 28

popd || exit 29


# Then build mosquitto 1.4 with websockets
if [ -d mosquitto_1.4 ]
then
    rm -rf mosquitto_1.4 || exit 80
fi

git clone -b 1.4 http://git.eclipse.org/gitroot/mosquitto/org.eclipse.mosquitto.git mosquitto_1.4 || exit 82

pushd mosquitto_1.4/ || exit 84
sed -i 's/\(WITH_WEBSOCKETS:=\).*/\1yes/g' config.mk || exit 85

make ||  exit 30
sudo make install || exit 31

sudo cp service/monit/mosquitto.monit /etc/monit/conf.d/mosquitto || exit 40

popd || exit 89

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

cat > mosquitto.conf << EOF
# Add both normal mqtt on port 1883
# and websockets on port 9001
listener 1883
listener 9001 127.0.0.1
protocol websockets

EOF
    cat /etc/mosquitto/mosquitto.conf.example >> mosquitto.conf || exit 60
    sed -i 's/#user .*/user '$USER'/g' mosquitto.conf || exit 62
    sudo cp mosquitto.conf /etc/mosquitto/mosquitto.conf || exit 64
fi

echo "Done..."
exit 0
