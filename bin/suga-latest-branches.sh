#!/bin/bash
# To see the branches by latest activity
for k in `git branch -a`; do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" "$k"` "$k";done | grep 'days\|hours'
