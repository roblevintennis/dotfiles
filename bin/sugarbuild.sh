#!/bin/bash

pushd ~/programming/sugar/Mango/build/rome > /dev/null 2>&1

date >> /Users/rlevin/bin/log/sugarbuild.log 2>&1

#echo "Input file is: ${1}" >> $HOME/bin/log/sugarbuild.log 2>&1

/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --dir=$1 > /dev/null 2>&1

popd > /dev/null 2>&1

