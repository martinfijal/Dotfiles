""""""""""""""""""""""""""""""""""""""""""""""""
" VIM config using vundle for package managment
""


""---------------------------------------------------------
"" General
""---------------------------------------------------------

set encoding=utf-8
set nocompatible
filetype plugin indent on

let mapleader=","
let g:mapleader=","

""---------------------------------------------------------
"" Text and indenting
""---------------------------------------------------------
set expandtab                      " Space instead of tabs

" Smart tab usage
set smarttab

" 4 column indenting
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Auto indent
set autoindent
" Smart indent
set smartindent
" No word wrap
set nowrap

""---------------------------------------------------------
"" Interface
""---------------------------------------------------------

" Allow switching buffer without saving
set hidden

"----------
" Searching
"----------
set ignorecase                   " Ignore case when searching
set smartcase                    " Capitals in search makes in case sensitive
set hlsearch                     " Highlight search
set incsearch                    " Incremental search

" Scrolling
set scrolloff=3                  " Lines above of below when scroll start
set scrolljump=5                 " Chars left and right before scroll start

" Turn and config wild menu
set wildmenu
set wildmode=longest,full        " Stop at longest unique prefix
set wildignore=*.o,*.pyc
set wildignore+=.git/*,.hg/*,.svn/*
" Work files
set wildignore+=application/cache/**,application/logs/**,application/vendor/**

" Ruler
set ruler
set number							 " Show line numbers

" Title in terminal
set title

" Modeline
set modeline
set modelines=3

" Always show status line
set laststatus=2
set statusline=%t\ %m%r%h%w\ %y\ %{&ff};\ [%c,%l]\ A=\%03.3b\ H=\%02.2B

" Remove rid of errors
set noerrorbells
set novisualbell
set t_vb=

" Config backspace
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set timeoutlen=500                   " Timeout for command combinations
set showcmd                          " Show partial commands
set showmode                         " Show current mode
set showmatch                        " Show matching brace/etc
set cursorline                       " Show cursor line

" Do not redraw when running macros
set lazyredraw

set nostartofline                    " Preserve col when repositioning cursor

""---------------------------------------------------------
"" GUI/CLI settings
""---------------------------------------------------------
syntax on
set t_Co=256
set background=dark

if has('gui_running')
	set guioptions-=T
	set guioptions-=r
	set guioptions-=l
	set guioptions-=L

	colorscheme wombat_mod
else
	colorscheme wombat256_mod
end

if has('gui_macvim')
	set transparency=0
end

if &diff
	vnoremap < :diffget<CR>
	vnoremap > :diffput<CR>

	if has('gui_running')
		colorscheme wombat_mod
	else
		colorscheme wombat256_mod
	end
else
	vnoremap < <gv
	vnoremap > >gv
endif

""-----------------------------------------------
""    Backups
""-----------------------------------------------
set nobackup
set nowb
set noswapfile

""---------------------------------------------------------
"" Plugins
""---------------------------------------------------------

" Start vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Bundle 'gmarik/vundle'

" Github
""""""""
Bundle 'tpope/vim-fugitive'
Bundle 'wincent/Command-T'
Bundle 'mileszs/ack.vim'
Bundle 'gregsexton/gitv'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'tmhedberg/matchit'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'

Bundle 'vim-scripts/bufkill.vim'

filetype plugin indent on


""---------------------------------------------------------
"" Plugin settings
""---------------------------------------------------------

"" CtrlP
let g:ctrlp_working_path_mode = 0             " Do not change PWD

"" Gitv
"The commit browser width and height is automatically sized to best fit the
"content in all modes and settings.
let g:Gitv_OpenHorizontal = 1

"" Python
let python_highlight_all = 1

"" Powerline
let g:Powerline_stl_path_style = 'short'


"----------------
" Plugin keyboard mappings
"----------------

"" Ack.vim
map <leader>g :Ack!

"" CtrlP
nmap <silent> <tab> :CtrlPBuffer<cr>
let g:ctrlp_map = '<c-t>'


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


" Close all open buffers
command Closeall call CloseAllBuffers()                                         
function! CloseAllBuffers()
    for b in range(0, bufnr('$'))
        exe 'q!'
    endfor
endfun 

""---------------------------------------------------------
"" Keyboard mappings
""---------------------------------------------------------

" Escape insert mode
imap <silent> jj <esc> 

" Remove ex-mode
map Q <nop>

" Fast save
nmap <leader>w :w!<cr>
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
" Fast close
nmap <leader>bd :Bclose<cr>

" Toggle past mode
map <silent> <leader>p :set paste!<cr>

" w!!! saved file using sudo
cmap w!!! w !sudo tee % >/dev/null

" Quit
nmap <leader>qq :call CloseAllBuffers()<cr>


" Fix my very common mistakes
command W write
command Q call CloseAllBuffers()
command Wq wq
command WQ wq

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
