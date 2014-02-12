#!/bin/bash

# xUbuntu development workplace

apt-get update  || exit 10
apt-get upgrade || exit 11

apt-get install \
    build-essential \
    vim vim-gtk exuberant-ctags cscope \
    git gitk \
    qt4-qmake qt4-dev-tools \
    valgrind \
    openjdk-7-jre || exit 12

echo "Done..."
exit 0
