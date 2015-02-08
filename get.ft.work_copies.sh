#!/bin/bash

# This script will create work copy of the projects, 
# and create a backup git on mosqhub for project uniq changes.

source include_get_git.sh
source include_check_host.sh

backupHost=$USER"@mosqhub"
workspace="projects"

check_host $backupHost

# Local work dir with install git
mkdir -p ~/$workspace
cd ~/$workspace || exit 20

#Add your project to the list
getGits $backupHost $workspace git@github.com:jsiei97/FunTechHouse_RoomTemperature.git RoomTemperature_1v_hall
getGits $backupHost $workspace git@github.com:jsiei97/FunTechHouse_RoomTemperature.git RoomTemperature_2v_hall

getGits $backupHost $workspace git@github.com:jsiei97/FunTechHouse_RoomTemperature.git KCC_735EA KCC_735EA__AM2302 

echo "Done..."
exit 0
