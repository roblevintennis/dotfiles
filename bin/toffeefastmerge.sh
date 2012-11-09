#!/bin/bash

echo "fetching, merging, and pushing back to origin"
git stash
git checkout toffee && git fetch upstream && git rebase upstream/toffee && git push origin toffee && git submodule update
git stash pop
