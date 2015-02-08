#!/bin/bash

#This will create
# 1. a local git clone on this pc in the workspace dir
# 2. a bare git on the backupHost
# 3. Add git remotes to the main git called upstream
# 4. Add git remotes to the backup/work git git called work
#
#The upstream shall only contain generic code and 
#no project specific configuration.
#
function getGits
{
    backupHost="$1"
    workspace="$2"
    masterGit="$3"
    project="$4"
    branch="$5"

    projectGit=$project".git"
    gitName=$(basename $masterGit)

    if [ -z "$branch" ]
    then
        branch="master"
    fi

    if ! $(ssh $backupHost "cd $workspace/$projectGit")
    then
        ssh $backupHost "mkdir -p $workspace" || exit 10
        ssh $backupHost "cd $workspace && git clone --bare $masterGit $projectGit" || exit 12
    else
        echo "Backup git exists: $gitName -> $projectGit"
    fi

    if [ ! -d $project ]
    then
        git clone --branch $branch $masterGit $project || exit 14

        pushd $project || exit 16
        # Init and get any submodules
        git submodule update --init --recursive || exit 17
        # Add backup/work remotes, and rename origin to something to avoid bad pushes
        git remote add work $backupHost:$workspace/$projectGit || exit 18
        git remote rename origin upstream || exit 20
        git remote update || exit 22
        popd
    else
        echo "Local work git exists: $gitName -> $projectGit"
    fi
}
