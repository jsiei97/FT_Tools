#!/bin/bash

# Raspian Mosqhub

apt -y update  || exit 10
apt -y upgrade || exit 11

apt -y install \
    build-essential \
    qt4-qmake qt4-dev-tools \
    libcurl4-openssl-dev \
    git git-core gitk xclip \
    vim vim-gtk vim-runtime vim-scripts exuberant-ctags cscope \
    meld diffuse \
    libssl-dev libc-ares-dev uuid-dev \
    cmake \
    monit \
    xsltproc docbook-xsl || exit 20


echo "Done..."
exit 0
