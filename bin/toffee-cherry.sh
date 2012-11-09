#!/bin/bash

# First grab the commit ranges commit shas and then run this script one at a time
# For example, to get the list of commits for a given range by Rob Levin:
# First checkout the branch you want forcing local files to be deleted (be careful):
# git co --force -b <branch>
# Then get the list and redirect to a file:
# git rev-list --reverse --author='Rob Levin' 74e69da...53f0592 | xargs -n 1 > ../search_works.sha1s.txt
if [ $# -ne 1 ]; then
    echo "Usage: $0 [sha1]"
    exit 1
fi
SHA=$1

function main {
    show_files_changed_in_commit ${SHA} |
    remove_bad |
    checkout_files
}

function show_files_changed_in_commit {
    git show --pretty="format:" --name-only $1
}

function remove_bad {
    grep -v php |
    sed '/^ *$/d' 
}

function checkout_files {
    while read file; do 
        checkout_file ${SHA} ${file}
    done
}

function checkout_file {
    if [[ -n $1 ]]; then
        echo "Checking out $2 from branch $1"
        `git checkout ${1} ${2}`
        `git checkout ${SHA} -- ${2}`
    fi
}

main "$@"
exit 0

