"=============================Plugins=================================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'skwp/greplace.vim'
Plug 'majutsushi/tagbar'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Seoul colorscheme
Plug 'junegunn/seoul256.vim'

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'edkolev/tmuxline.vim'

" Plug 'vim-syntastic/syntastic'
" Plug 'Valloric/YouCompleteMe'


" Initialize plugin system
call plug#end()

"=============================Generals================================  
set encoding=utf-8 

"Split Management
set splitbelow
set splitright

"Search
set hlsearch
set incsearch
"==============================Visual================================  
syntax enable 
" autocompletion menu turn on
set wildmenu

"==============================Abbreviate============================  
"Shortcut for main in Python
abbreviate ifm if __name__ == "__main__":

"=============================Mappings================================
let mapleader=","
noremap <Leader>ev :e $MYVIMRC<cr>

"Make it easy to edit the Vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr> 
nmap <Leader><space> :nohlsearch<cr>

" Make it easy to write buffer
inoremap <Leader>s <esc>:w<cr>
noremap <Leader>s <esc>:w<cr>

" Make it easy to open NERDTree
noremap <Leader>t :NERDTreeToggle<cr>

" Make it shorter to switch between windows
map <C-j> <C-w><C-j>
map <C-k> <C-w><C-k>
map <C-h> <C-w><C-h>
map <C-l> <C-w><C-l>

"Set map to :tag
nmap <leader>ft :tag<space>

"Set map to search word under current cursor
nnoremap <Leader>ff /\<<C-r><C-w>\><cr>
"Set map to replace word under current cursor
nnoremap <Leader>fs :%s/\<<C-r><C-w>\>/
nnoremap <Leader>fg :%s/\<<C-r><C-w>\>//g<Left><Left>

"Set map to comments in python
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

"Set map to quickly add ipdb break_point
nmap <Leader>k mmOimport ipdb; ipdb.set_trace():w`m
imap <Leader>k <esc>mmOimport ipdb; ipdb.set_trace():w`m

"Set map to python nosetest
nmap <leader>n :!nosetests %<cr>
"Set map to python doctest
nmap <leader>ds :!python3 -m doctest %<cr>
"Set map to python ipdb
nmap <leader>db :!python3 -m ipdb %<cr>

"Set map to paste current date in jekyll posts
nnoremap <leader>dt "=strftime('%Y-%m-%d %H:%M:%S %z')<CR>P
inoremap <leader>dt <C-R>=strftime('%Y-%m-%d %H:%M:%S %z')<CR>

" Shortcut for toggle tagbar
nnoremap <leader>b :TagbarToggle<CR>

"=============================Visuals=================================
colorscheme seoul256

" Highlight column number 110 with color
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

"=============================Auto-commands===========================
"Automatically source the Vimrc file on save."

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
"=============================Plugin setting==========================
" CtrlP
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" NERDTree
let NERDTreeHijackNetrw = 0

" Smart case for Ack
cnoreabbrev ack Ack

" greplace.vim
set grepprg=ack             "Use Ack for the search."
let g:grep_cmd_opts = '--noheading'

" Setting for /iamcco/markdown-preview.vim
let g:mkdp_path_to_chrome="google-chrome"
let g:mkdp_auto_close=0

" Add markdown support for tagbar
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

" Let tagbar open in the right with 30 width
let g:tagbar_width = 30
let g:tagbar_left = 0

" fzf vim plugin config
set rtp+=~/.fzf

" Setting nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Setting YCM
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"=============================Config CPP==============================
" Indentation rule
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Custom make arguments
set makeprg=make\ -C\ build\ -j9
command Smake silent make
nnoremap <F5> :make<cr>

" Set path for browsing header files with gf command
let &path.="src/include,/usr/local/include,/usr/include"

" Setting Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

