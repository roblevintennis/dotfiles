#!/bin/bash
#
# Shell script that builds sugarcrm and toffee/sidecar 
#
# Example:  sugarall.sh 1
#
set -x

if [ $# -ne 1 ] ; then
    echo "usage: sugarall.sh 1|0"
    echo "where 1|0 is whether to clean or not"
    exit 1
fi

echo "clean is set to: $1 (0 for false 1 for true)"

pushd ~/programming/sugar/Mango/build/rome > /dev/null 2>&1

echo "Removing MAMP htdocs/ent..."
rm -rf /Applications/MAMP/htdocs/inst2

# http://internalwiki.sjc.sugarcrm.pvt/index.php/Enginerring/Build_Command_Cheat_Sheet
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs/inst2 --clean=$1 > /dev/null 2>&1

echo "Copying config_si.php file over...so you can do 'Silent Install'"
cp /Users/rlevin/programming/sugar/config_si_inst2.php /Applications/MAMP/htdocs/inst2/ent/sugarcrm/config_si.php


echo "******* Building Toffee *******"
echo "First building sidecar..."
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs/inst2 --dir=/Users/rlevin/programming/sugar/Mango/sidecar

popd > /dev/null 2>&1

echo "Done ..."
echo 'Now go to:
http://localhost:8888/inst2/ent/sugarcrm/install.php?goto=SilentInstall&cli=true'


