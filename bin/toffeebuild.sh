#!/bin/bash

pushd ~/programming/sugar/Mango/build/rome > /dev/null 2>&1

echo "******* Building Toffee *******"
echo "First building sidecar..."
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --dir=/Users/rlevin/programming/sugar/Mango/sidecar

echo "Now building sugarcrm/clients..."
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/clients/

popd > /dev/null 2>&1

