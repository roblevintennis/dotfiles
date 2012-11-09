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

date >> /Users/rlevin/bin/log/sugarbuild.log 2>&1
echo 'Attempting to do full build of sugarcrm and toffe' >> /Users/rlevin/bin/log/sugarbuild.log 2>&1

echo "fetching latest from toffee upstream..."
pushd ~/programming/sugar/Mango > /dev/null 2>&1
git checkout toffee && git fetch upstream && git rebase upstream/toffee && git push origin toffee
echo "updating submodules..."
git submodule update

echo "******* Building SugarCRM *******"
echo "clean is set to: $1 (0 for false 1 for true)"

pushd ~/programming/sugar/Mango/build/rome > /dev/null 2>&1

echo "Removing MAMP htdocs/ent..."
rm -rf /Applications/MAMP/htdocs/ent

# http://internalwiki.sjc.sugarcrm.pvt/index.php/Enginerring/Build_Command_Cheat_Sheet
php build.php --flav=ent --ver=6.6.0 --clean=$1 --cleanCache=0 --dir=./sugarcrm --build_dir=/Applications/MAMP/htdocs > /dev/null 2>&1

echo "Copying config_si.php file over...so you can do 'Silent Install'"
cp /Users/rlevin/programming/sugar/config_si.php /Applications/MAMP/htdocs/ent/sugarcrm/

echo '*******************'
echo '*** Cheat sheet ***'
echo '*******************'
echo '
Download Key: sugartraining1 
User/Pass: admin/asdf
Do you have a config.js? no? cp sidecar/src/sampleConfig.js to config.js

For more info on silent install see:
http://internalwiki.sjc.sugarcrm.pvt/index.php/Engineering/SilentInstaller

Now go to:
http://localhost:8888/ent/sugarcrm/install.php?goto=SilentInstall&cli=true

You may also need to add module access:
http://localhost:8888/ent/sugarcrm/index.php?module=Administration&action=ConfigureTabs'

