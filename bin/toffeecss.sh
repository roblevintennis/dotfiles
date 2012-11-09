#!/bin/bash
echo "****************************************************************************************************"
echo "Diff of toffee and styleguide before: "
diff -u $HOME/programming/sugar/styleguide/css/bootstrap.css $HOME/programming/sugar/Mango/sidecar/extensions/portal/lib/twitterbootstrap/css/bootstrap.css 

echo "Copying bootstrap.css to MAMP..."
cp sidecar/extensions/portal/lib/twitterbootstrap/css/bootstrap.css /Applications/MAMP/htdocs/ent/sidecar/extensions/portal/lib/twitterbootstrap/css/bootstrap.css


echo "****************************************************************************************************"
echo "****************************************************************************************************"
echo "Diff **AFTER***  of toffee and styleguide before: "
diff -u $HOME/programming/sugar/styleguide/css/bootstrap.css $HOME/programming/sugar/Mango/sidecar/extensions/portal/lib/twitterbootstrap/css/bootstrap.css 

echo "****************************************************************************************************"
echo
echo
echo "Done"
exit 0

