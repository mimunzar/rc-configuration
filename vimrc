set nocompatible        " no compatible with VI

source ~/.zsh/vim/netrw.vim
source ~/.zsh/vim/search.vim
source ~/.zsh/vim/buffers.vim
source ~/.zsh/vim/templates.vim
ru macros/justify.vim

set ruler               " always display the cursor position
set showcmd             " shows command as it is being typed
set scrolloff=10        " minimal number of lines to keep around the cursor
set cursorline          " highlights current line

set nu                  " set line numbering
set syntax=on           " set syntax highlighting
colorscheme zenburn     " set color scheme

set tabstop=4           " existing tabs have width of 4 spaces
set shiftwidth=4        " indenting with '<' or '>' will use 4 spaces
set expandtab           " pressing tab will insert spaces

set incsearch           " display matches while typing
set hlsearch            " highlights all search matches

filetype on             " enable filetype detection
filetype indent on      " enable loading of indent files
filetype plugin on      " enable loading of plugin files
set autoindent          " copy indent from the previous line
set autoread            " autoload file when externally changed

set list                        " displays unprintable characters
set listchars=tab:>-,trail:-    " display tabs and trailing whitespaces

if has('gui_running')
    set guifont=Fira\ Code\ Retina\ 10
    execute pathogen#infect()
endif

