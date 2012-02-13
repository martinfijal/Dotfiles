""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM settings collected from many sources during the last couple of years.
""

" Pathogen
call pathogen#infect()

" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

""-----------------------------------------------
""    General
""-----------------------------------------------
set encoding=utf-8

let mapleader=","
let g:mapleader=","
set nocompatible                     " VIM ftw
set hidden                           " Hidden so we can change without saving
set history=100

" Fix tab completion
set wildmenu
set wildmode=list:longest
set wildignore=*.dll,*.o,*.pyc,*.pyo,*.exe,*.bak,*.jpg,*.gif,*.png
set wildignore+=.git/*,.hg/*,.svn/*
set wildignore+=application/cache/**,application/logs/**

set title                            " Show title in terminal
set timeoutlen=500                   " Timeout for command combinations
set laststatus=2                     " Always show status line
set statusline=%t\ %m%r%h%w\ %y\ %{&ff};\ [%c,%l]\ A=\%03.3b\ H=\%02.2B

" Get rid of error s
set novisualbell
set noerrorbells
set t_vb=

set showmode                         " Show current mode
set showmatch                        " Show matching brace/etc
set cursorline                       " Show cursor line
set number							 " Show line numbers

set modeline                         " Modelines are cool
set modelines=4

set ruler                            " Show current position

set report=0                         " Always report changed lines

" Config backspace
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set showcmd                          " Show partial commands

set nowrap                           " Wrapping is not cool

set nostartofline                    " Preserve col when repositioning cursor

""-----------------------------------------------
""    Indenting
""-----------------------------------------------
set expandtab                      " Tabs instead of spaces

" 4 columns indent
set softtabstop=4
set shiftwidth=4
set tabstop=4

"set smarttab

set autoindent
"set smartindent " not sure I want this
"set shiftround                     " Round indent to multiple of 'shiftwidth'

""-----------------------------------------------
""    Searching and scrolling
""-----------------------------------------------
set ignorecase
set smartcase                        " Case-insensitive in case upper-case
set hlsearch                         " Highlight search
set incsearch                        " Incremental search

set scrolloff=3                      " Lines above or below cursor
set scrolljump=5

""-----------------------------------------------
""   UI/GUI
""-----------------------------------------------
syntax on
set t_Co=256
set background=dark

if has ('gui_running')
	"set lines=75
	"set columns=75
	set guioptions-=T
	set guioptions-=r
	set guioptions-=l
	set guioptions-=L

	colorscheme wombat_mod
else
	colorscheme wombat256_mod
    

    " Close all open buffers
    command Closeall call CloseAllBuffers()                                         
    function! CloseAllBuffers()
        for b in range(0, bufnr('$'))
            exe 'q!'
        endfor
    endfun 
end

if has('gui_macvim')
	set transparency=0
end

if &diff
	" TODO: should prolly not be here
	vnoremap < :diffget<CR>
	vnoremap > :diffput<CR>

	if has('gui_running')
		colorscheme wombat_mod
	else
		colorscheme wombat256_mod
	end
else
	" TODO: should prolly not be here
	" Keeps the visual block selected after indent/unindent
	vnoremap < <gv
	vnoremap > >gv
endif

""-----------------------------------------------
""    Backups
""-----------------------------------------------
set nobackup
set nowb
set noswapfile

""-----------------------------------------------
""    Mappings
""-----------------------------------------------

" Experiment escape
imap jj <esc>

" Remove ex-mode
map Q <nop>

" Close all open buffer.
nmap QQ :call CloseAllBuffers()<cr>

" Fast save
nmap <leader>w :w!<cr>

" Close the current buffer
map <leader>bd :Bclose<CR>
map <F4> :Bclose<CR> 

" Toggle past mode
map <silent> <leader>p :set paste!<cr>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Keys for vimdiff                                                              
map <leader>n ]c
map <leader>b [c

" NERDTree
map <leader>nt :NERDTreeToggle<CR>

" w!!! saved file using sudo
cmap w!!! w !sudo tee % >/dev/null

" Move between windows
map <silent> <C-h> <C-W>h
map <silent> <C-j> <C-W>j
map <silent> <C-k> <C-W>k
map <silent> <C-l> <C-W>l

" Resize windows
nmap <silent> <S-Left> <C-w><
map <silent> <C-Up> <C-W>-
map <silent> <C-Down> <C-W>+
nmap <silent> <S-Right> <C-w>>

" Make
nmap <leader>m :make<CR>

""-----------------------------------------------
""   Plugin setup
""-----------------------------------------------


""""""""""""""""
"" Ack
map <Leader>g :Ack! 


""""""""""""""""
"" Ctrlp.vim
let g:ctrlp_map = '<Leader>l'
let g:ctrlp_working_path_mode = 0
"nmap <silent> <Leader>-l C-l

"""""""""""""""""
"" qbuf.vim
" TODO fix
let g:qb_hotkey = "<f12>"
nmap <tab> <f12>

"""""""""""""""""
"" Bufexplorer
"let g:bufExplorerShowRelativePath=1
"map <leader>o :BufExplorer<CR>

"let MRU_Max_Entries = 100
"map <leader>o :MRU<CR>

"""""""""""""""""
"" Tabbar.vim
"let g:Tb_MaxSize=0 " Auto resize
"let g:Tb_ModSelTarget = 1

"""""""""""""""""
"" Python
let python_highlight_all = 1

"""""""""""""""""
"" Zencoding
let g:user_zen_settings = {
	\  'php':{
	\    'aliases':{
	\    },
	\    'snippets':{
	\      'req':"require_once '';",
	\      'inc':"include_once '';",
	\      'thr':"throw new Exception();\n",
	\    }
	\  }
	\}
let g:user_zen_expandabbr_key = '<c-e>'
let g:user_zen_complete_tag = 1

"""""""""""""""""
"" SuperTab
"let g:SuperTabDefaultCompletionType = "context"


"""""""""""""""""
"" EasyMotion
"let g:EasyMotion_mapping_e = '<Leader>m'
let g:EasyMotion_leader_key = '<Leader>m'


"""""""""""""""""
"" TagList
"nnoremap <silent> <F8> :TlistToggle<CR>
"" Close all folds except current file
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Use_Right_Window = 1
""let Tlist_Compact_Format = 1
"" show the prototype
"let Tlist_Display_Prototype = 1
"
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Close_On_Select = 1
"" PHP flags
"let tlist_php_settings = 'php;c:class;f:function;d:constant'
"" show tags only for current buffer
"let Tlist_Show_One_File = 1


"""""""""""""""""
"" TagBar
nmap <leader>y :TagbarToggle<CR> 


"""""""""""""""""
"" Gitv
"The commit browser width and height is automatically sized to best fit the
"content in all modes and settings.
let g:Gitv_OpenHorizontal = 1


""-----------------------------------------------
""   ..
""-----------------------------------------------

""-----------------------------------------------
""    Autocommand and Commands
""-----------------------------------------------

" Python
au FileType python setlocal nocindent nosmartindent tw=80 ts=4 sw=4 colorcolumn=80
au FileType python syn keyword pythonDecorator True None False self
au FileType python map <buffer> <F5> <ESC>:w<CR>:!python %<CR>

" Extra PHP file types
autocmd BufNewFile,BufRead *.inc setlocal ft=php
autocmd BufNewFile,BufRead *.phtml setlocal ft=php
autocmd BufNewFile,BufRead *.module setlocal ft=php

" Apache files on Ubuntu and Red Hat
autocmd BufNewFile,BufRead /etc/apache2/*,/etc/httpd/* setlocal ft=apache
" nginx
autocmd BufNewFile,BufRead */etc/nginx/* setlocal ft=nginx

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" SVN commit
autocmd BufNewFile,BufRead svn-commit.tmp setlocal ft=svn nocursorline spell

"Git commit
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal nocursorline spell


"""""
" Folding
" <space> toggles folds opened and closed
nnoremap <space> za

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf


" Fix my very common mistakes
command W write
command Q quit
command Wq wq
command WQ wq


command TWO call TwoSpaceSettings()
function! TwoSpaceSettings()
	setlocal expandtab
	setlocal softtabstop=2
	setlocal shiftwidth=2
endfun


" My own dev verison of ctags
"let g:tagbar_ctags_bin="/Users/duke/Development/c/ctags/dctags"
