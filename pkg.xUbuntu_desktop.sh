#!/bin/bash

# xUbuntu development workplace

apt-get update  || exit 10
apt-get upgrade || exit 11

apt-get install \
    build-essential cmake \
    libssl-dev libc-ares-dev uuid-dev \
    libcurl4-openssl-dev \
    xsltproc docbook-xsl \
    vim vim-gtk exuberant-ctags cscope \
    diffuse meld \
    gdb ddd \
    git gitk \
    qt4-qmake qt4-dev-tools \
    valgrind \
    doxygen graphviz \
    gnuplot gnuplot-x11 \
    wget curl \
    visual-regexp xclip \
    okteta ghex \
    ckermit \
    openjdk-7-jre || exit 12

echo "Done..."
exit 0
