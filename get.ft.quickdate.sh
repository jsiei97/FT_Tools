#!/bin/bash

#Make sure the webserver is installed
#sudo ./pkg.raspian.lighttpd.sh

# Then check that $USER was added to www-data group
# (exit and login again)

# Then run this script, that installs in the web dir
projectdir=/var/www/html

# Test that the quickdate url:
# http://mosqhub/QuickDate/QuickDate.php

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

get_git jsiei97 QuickDate

echo "Done"
exit 0
