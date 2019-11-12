
set nu                  " set line numbering
set syntax=on           " set syntax highlighting
colorscheme zenburn     " set color scheme

set tabstop=4           " existing tabs have width of 4 spaces
set shiftwidth=4        " indenting with '<' or '>' will use 4 spaces
set expandtab           " pressing tab will insert spaces

filetype on             " enable filetype detection
filetype indent on      " enable loading of indent files
filetype plugin on      " enable loading of plugin files

ru macros/justify.vim  " adds '_j' command for text justification

" Highliting trailing whitespaces
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+\%#\@<!$/
:autocmd InsertLeave * redraw!

" Setting Vexplore
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_use_errorwindow = 0
let g:netrw_list_hide= '.*\.swp$,^\..*$,__pycache__'

if has('gui_running')
    set guifont=Terminus\ 10
    execute pathogen#infect()
endif

