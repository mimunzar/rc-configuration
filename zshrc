#! /usr/bin/env zsh


function loadShellConfiguration {
    shDir=~/.zsh/zsh/
    source $shDir/init.sh $shDir/init.conf.d
    source $shDir/initWorkSpecific.sh
}

function loadExternalScripts {
    scriptsDir=~/.zsh/scripts
    for file in `ls -v $scriptsDir | grep -vE "^[A-Z]"`; do
         ln -sf $scriptsDir/$file ~/bin
    done
}

loadShellConfiguration
loadExternalScripts

