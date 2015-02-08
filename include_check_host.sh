#!/bin/bash

function check_host
{
    ssh -q $backupHost exit
    if [ ! $? = 0 ]
    then
        echo "ssh failed, check hostname and/or ssh keys..."
        echo "ssh-copy-id $backupHost"
        echo "ssh $backupHost"
        exit 10
    fi
}
