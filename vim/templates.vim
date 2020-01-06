if has("autocmd")
    augroup templates
        autocmd BufNewFile *.py 0r ~/.zsh/vim/templates/skeleton.py
        autocmd BufNewFile *.html 0r ~/.zsh/vim/templates/skeleton.html
    augroup END
endif

