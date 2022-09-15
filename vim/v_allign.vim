" [Va] Vertically Aligns Selection
"
" Defines command Va which vertically aligns  selected  text  by  last  search
" pattern (content  of  '/'  register).   Handy  for  organizing  imports  and
" definitions.
"
" foo = 42
" foobar = 42
" >
" foo    = 42
" foobar = 42

func! s:prepend_space(n, s) abort
  return repeat(' ', a:n) .. a:s
endfunc

func! s:align_text(word, line_it) abort
  func! s:align_line(line, n) abort closure
    let printable = substitute(a:word, '\\.', '', 'g')
    let new_line  = substitute(a:line,
          \ a:word, s:prepend_space(a:n, printable), '')
    return new_line
  endfunc
  let idx_it      = map(copy(a:line_it), {_, v -> match(v, a:word)})
  let max_idx     = max(idx_it)
  let new_line_it = map(idx_it,
        \ {i, v -> s:align_line(a:line_it[i], max_idx - v)})
  return new_line_it
endfunc

func! s:main(f_line, l_line, word) abort range
  let line_it     = map(range(a:f_line, a:l_line), {_, v -> getline(v)})
  let new_line_it = s:align_text(a:word, line_it)
  call setline(a:f_line, new_line_it)
endfunc

command! -range Va call s:main(<line1>, <line2>, getreg('/'))

" Tests
func! s:test_prepend_space() abort
  call assert_equal(s:prepend_space(-1, 'foo'), 'foo')
  call assert_equal(s:prepend_space(0,  'foo'), 'foo')
  call assert_equal(s:prepend_space(1,  'foo'), ' foo')
endfunc

func! s:test_align_text() abort
  call assert_equal(s:align_text('\<as\>', [
        \ 'as bar',
        \ ' as bar',
        \ '',
        \ 'fas as bar',
        \ ]), [
        \ '    as bar',
        \ '    as bar',
        \ '',
        \ 'fas as bar',
        \ ])
  call assert_equal(s:align_text('\V=', [
        \ 'foo = 42',
        \ 'foobar = 42',
        \ '= 42',
        \ ]), [
        \ 'foo    = 42',
        \ 'foobar = 42',
        \ '       = 42',
        \ ])
  echo assert_equal(s:align_text(':', [
        \ 'foo : 42',
        \ 'foobar : 42',
        \ ': 42',
        \ ]), [
        \ 'foo    : 42',
        \ 'foobar : 42',
        \ '       : 42',
        \ ])
endfunc

func! s:main_test() abort
  let v:errors = []
  call s:test_prepend_space()
  call s:test_align_text()
  for e in v:errors
    echoerr e
  endfor
endfunc

