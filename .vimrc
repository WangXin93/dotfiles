"=============================Plugins=================================
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Real time syntax checking
Plug 'vim-syntastic/syntastic'

Plug 'Valloric/YouCompleteMe'

" Seoul colorscheme
Plug 'junegunn/seoul256.vim'

" Initialize plugin system
call plug#end()

"=============================Mappings================================
let mapleader=","
noremap <Leader>ev :e $MYVIMRC<cr>

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

"=============================Visuals=================================
colorscheme seoul256
let g:airline_theme='molokai'

" Highlight column number 110 with color
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

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

" Setting YCM
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
