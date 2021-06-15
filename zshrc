#! /usr/bin/env zsh


function loadPaths {
    path=(~/bin $path)
    fpath=(~/.zsh/completion $fpath)
}

function loadDirColors {
    eval `dircolors -b`
}

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

loadDirColors
loadPaths
loadShellConfiguration
loadExternalScripts
loadTmux

[ -f "/home/mmunzar/.ghcup/env" ] && source "/home/mmunzar/.ghcup/env" # ghcup-env


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
