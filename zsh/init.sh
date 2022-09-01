#! /usr/bin/env zsh

loadConfiguration() {
    for conf_file in $(ls -v $1/*.conf); do
        source ${conf_file}
    done
}

loadConfiguration $1
