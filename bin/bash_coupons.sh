#!/bin/bash

main() {
    echo `three_random_words`
}

three_random_words() {
    for i in {1..3}; do
        random_word
    done
}

random_word() {
    index=`expr $RANDOM \% $(count) + 1`
    words | head -$index | tail -1
}
count() { words | wc -l; }

words() { 
    paths | 
    extract_words_from_paths | 
    remove_non_alpha_characters | 
    downcase | 
    remove_long_words | 
    unique | 
    remove_confusing_chars 
}

remove_non_alpha_characters() { grep -v '[^[:alpha:]]'; }

extract_words_from_paths() {
    # greedy so up to very last / 
    sed 's/^.*\///' | sed 's/\..*$//'
}

paths() { find /usr/share/man -type f; }

downcase() { tr 'A-Z' 'a-z'; }

remove_long_words() { egrep '^.{1,4}$'; }

unique() { sort -u; }

remove_confusing_chars() { grep -v l | grep -v I | grep -v 0 | grep -v O; }

main
