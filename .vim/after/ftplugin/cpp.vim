"==================Make========================="
autocmd FileType cpp setlocal makeprg=g++\ -g\ -std=c++11\ -O2\ -Wall\ %\ -o\ %<

" Set path for browsing header files with gf command
let &path.="src/include,/usr/local/include,/usr/include"
