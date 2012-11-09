#!/bin/bash

rm -rf /Applications/MAMP/htdocs/ent/sugarcrm/sidecar

echo "Copying over sidecar files to /Applications/MAMP/htdocs/ent/sugarcrm/sidecar"
cp -R /Users/rlevin/programming/sugar/sidecar /Applications/MAMP/htdocs/ent/sugarcrm/sidecar

popd > /dev/null 2>&1

