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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'skwp/greplace.vim'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'benmills/vimux'
Plug 'jgdavey/tslime.vim'
Plug 'jpalardy/vim-slime'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tweekmonster/braceless.vim'
Plug 'w0rp/ale'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

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

"line number
" set number
" set relativenumber

filetype plugin indent on

set pastetoggle=<F3>
"==============================Visual================================  
syntax enable 
" autocompletion menu turn on
set wildmenu
" tmuxline.vim theme
let g:tmuxline_theme = 'molokai'
" airline theme
let g:airline_theme='molokai'

colorscheme atom-dark-256

" Highlight column number 110 with color
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

" Underline for currentline
set cursorline
autocmd WinLeave * se nocul  " 用浅色高亮当前行
autocmd WinEnter * se cul    " 用浅色高亮当前行
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

"==============================Abbreviate============================  
"Shortcut for main in Python
abbreviate ifm if __name__ == "__main__":

"=============================Mappings================================
let mapleader=","
noremap <Leader>ev :e $MYVIMRC<cr>

" Set map to toggle ALE
nmap <Leader>ae :ALEToggle<cr>
" Default turn off ALE
let g:ale_enabled=0

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

"Set map to python doctest
nmap <leader>ds :!python3 -m doctest %<cr>
"Set map to python ipdb
nmap <leader>db :!python3 -m ipdb %<cr>

"Set map to paste current date in jekyll posts
nnoremap <leader>dt "=strftime('%Y-%m-%d %H:%M:%S %z')<CR>P
inoremap <leader>dt <C-R>=strftime('%Y-%m-%d %H:%M:%S %z')<CR>

" Shortcut for toggle tagbar
nnoremap <leader>b :TagbarToggle<CR>

" Transform py2 print to py2 print
nmap <leader>3 :%s/\(print\) \(.*$\)/\1(\2)/gc
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

" tmuxline seperator
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
" tmuxline status line format
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I:#W#F',
      \'cwin' : '#I:#W#F',
      \'y'    : ['%Y-%m-%d', '%R'],
      \'z'    : '#H'}

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" jedi use tab for autocompletion
let g:SuperTabDefaultCompletionType = "context"

" jedi configuration
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "0"
let g:jedi#goto_command = "<leader>gt"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#usages_command = "<leader>gu"
let g:jedi#rename_command = "<leader>gr"

" tslime.vim
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
" vmap <Leader>vs <Plug>SendSelectionToTmux
nmap <Leader>vs <Plug>NormalModeSendToTmux
nmap <Leader>vg <Plug>SetTmuxVars
nmap <Leader>vc :Tmux echo hello<cr>

" vim-slime
" Now, use comma vs to send selected region or single line to pane 0.1
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
xmap <Leader>vs <Plug>SlimeRegionSend
nmap <Leader>vp <Plug>SlimeParagraphSend
nmap <Leader>vr <Plug>SlimeConfig
let g:slime_python_ipython = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1

" Use Braceless
autocmd FileType python BracelessEnable +indent

" vim-easy-align config                                                                             
" Start interactive EasyAlign in visual mode (e.g. vipga)                                           
xmap ga <Plug>(EasyAlign)                                                                           
" Start interactive EasyAlign for a motion/text object (e.g. gaip)                                  
nmap ga <Plug>(EasyAlign) 

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

"=============================Config CPP==============================
" Custom make arguments
set makeprg=make\ -C\ build\ -j9
nnoremap <F5> :make<cr>
" command Smake silent make

" Set path for browsing header files with gf command
let &path.="src/include,/usr/local/include,/usr/include"
