#!/usr/bin/env bash
branches=( dev pre-qa qa pre-prod prod )

source ./config
cd $dir
for branch in ${branches[@]}
do
    echo "******************************************************************** Pulling Branch $branch"
    echo

    git checkout $branch
    git pull

done