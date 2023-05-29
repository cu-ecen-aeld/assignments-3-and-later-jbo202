#!/bin/bash

set -e

#echo $# arguments

if [ $# != 2 ]
then
    echo "Require files directory and search string. Exiting"
    exit 1
else if [ ! -d  $1 ]
    then
        echo "$1 is not a directory".
        exit 1
    else
        number_of_files=`grep -lR $2 $1  | wc -l`
        number_of_matching_lines=`grep -R $2 $1  | wc -l`
        echo "The number of files are ${number_of_files} and the number of matching lines are ${number_of_matching_lines}"
    fi
fi



