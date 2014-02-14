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

get_git jsiei97 Arduino-PID-Library
get_git jsiei97 pubsubclient

get_git jsiei97 FT_EDS
get_git jsiei97 FT_Sensor
get_git jsiei97 FT_Time

get_git jsiei97 FunTechHouse_Door
get_git jsiei97 FunTechHouse_ElectricityMeter
get_git jsiei97 FunTechHouse_Regulator
get_git jsiei97 FunTechHouse_RoomTemperature
get_git jsiei97 FunTechHouse_Thermostat


