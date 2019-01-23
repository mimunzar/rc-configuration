#! /usr/bin/env zsh

zshDir=~/.zsh/
zshConfigDir=$zshDir/init.conf.d/

function loadConfiguration {
	source $zshDir/init.sh $zshConfigDir
	source $zshDir/initWorkSpecific.sh $zshConfigDir
}

function loadTmux {
	[[ $- != *i* ]] && return 1
	[[ -z "$TMUX" ]] && exec tmux -2
}

loadTmux
loadConfiguration
