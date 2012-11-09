#!/bin/bash

set -x

PHP='/Applications/MAMP/bin/php/php5.3.6/bin/php'

function main() {
    pushd ${HOME}/programming/sugar/Mango/sugarcrm/tests
    findTests | runSpec
}

function findTests() {
    find . -iname "RestTest*.php" -print | grep -v Base
}
function runSpec() {
    while read file; do 
        echo "Running spec: ${file}"
        (${PHP} ./phpunit.php ${file})
    done
}

main
exit 0

