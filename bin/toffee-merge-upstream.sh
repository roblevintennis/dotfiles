#!/bin/bash
echo "stashing local git changes"
git stash
git checkout toffee
echo "fetching upstream..."
git fetch upstream
echo "merging upstream/toffee..."
git rebase upstream/toffee
echo "pushing up to your github fork.."
git push origin toffee 
echo "Remember your changed have been stashed .. do git stash pop"
#git stash pop
echo "done"
