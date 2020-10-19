" ~/.vim/pluginsVimPlug.vim   <== Plugins can be found here, use `gf` to edit it!.

"==================Plugins======================"
set nocompatible                             " be iMproved, required"

so ~/.vim/pluginsVimPlug.vim

"==================Generals====================="

" let g:python3_host_prog = '/usr/local/bin/python3'

set encoding=utf-8 

set clipboard=unnamed                       " Want paste to/from other app"

set backspace=indent,eol,start              " Make backspace like every other editor"

let mapleader = ','                         " The default leader is \, but a comma is better"

" autocompletion menu turn on
set wildmenu

" Toggle auto-indenting for code paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"Split Management
set splitbelow
set splitright

"Search
set hlsearch
set incsearch

" Use mouse in xterm, use ``set mouse=`` to cancel
set mouse=a

filetype plugin indent on

"==================Folding======================"
"Enable folding"
set foldmethod=indent
set foldlevel=99

"Enable folding with the spacebar"
nmap <space> za

"==================Visuals======================"

syntax enable 

" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽

let python_highlight_all=1

colorscheme atom-dark-256
highlight LineNr ctermbg=bg

" airline theme
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"We'll fake a custom left padding for each window."
" set foldcolumn=2
" highlight foldcolumn ctermbg=bg

" Highlight column number 110 with color
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

"Get rid of ugly split borders"
hi vertsplit ctermfg=bg ctermbg=bg

" clear vim gutter (the left most column) color
" highlight clear SignColumn
highlight SignColumn ctermbg=bg guibg=bg

" Underline for currentline
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline
autocmd WinLeave * se nocul 
autocmd WinEnter * se cul | hi clear CursorLine | hi CursorLine gui=underline cterm=underline

"Turn off error bell"
set noerrorbells visualbell t_vb=

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"==================Indent======================="
""自动缩进 
"set autoindent
""类似C语言风格的缩进 
"set cindent
""智能缩进:每一行都和前一行有相同的缩进量, 
""同时这种缩进形式能正确的识别出花括号,当遇到右花括号（}）,
""则取消缩进形式。此外还增加了识别C语言关键字的功能。
""如果一行是以#开头的(比如宏)，那么这种格式将会被特殊对待而不采用缩进格式
"set smartindent
""把输入的tab自动转换成空格，Python用户必用~ 
"set expandtab
""一个tab键占据4个空格 
"set tabstop=4
""一开始,插入的就是4个空格,此时一旦你再按下一次tab,这次的四个空格就会和上次的四个空格组合起来变成一个制表符 
"set softtabstop=4
""每一级自动缩进的空格数 
"set shiftwidth=4
""根据文件类型设定缩进,覆盖掉默认的~
augroup FileTypeIndent
    au!
    autocmd FileType scheme,sql,cpp,c setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8 autoindent
    autocmd FileType vim,html,scss,css,javascript,yml,java setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8 autoindent
    autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
augroup END

"==================Make========================="
autocmd FileType cpp setlocal makeprg=g++\ %

" Set path for browsing header files with gf command
let &path.="src/include,/usr/local/include,/usr/include"

"=====================Mappings=================="
"Make it easy to edit the Vimrc file"
nnoremap <Leader>ev :tabedit $MYVIMRC<cr> 

" Toggle highlighting of search
nmap <Leader><space> :set hlsearch!<cr>

"Make it easy to Add blank line"
nnoremap<C-J> mmo<esc>`m
nnoremap<C-K> mmO<esc>`m<C-E>
"Make it easy to switch between windows"
nnoremap<C-H> <C-W><C-H>
nnoremap<C-L> <C-W><C-L>

" Make it easy to open NERDTree
noremap <Leader>t :NERDTreeToggle<cr>
let g:NERDTreeNodeDelimiter = "\u00a0" " scrooloose/nerdtree/issues/928

"Set F12 to preview LaTex file"
nnoremap <F12> :LLPStartPreview<cr>

"Set map to search word under current cursor
nnoremap <Leader>ff /\<<C-r><C-w>\><cr>
"Set map to replace word under current cursor
" nnoremap <Leader>fs :%s/\<<C-r><C-w>\>/
" nnoremap <Leader>fg :%s/\<<C-r><C-w>\>//g<Left><Left>

" Set map to comments for different language
autocmd FileType python vnoremap <silent> # :s/^/# /<cr>:noh<cr>
autocmd FileType python vnoremap <silent> -# :s/^# //<cr>:noh<cr>
autocmd FileType javascript vnoremap <silent> # :s@^@// @<cr>:noh<cr>
autocmd FileType javascript vnoremap <silent> -# :s@^// @@<cr>:noh<cr>

"Set map to paste current date in jekyll posts
nnoremap <leader>dt "=strftime('%Y-%m-%d %H:%M:%S %z')<CR>P
inoremap <leader>dt <C-R>=strftime('%Y-%m-%d %H:%M:%S %z')<CR>

