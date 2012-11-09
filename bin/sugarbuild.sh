#!/bin/bash

pushd ~/programming/sugar/Mango/build/rome > /dev/null 2>&1

date >> /Users/rlevin/bin/log/sugarbuild.log 2>&1

#echo "Input file is: ${1}" >> $HOME/bin/log/sugarbuild.log 2>&1

# http://internalwiki.sjc.sugarcrm.pvt/index.php/Enginerring/Build_Command_Cheat_Sheet
php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=$1 > /dev/null 2>&1

#echo "Copying config.php file over..."
#cp /Users/rlevin/programming/sugar/config_GOOD.php /Applications/MAMP/htdocs/ent/sugarcrm/config.php

#echo "Copying config_si.php file over...so you can do 'Silent Install'"
cp /Users/rlevin/programming/sugar/config_si.php /Applications/MAMP/htdocs/ent/sugarcrm/

popd > /dev/null 2>&1



