#!/bin/bash
# toffeestage.sh peter peter-topic toffee-dev 
git fetch upstream && git checkout upstream/toffee && git co -b $2 && git fetch $1 && git merge $1/$3

