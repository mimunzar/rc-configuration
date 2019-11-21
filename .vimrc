set nocompatible        " no compatible with VI

set ruler               " always display the cursor position
set showcmd             " shows command as it is being typed
set scrolloff=10        " minimal number of lines to keep around the cursor

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

ru macros/justify.vim  " adds '_j' command for text justification

set list                        " displays unprintable characters
set listchars=tab:>-,trail:-    " display tabs and trailing whitespaces

" Setting netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
let g:netrw_use_errorwindow=0
let g:netrw_list_hide='.*\.swp$,^\..*$,__pycache__'
:noremap <F3> :Vexplore<CR>

if has('gui_running')
    set guifont=Terminus\ 10
    execute pathogen#infect()
endif

