#!/bin/bash

set -e

if [ $# != 2 ]
then    
    echo "Require filepath and string to write. Exiting"
    exit 1
else
    writefile=$1
    filename="$(basename -- $writefile)"
    path=`echo $writefile | sed -r "s/\/$filename//"`
    mkdir -p $path
    if [ $? != 0 ]
    then
        echo "Unable to create directory $path"
        exit 1
    fi
    #echo $filename
    #touch $filename
    echo $2 > $path/$filename
    if [ $? != 0 ]
    then
        echo "Unable to create file filename"
        exit 1
    fi
fi