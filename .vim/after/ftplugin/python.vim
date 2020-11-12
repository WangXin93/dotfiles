if exists("b:did_ftplugin_after") | finish | endif
let b:did_ftplugin_after = 1

command! -nargs=0 HelloPython call python#Hello()

" set black as formatprg, use gq{motion} to format
setlocal formatprg=black\ --quiet\ -
" augroup black-fmt
"     autocmd!
"     autocmd BufWritePre <buffer> normal gggqG``
" augroup END

" Use :make to see syntax errors. (:cn and :cp to move around,
" setlocal makeprg=python3\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
setlocal makeprg=python3\ %
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Set map to comments for different language
vnoremap <silent> # :s/^/# /<cr>:noh<cr>
vnoremap <silent> -# :s/^# //<cr>:noh<cr>
