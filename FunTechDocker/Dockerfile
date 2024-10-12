FROM ubuntu:latest

USER root

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN apt-get update && apt-get upgrade -y
# sudo is only needed since we have a issue with the udev rules
RUN apt-get install -y ca-certificates udev build-essential sudo

COPY arduino-cli_1.0.4_Linux_64bit.tar.gz /tmp/ 
RUN tar -xvf /tmp/arduino-cli_1.0.4_Linux_64bit.tar.gz -C /usr/local/bin/
RUN rm /tmp/arduino-cli_1.0.4_Linux_64bit.tar.gz

# Default user is called ubuntu with uid=1000
RUN usermod -aG dialout ubuntu 
RUN usermod -aG plugdev ubuntu

RUN echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#RUN echo 'KERNEL=="ttyACM0", MODE="0666", GROUP="plugdev"' > /etc/udev/rules.d/my-newrule.rules
# From lsusb
# Bus 004 Device 008: ID 2341:1002 Arduino SA UNO WiFi R4 CMSIS-DAP
#  idVendor           0x2341 Arduino SA
#  idProduct          0x1002 
#RUN echo 'ATTRS{idProduct}=="1002", ATTRS{idVendor}=="2341", MODE="666", GROUP="plugdev"' > /etc/udev/rules.d/99-arduino.rules


# Install the arduino-cli libs inside the container
ENV ARDUINO_DATA_DIR=/opt/arduino
RUN arduino-cli core update-index

# Uno R4 WiFi
RUN arduino-cli core install arduino:renesas_uno


# Save the output and then include that in bashrc
#RUN arduino-cli completion bash > /etc/bash_completion.d/arduino-cli

