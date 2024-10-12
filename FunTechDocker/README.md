# FunTechDocker

## About

This docker will contain all tools used to compile the Fun Tech House Project.


## How to use

Install tools needed on the PC
* docker
* vscode


## Create the docker

To create the docker run this: 

```bash
./generate_docker.sh
```

## Test the container

I added the Blinky example to test the container. 
If we can compile and flash it onto a Arduino Uno R4 WiFi, 
then we have test ok.

```bash
. ./init.sh
funshell bash
cd Blink
make
```


## Tools added to docker image

Arduino CLI
* https://github.com/arduino/arduino-cli/releases

