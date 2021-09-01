#!/usr/bin/env zsh


function loadPaths {
    path=(~/bin $path)
    fpath=(~/.zsh/completion $fpath)
}

function loadShellConfiguration {
    local shDir=~/.zsh/zsh/
    source $shDir/init.sh $shDir/init.conf.d
    if [[ -f "$shDir/initWorkSpecific.sh" ]]; then
        source $shDir/initWorkSpecific.sh
    fi
}

function loadTmux {
    [[ $- != *i* || -z "$(command -v "tmux")" ]] && return 1
    if [[ -z "$TMUX" ]]; then
        exec tmux -2
    fi
}

function loadExternalScripts {
    local scriptsDir=~/.zsh/scripts
    [[ -d ~/bin ]] || mkdir ~/bin
    for file in $(ls -v $scriptsDir | grep -vE "^[A-Z]"); do
         ln -sf $scriptsDir/$file ~/bin
    done
}

loadPaths
loadShellConfiguration
loadExternalScripts
loadTmux

