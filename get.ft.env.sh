#!/bin/bash

projectdir=$HOME

function get_git
{
    user=$1
    git=$2
    if [ -d $git ]
    then
        echo "No action: $git"
    else
        git clone git@github.com:$user/$git".git" $git || exit 20
    fi
}

#mkdir -p $projectdir
pushd $projectdir || exit 10

get_git jsiei97 .vim

if [ ! -e .vimrc ]
then
    echo "Add .vimrc"
    cp .vim/.vimrc . || exit 20
fi

get_git jsiei97 git_bin

if [ "$(grep git_bin ~/.bashrc)" ]
then
    echo "git_bin is in path"
else
    echo '' >> ~/.bashrc
    echo 'export PATH=$PATH:~/git_bin' >> ~/.bashrc
    echo '' >> ~/.bashrc
fi

if [ "0" -eq "`grep '/usr/local/lib' ~/.bashrc | wc -l`" ]
then
    echo '' >> ~/.bashrc
    echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"' >> ~/.bashrc
    echo '' >> ~/.bashrc
fi



