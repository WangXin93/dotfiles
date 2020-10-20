" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle')

" Make sure you use single quotes

" let Vundle manage Vundle, required
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'skwp/greplace.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'majutsushi/tagbar'
"Bundle 'xuhdev/vim-latex-live-preview'
" Plug 'lervag/vimtex'
" Plug 'lyokha/vim-xkbswitch'
" Plug 'tweekmonster/braceless.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
" Plug 'dbeniamine/cheat.sh-vim'
" Plugin 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Chiel92/vim-autoformat'
" Plug 'ervandew/supertab'
Plug 'jpalardy/vim-slime'
Plug 'heavenshell/vim-pydocstring'
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'mattn/emmet-vim'
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi'
Plug 'francoiscabrol/ranger.vim'
Plug 'vim/killersheep'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'danilamihailov/vim-tips-wiki'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'skywind3000/vim-quickui'
Plug 'voldikss/vim-floaterm'
" Plug 'gilligan/vim-lldb'
" Plug 'vim-scripts/Conque-GDB'

" Initialize plugin system
call plug#end()