" Quick add arguments in __init__() into funtion body
nnoremap <leader>in mmyiw]Moself." = "`m

" Operator-pending mappings
" Find next email
onoremap in@ :<c-u>execute "normal! /\\S\\+@\\S\\+\r:nohlsearch\rvf@f.ww"<cr>
" Find next parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi)<cr>
" Find heading of this paragraph in markdown
aug OmapMarkdownHeading
    au FileType markdown onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    au FileType markdown onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
aug END

" Vim table mode
nnoremap <leader>tm :TableModeToggle<CR>

" Shortcut for toggle tagbar
nnoremap <leader>b :TagbarToggle<CR>

" Transform py2 print to py2 print
nmap <leader>3 :%s/\(print\) \(.*$\)/\1(\2)/gc

"===================abbreviate=================="
"shortcut for main in python
" abbreviate ifm if __name__ == "__main__": 

"===================Auto-Commands==============="
"Automatically source the Vimrc file on save."
augroup autosourcing
autocmd!
autocmd BufWritePost .vimrc source %
augroup END

" Automatically reindent html file
" autocmd BufWritePre,BufRead *.html :normal gg=G
" Turn line wrapping off whenever you're working on an HTML file
" autocmd BufNewFile,BufRead *.html setlocal nowrap

" Autoformat sql file
" autocmd BufWritePre,BufRead *.sql :%!sqlformat --reindent --keywords upper --identifiers lower -

"Set map to quickly add ipdb break_point
augroup DebugBreakPointMap
au FileType python nnoremap <Leader>k mmOimport ipdb; ipdb.set_trace()<esc>`m
au FIleType Python inoremap <Leader>k <esc>mmOimport ipdb; ipdb.set_trace()<esc>`m
augroup END

"===================Plugin setting=============="
" Set frequency for LaTex auto update"
autocmd FileType tex setl updatetime=1

" CtrlP
"let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Use NERDTree as split explorer instead of file drawer or prevent it
" http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
let NERDTreeHijackNetrw = 1
" open ranger when vim open a directory
" let g:ranger_replace_netrw = 1

" greplace.vim
set grepprg=ack             "Use Ack for the search."
let g:grep_cmd_opts = '--noheading'

" ack.vim command abbreviation
cnoreabbrev Ack Ack!
cnoreabbrev ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Set fzf for vim
set rtp+=/usr/local/opt/fzf
" Empty value to disable preview window altogether
let g:fzf_preview_window = ''
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

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

" Supertab for jedi.vim
" let g:SuperTabDefaultCompletionType = "context"
" This disable the jedi completion
"let g:jedi#completions_enabled = 0
" jedi disable auto complete import 
"let g:jedi#smart_auto_mappings = 0
" disable some reminder to make jedi quick
" let g:jedi#show_call_signatures = "2"
"use splits when going to a definition
" let g:jedi#use_splits_not_buffers = "winwidth"
" disable auto popup after dot
" let g:jedi#popup_on_dot = 0
" select the first line of completion
" let g:jedi#popup_select_first = 0
" Don't pop `import` after `from`
" let g:jedi#smart_auto_mappings = 0
" jedi actions
" let g:jedi#goto_command = "<leader>gt"
" let g:jedi#goto_assignments_command = "<leader>ga"
" let g:jedi#goto_definitions_command = "<leader>gd"
" let g:jedi#completions_command = "<C-N>"
" let g:jedi#usages_command = "<leader>gu"  " show where the variable are used
" let g:jedi#rename_command = "<leader>gr"  " rename all variable in same name

" vim-slime
" Now, use comma vs to send selected region or single line to pane 0.1
" let g:slime_target = "tmux"
" let g:slime_python_ipython = 1
" let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
" let g:slime_dont_ask_default = 1

" Start braceless
autocmd FileType python,coffee BracelessEnable +indent

" Set map for vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" UltiSnips will first search UltiSnipsSnippetsDir/python.snippets then
" search UltiSnipsSnippetDirectories in runtimepath
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/"

" vim-autoformat setting
" useful commands are: Autoformat, retab, RemoveTrailingSpaces
let g:formatter_yapf_style = 'google'

" vim pydocstring style
let g:pydocstring_formatter = 'google'

" Map for heavenshell/vim-pydocstring
nmap <silent> <C-_> <Plug>(pydocstring)

" Emmet for all mode and only for just html/css
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-M>'

"================ coc.nvim ====================="
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
execute 'h '.expand('<cword>')
else
call CocAction('doHover')
endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" COC translator
" popup
nmap <silent> T <Plug>(coc-translator-p)
vmap <silent> T <Plug>(coc-translator-pv)
" echo
" nmap <Leader>e <Plug>(coc-translator-e)
" nmap <Leader>e <Plug>(coc-translator-ev)
" replace
" nmap <Leader>r <Plug>(coc-translator-r)
" nmap <Leader>r <Plug>(coc-translator-rv)

" COC yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" coc enter detect
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-l> for trigger snippet expand.
imap <c-f> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <c-f> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-f>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-b>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-f> <Plug>(coc-snippets-expand-jump)

"================ Quickly Compile==============="

map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!open %"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'markdown'
        exec "!markdown_py % -f %<.html"
        exec "!open %<.html"
    endif
endfunc

"===================Vim quick ui ==============="
" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

" register HELP menu with weight 10000
call quickui#menu#install('H&elp', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>

"===================Notes and Tips=============="
" <F5> is compile and run
"<F7> is run flake8 check
"<F12> is run latex preview

" Command + motion, here are some useful command, all this combination can be repeated by `.`
" gr replace object with register one
" gc comment text object
" gu switch to lower case
" gU switch to upper case
" g~ switch case of text
" ys' add surrounding ''
" ds' delete surrounding ''
" cs'" change surrounding from '' to ""
" dst delete surrounding html tag

" viP visual select inside block body like clauses in `class`, `def` in Python.
" vaP visual select a entire block.
" vip visual select a paragraph.
" vis visual select a sentenct.
" viw visual select a word.
" vi) visual select content inside a pair of parantheses.
" va) visual select content inside parantheses including parantheses.

" ]m move to next `class`, `def` in Python
" [m move to previous `class, `def` in Python

" <leader>vs send command to tmux pane

" luafile $HOME/.config/nvim/plugins.lua

"===================Command memo ==============="
" Change math surrounding from markdown style to jekyll style
" i.e. $$ \alpha $$ to \\( \alpha \\)
" %s/\$\$\(.\{-}\)\$\$/\\\\( \1 \\\\\)/gc

