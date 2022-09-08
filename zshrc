#!/usr/bin/env zsh


initKeyboard() {
    setxkbmap -option "ctrl:nocaps"
    setxkbmap -layout us,cz -option "grp:alt_shift_toggle"
}

loadPaths() {
    path=(~/bin $path)
    fpath=(~/.zsh/completion $fpath)
}

loadShellConfiguration() {
    local source_dir=~/.zsh/zsh/
    loadGeneralConfig() {
        for conf_file in $(ls -v ${source_dir}/init.conf.d/*.conf); do
            source ${conf_file}
        done
    }
    loadWorkSpecificConfig() {
        if [[ -f ${source_dir}/initWorkSpecific.sh ]]; then
            source ${source_dir}/initWorkSpecific.sh
        fi
    }
    loadGeneralConfig && loadWorkSpecificConfig
}

loadTmux() {
    canStart() {
        [[ $- == *i* && -n "$(command -v "tmux")" ]]
    }
    startIfNotRunning() {
        [[ -z "$TMUX" ]] && exec tmux -2
    }
    canStart && startIfNotRunning
}

loadExternalScripts() {
    local source_dir=~/.zsh/scripts
    [[ -d ~/bin ]] || mkdir ~/bin
    for script in $(ls -v ${source_dir} | grep -vE "^[A-Z]"); do
         ln -sf "${source_dir}/${script}" ~/bin
    done
}

initKeyboard
loadPaths
loadShellConfiguration
loadExternalScripts
loadTmux

