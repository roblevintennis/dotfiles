#!/bin/bash

echo "fetching, merging, and pushing back to origin"
git checkout toffee && git fetch upstream && git merge upstream/toffee && git push origin toffee
