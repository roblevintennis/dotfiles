#!/bin/bash

pushd ~/programming/sugar/Mango/build/rome > /dev/null 2>&1

echo "******* Building Toffee *******"

echo "removing directories sidecar, clients, modules, and includes (because clean doesn't seem to work!)"
rm -rf /Applications/MAMP/htdocs/ent/sugarcrm/sidecar
rm -rf /Applications/MAMP/htdocs/ent/sugarcrm/clients
# Copy generated config file for later
#cp /Applications/MAMP/htdocs/ent/sugarcrm/portal2/config.js /tmp/config.js
rm /Applications/MAMP/htdocs/ent/sugarcrm/portal2/portal.js
rm -rf /Applications/MAMP/htdocs/ent/sugarcrm/styleguide
rm -rf /Applications/MAMP/htdocs/ent/sugarcrm/portal2/lib
rm /Applications/MAMP/htdocs/ent/sugarcrm/portal2/portal-ui.js
rm /Applications/MAMP/htdocs/ent/sugarcrm/portal2/error.js
rm /Applications/MAMP/htdocs/ent/sugarcrm/portal2/index2.html
rm -rf /Applications/MAMP/htdocs/ent/sugarcrm/modules
rm -rf /Applications/MAMP/htdocs/ent/sugarcrm/includes

echo "Now building sugarcrm/clients..."
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/sidecar/

/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/styleguide

# Build portal2 but move back the generated config.js file
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/portal2/portal.js
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/portal2/lib
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/portal2/portal-ui.js
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/portal2/error.js
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/portal2/index2.html
#mv /tmp/config.js /Applications/MAMP/htdocs/ent/sugarcrm/portal2/config.js

/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/clients/
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/include/
/usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm/modules/

popd > /dev/null 2>&1

