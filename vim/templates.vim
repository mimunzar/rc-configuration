" template file for different suffixes
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.c 0r ~/.zsh/vim/templates/skeleton.c
        autocmd BufNewFile *.py 0r ~/.zsh/vim/templates/skeleton.py
        autocmd BufNewFile *.html 0r ~/.zsh/vim/templates/skeleton.html
        autocmd BufNewFile .gitignore 0r ~/.zsh/vim/templates/skeleton.gitignore
        autocmd BufNewFile .ctagsignore 0r ~/.zsh/vim/templates/skeleton.ctagsignore
    augroup END
endif

