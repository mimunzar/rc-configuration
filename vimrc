set nocompatible        " no compatible with VI

source ~/.zsh/vim/netrw.vim
source ~/.zsh/vim/search.vim
source ~/.zsh/vim/buffers.vim
source ~/.zsh/vim/templates.vim
source ~/.zsh/vim/slime.vim
ru macros/justify.vim

set dir=/tmp            " put swap files into tmp

set ruler               " always display the cursor position
set showcmd             " shows command as it is being typed
set scrolloff=10        " minimal number of lines to keep around the cursor
set cursorline          " highlights current line

set nu                  " set line numbering
syntax enable           " set syntax highlighting

set tabstop=4           " existing tabs have width of 4 spaces
set shiftwidth=4        " indenting with '<' or '>' will use 4 spaces
set expandtab           " pressing tab will insert spaces

set incsearch           " display matches while typing
set hlsearch            " highlights all search matches

filetype on             " enable filetype detection
filetype indent on      " enable loading of indent files
filetype plugin on      " enable loading of plugin files

au BufRead,BufNewFile *.asd set ft=lisp     " Syntax highlighting for *.asd files
au BufRead,BufNewFile *.edn set ft=clojure  " Syntax highlighting for *.edn files
au BufRead,BufNewFile *.cljc set ft=clojure " Syntax highlighting for *.cljc files

set autoindent  " copy indent from the previous line
set autoread    " autoload file when externally changed

set list                        " displays unprintable characters
set listchars=tab:>-,trail:-    " display tabs and trailing whitespaces

set pastetoggle=<F4>                    " paste without autoformating
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <F5> :!ctags -R --exclude=@.ctagsignore .<CR>

set ignorecase " case-sensitive search trigger by writing an upper-case
set smartcase

