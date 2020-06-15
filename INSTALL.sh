#!/usr/bin/env zsh

cd ~/.zsh && ls *(.) | grep -vE "^[A-Z]" | xargs -I{} ln -sfv ~/.zsh/{} ~/.{}

