#! /usr/bin/env zsh

function sortConfigDirectory {
    echo `ls -v $1/*.conf`
}

function loadConfiguration {
    for conf_file in `sortConfigDirectory $1`; do
        source $conf_file
    done
}

loadConfiguration $1
