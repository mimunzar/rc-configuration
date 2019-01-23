#! /usr/bin/env zsh

ZSHDIR=~/.zsh/
ZSHCONFIGDIR=$ZSHDIR/init.conf.d/

function loadConfiguration {
	source $ZSHDIR/init.sh $ZSHCONFIGDIR
	source $ZSHDIR/initWorkSpecific.sh $ZSHCONFIGDIR
}

function loadTmux {
	[[ $- != *i* ]] && return 1
	[[ -z "$TMUX" ]] && exec tmux -2
}

loadTmux
loadConfiguration
