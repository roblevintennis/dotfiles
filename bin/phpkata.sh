#!/usr/bin/env bash
RANDNAME='php_kata'`date +%Y%m%s`
cp -R ~/bin/phpkatas ~/programming/labs/practice/${RANDNAME}
subl --new-window --add ~/programming/labs/practice/${RANDNAME}
