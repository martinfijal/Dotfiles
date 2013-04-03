""""""""""""""""""""""""""""""""""""""""""""""""
" VIM config using vundle for package managment
""

"" General ------------------------------------------- {{{

set encoding=utf-8
set nocompatible
filetype plugin indent on

let mapleader=","
let g:mapleader=","
" }}}
"" Text and indenting -------------------------------- {{{
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
" }}}
"" Wild ignore ------------------------------------ {{{
" Turn and config wild menu
set wildmenu
set wildmode=longest,full        " Stop at longest unique prefix
set wildignore=*.o,*.pyc
set wildignore+=.git/*,.hg/*,.svn/*
" Work files
set wildignore+=application/cache/**,application/logs/**,application/vendor/**
" }}}
"" Interface ----------------------------------- {{{

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

" No highlighting for long lines
set synmaxcol=500

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

" }}}
"" GUI/CLI settings ---------------------------------- {{{
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

" }}}
"" Backups ----------------------------------------- {{{
set nobackup
set nowb
set noswapfile

" }}}
"" Plugins --------------------------------------------- {{{

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
""Bundle 'chrismetcalf/vim-yankring'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'skwp/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'tmhedberg/matchit'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'

Bundle 'vim-scripts/bufkill.vim'

filetype plugin indent on

" }}}
"" Plugin settings ------------------------------------------- {{{

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

"" }}}
"" Plugin keyboard mappings ------------------------------------- {{{

"" Ack.vim
map <leader>g :Ack!

"" CtrlP
nmap <silent> <tab> :CtrlPBuffer<cr>
let g:ctrlp_map = '<c-t>'

"" }}}
"" Autocommand and Commands -------------------------------------- {{{

" Python {{{
augroup ft_python
    au!
    au filetype python setlocal nocindent nosmartindent tw=80 ts=4 sw=4
    au filetype python syn keyword pythondecorator true none false self
    au filetype python map <buffer> <f5> <esc>:w<cr>:!python %<cr>

    if has('colorcolumn')
        au filetype python setlocal colorcolumn=80
    endif
augroup END
" }}}
" Vim {{{
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
augroup END
" }}}

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

" }}}
"" Keyboard mappings ------------------------------------ {{{

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
cnoremap w!!! w !sudo tee % >/dev/null

" Quit
nnoremap <leader>qq :call CloseAllBuffers()<cr>

" Folding with space
nnoremap <Space> za
vnoremap <Space> za

" Fix my very common mistakes
command W write
command Q call CloseAllBuffers()
command Wq wq
command WQ wq

" Move between windows
noremap <silent> <C-h> <C-W>h
noremap <silent> <C-j> <C-W>j
noremap <silent> <C-k> <C-W>k
noremap <silent> <C-l> <C-W>l

" Move in buffers
noremap H ^
noremap L $
vnoremap L g_

" Bash-like ctrl-a/e
inoremap <C-a> <esc>I
inoremap <C-e> <esc>A
noremap <C-a> ^
noremap <C-e> $

" Open quickfix window for last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" Source
vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Resize windows
noremap <silent> <C-Left> <C-w><
noremap <silent> <C-Up> <C-W>-
noremap <silent> <C-Down> <C-W>+
noremap <silent> <C-Right> <C-w>>

" }}}
"" Quick editing ----------------------------- {{{

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eb :vsplit ~/.bashrc<cr>
" }}}


"" Misc --------------------------------- {{{
" Close all open buffers
command Closeall call CloseAllBuffers()                                         
function! CloseAllBuffers()
    for b in range(0, bufnr('$'))
        exe 'q!'
    endfor
endfun 
" }}}



" Patched fonts on Mac
if has('gui_macvim')
    let g:Powerline_symbols = 'fancy'
end
