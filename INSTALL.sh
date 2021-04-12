#!/usr/bin/env zsh


# Configures X and I3
for f ("Xresources" "xinitrc" "zprofile" "i3status.conf"); do
    ln -svf ~/.zsh/xconf/$f ~/.$f
done

[ -d ~/.config ] || mkdir ~/.config
ln -svf ~/.zsh/xconf/redshift.conf ~/.config/

[ -d ~/.config/i3 ] || mkdir ~/.config/i3
ln -svf ~/.zsh/xconf/i3config ~/.config/i3/config

# Configures ZSH
cd ~/.zsh && ls *(.) | grep -vE "^[A-Z]" | xargs -I{} ln -sfv ~/.zsh/{} ~/.{}

