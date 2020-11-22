source ~/.zsh/vim/util.vim

" search for current visual selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" grepper plugin
call SetupCommandAlias("grep", "GrepperGrep")

let g:grepper       = {}
let g:grepper.tools = ['git', 'grep']

" Define Grepper operator that takes motion or current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)


