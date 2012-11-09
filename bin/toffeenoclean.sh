#!/bin/bash

pushd build/rome && /usr/bin/php build.php --ver=6.5.0 --flav=ent --build_dir=/Applications/MAMP/htdocs --clean=0 --dir=/Users/rlevin/programming/sugar/Mango/sugarcrm && cd -

