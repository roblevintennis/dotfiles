#!/bin/bash

SINGLE_FILE=''

while getopts ":f:" opt; do
    case $opt in
        f)
            echo "-f was triggered with $OPTARG" >&2
            SINGLE_FILE=`echo $OPTARG | sed 's|^.*Mango/||'`
            echo "As single file: ${SINGLE_FILE}"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done


# Navigate to project checkout directory. Grab current git branch name
SRC_DIR=~/programming/sugar/Mango
pushd $SRC_DIR
CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
popd
pushd ~/programming/sugar/nomad; 
(export BUILD_DIR=/Applications/MAMP/htdocs SRC_DIR=${SRC_DIR}; ./build-mango.sh -file ${SINGLE_FILE} -branch ${CURRENT_BRANCH} -php "/usr/bin/php" );
popd

# Very ugly crap proceeds ;-)
echo "Install path: "
echo "/Applications/MAMP/htdocs/${CURRENT_BRANCH}/ent/${SINGLE_FILE}"

