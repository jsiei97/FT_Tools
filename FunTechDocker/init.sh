#!/bin/bash -ex

DOCKER_NAME="funtechdocker"
DOCKER_TAG="latest"

#Find what usb the arduino is connected to, and use that one.
if [ -e /dev/ttyACM0 ]
then
    echo "Arduino found on /dev/ttyACM0"
    devicename="--device=/dev/ttyACM0"
else
    echo "Arduino not found on /dev/ttyACM0"
    devicename=""
fi

# Go to the directory with your code, 
# then run this script to share that folder with the docker container
# the shared folder is /work inside the container
funshell() {
    docker run -a stdin -a stdout -a stderr \
        -i -t --rm \
        -v $(pwd):/work -w /work \
        $devicename \
        -u $(id -u):$(id -g) \
        "$DOCKER_NAME:$DOCKER_TAG" \
        bash -c '$@' $0 $@
}
