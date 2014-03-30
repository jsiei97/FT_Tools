#!/bin/bash

projectdir=~/funtech

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

get_git jsiei97 FunTechHouse_Tellstick_Sensor
get_git jsiei97 FunTechHouse_WeekTimer_Nexa

