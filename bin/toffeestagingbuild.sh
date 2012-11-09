#!/bin/bash

cd ~/programming/sugar/mango_stage > /dev/null 2>&1
git submodule update

pushd ~/programming/sugar/mango_stage/build/rome > /dev/null 2>&1

echo "******* Building Toffee *******"
#rm -rf /Applications/MAMP/htdocs/ent/sugarcrm
php build.php --flav=ent --ver=6.6.0 --clean=1 --cleanCache=0 --dir=./sugarcrm --build_dir=/Applications/MAMP/htdocs; popd;
popd > /dev/null 2>&1
cp /Users/rlevin/programming/sugar/config_si.php /Applications/MAMP/htdocs/ent/sugarcrm/



