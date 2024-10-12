#!/bin/bash -e

# Download if missing
arduinofile="arduino-cli_1.0.4_Linux_64bit.tar.gz"
if [ ! -f $arduinofile ]; then
    wget https://github.com/arduino/arduino-cli/releases/download/v1.0.4/arduino-cli_1.0.4_Linux_64bit.tar.gz
fi

docker build -t funtechdocker:latest .

# ToDo Where shall we push it? Have a local registry?

echo "Done..."
exit 0
