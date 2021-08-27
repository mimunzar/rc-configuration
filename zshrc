#!/usr/bin/env zsh


function loadPaths {
    path=(~/bin $path)
    fpath=(~/.zsh/completion $fpath)
}

function loadDirColors {
    eval `dircolors -b`
}

function loadShellConfiguration {
    local shDir=~/.zsh/zsh/
    source $shDir/init.sh $shDir/init.conf.d
    [[ -f "$shDir/initWorkSpecific.sh" ]] && source $shDir/initWorkSpecific.sh
}

function loadTmux {
    [[ $- != *i* ]] && return 1
    [[ -z "$TMUX" ]] && exec tmux -2
}

function loadExternalScripts {
    local scriptsDir=~/.zsh/scripts
    [[ -d ~/bin ]] || mkdir ~/bin
    for file in $(ls -v $scriptsDir | grep -vE "^[A-Z]"); do
         ln -sf $scriptsDir/$file ~/bin
    done
}

loadDirColors
loadPaths
loadShellConfiguration
loadExternalScripts
loadTmux

