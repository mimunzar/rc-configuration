" no vi compatible
set nocompatible

source ~/.zsh/vim/coc.vim
ru     macros/justify.vim

" put swap files into tmp
set dir=/tmp
" shows command as it is being typed
set showcmd
" minimal number of lines to keep around the cursor
set scrolloff=10
" always display the cursor position
set ruler
"" highlights current line
set cursorline
" set line numbering
set nu
" existing tabs have width of 4 spaces
set tabstop=4
" indenting with '<' or '>' will use 4 spaces
set shiftwidth=4
" pressing tab will insert spaces
set expandtab
" display matches while typing
set incsearch
" highlights all search matches
set hlsearch
" copy indent from the previous line
set autoindent
" autoload file when externally changed
set autoread
" displays unprintable characters
set list
" display tabs and trailing whitespaces
set listchars=tab:>-,trail:-
" paste without autoformating
set pastetoggle=<F4>
" Case insensitive search
set ignorecase
" Unless start to write capitals
set smartcase
" enable filetype detection
filetype on
" enable loading of indent files
filetype indent on
" enable loading of plugin files
filetype plugin on
" set syntax highlighting
syntax enable

" Syntax highlighting
" -------------------
colors torte
au BufRead,BufNewFile *.asd  set ft=lisp
au BufRead,BufNewFile *.edn  set ft=clojure
au BufRead,BufNewFile *.cljc set ft=clojure


" Bindings
" --------
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" Search for current Selection
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
" Clear current highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" File Templates
" --------------
if has("autocmd")
    augroup templates
        autocmd BufNewFile *.c          0r ~/.zsh/vim/templates/skeleton.c
        autocmd BufNewFile *.cpp        0r ~/.zsh/vim/templates/skeleton.c
        autocmd BufNewFile *.py         0r ~/.zsh/vim/templates/skeleton.py
        autocmd BufNewFile *.sh         0r ~/.zsh/vim/templates/skeleton.sh
        autocmd BufNewFile *.html       0r ~/.zsh/vim/templates/skeleton.html
        autocmd BufNewFile .gitignore   0r ~/.zsh/vim/templates/skeleton.gitignore
        autocmd BufNewFile .ctagsignore 0r ~/.zsh/vim/templates/skeleton.ctagsignore
    augroup END
endif

" Netrw
" -----
let g:netrw_banner=0
let g:netrw_list_hide='.*\.swp$,^\..*$,__pycache__'
