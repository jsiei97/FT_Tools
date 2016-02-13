#!/bin/bash

projectdir=~/funtech/stm32/

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

mkdir -p $projectdir
pushd $projectdir || exit 10

get_git jsiei97 FunTechCortexMX_gcc
get_git jsiei97 FunTechCortexMX_test
get_git jsiei97 FunTechCortexMX_TemplateProject

popd

./install.linaro.baremetal.sh || exit 40


echo "Done..."
exit 0
