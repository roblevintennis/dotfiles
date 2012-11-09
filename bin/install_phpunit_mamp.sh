#!/usr/bin/env bash
# Description: Script to install phpunit against MAMP 2.05

set -x

function main() {
    upgrade_pear
    install_phpunit
    verify_and_symlink
}

function upgrade_pear() {
    mv /Applications/MAMP/bin/php/php5.3.6/conf/pear.conf /Applications/MAMP/bin/php/php5.3.6/conf/pear.conf.old
    cd /Applications/MAMP/bin/php/php5.3.6/bin
    ./pear channel-update pear.php.net
    sudo ./pear upgrade pear
}

function install_phpunit() {
    cd /Applications/MAMP/bin/php/php5.3.6/bin
    ./pear config-set auto_discover 1
    ./pear channel-discover pear.phpunit.de
    ./pear channel-discover pear.symfony-project.com
    ./pear channel-discover components.ez.no
    sudo ./pear install --alldeps pear.phpunit.de/PHPUnit
}

function verify_and_symlink() {
    echo "Verifying by running phpunit --version: "
    echo
    /Applications/MAMP/bin/php/php5.3.6/bin/phpunit --version
    echo "Symlinking phpunit to /usr/local/bin"
    sudo ln -s /Applications/MAMP/bin/php/php5.3.6/bin/phpunit /usr/local/bin/phpunit
}

main
exit 0
