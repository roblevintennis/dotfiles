pushd /Users/rlevin/programming/sugar/Mango/build/rome; /usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=1; cp /Users/rlevin/programming/sugar/config_si.php /Applications/MAMP/htdocs/ent/sugarcrm/; /usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --dir=/Users/rlevin/programming/sugar/Mango/sidecar; popd
echo 'done .. now go to: '
echo 'http://localhost:8888/ent/sugarcrm/install.php?goto=SilentInstall&cli=true'
