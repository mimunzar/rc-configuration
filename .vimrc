set nu			    " set line numbering
set syntax=on		" set syntax highlighting
colorscheme zenburn	" set color scheme

set tabstop=4		" existing tabs have width of 4 spaces
set shiftwidth=4	" indenting with '<' or '>' will use 4 spaces
set expandtab		" pressing tab will insert spaces

filetype on		    " enable filetype detection
filetype indent on	" enable loading of indent files
filetype plugin on	" enable loading of plugin files

if has('gui_running')
    set guifont=Terminus\ 10
endif
