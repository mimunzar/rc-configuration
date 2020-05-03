#! /usr/bin/env zsh


function loadShellConfiguration {
    shDir=~/.zsh/zsh/
    source $shDir/init.sh $shDir/init.conf.d
    source $shDir/initWorkSpecific.sh
}

function loadTmux {
    [[ $- != *i* ]] && return 1
    [[ -z "$TMUX" ]] && exec tmux -2
}

function loadExternalScripts {
    scriptsDir=~/.zsh/scripts
    for file in `ls -v $scriptsDir | grep -vE "^[A-Z]"`; do
         ln -sf $scriptsDir/$file ~/bin
    done
}

loadTmux
loadShellConfiguration
loadExternalScripts

