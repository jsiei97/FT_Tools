#!/bin/bash -e

# Install all depencies for the project on the host machine


sudo apt install docker.io

sudo usermod -aG docker $USER

#sudo systemctl daemon-reload
sudo systemctl restart docker.service 


echo "Done..."
exit 0