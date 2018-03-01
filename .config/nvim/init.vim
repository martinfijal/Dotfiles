

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/YankRing.vim' " http://github.com/bfredl/nvim-miniyanklug
Plug 'rbgrouleff/bclose.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'

Plug 'troydm/zoomwintab.vim'

" Go
Plug 'fatih/vim-go'
Plug 'jodosha/vim-godebug'
Plug 'zchee/deoplete-go'  " Autocomplete
Plug 'uarun/vim-protobuf'

Plug 'roxma/nvim-completion-manager'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }

" EVALUATING
Plug 'othree/html5.vim'
"Plug 'vimlab/neojs'

" Colorscheme
Plug 'rakr/vim-one'

" Syntax highlight / languages
Plug 'hashivim/vim-terraform'



" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""
""" General
let mapleader=","

set number  " Numbering
set scrolloff=3  " Start scrolling 3 lines from end


" File to ignore for autocomplete, also used by Ctrlp
set wildignore+=*.swp,*.jpg,*.png,*.gif,*.pdf,*.bak,*.tar,*.zip,*.tgz
set wildignore+=*/.hg/*,*/.svn/*,*/.git/*
set wildignore+=*/vendor/cache/*,*/public/system/*,*/tmp/*,*/log/*,*/solr/data/*,*/.DS_Store
set wildignore+=*.pyc,*/vendor/*

" Search
set ignorecase  " searching is case insensitive
set smartcase  " Upper case makes the search case sensitive

set autoindent	" Auto-indent new lines
set expandtab	"" Use spaces instead of tabs
set smartindent	" Enable smart-indent
set smarttab	"" Enable smart-tabs
set shiftwidth=4	"" Number of auto-indent spaces
set tabstop=4
set softtabstop=4	"" Number of spaces per Tab

set updatetime=1000  "" Update time is 1 second


"""""""""""""""""""""""""""""
""" COLOR SCHEME

set background=light
colorscheme wombat256_mod

let g:airline_theme='papercolor'



"""""""""""""""""""""""""""""
""" Plugins

"" ZoomWinTab
map <leader>z :ZoomWinTabToggle<CR>

"" CtrlP
nmap <silent> <tab> :CtrlPBuffer<cr>
let g:ctrlp_map = '<c-space>'


"" ack.vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'

	" Use ag in CtrlP for listing files
	"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


"" airline
" Enable bufferl ist at top
let g:airline#extensions#tabline#enabled = 1


""  deoplete
" Use deoplete.
let g:deoplete#enable_at_startup = 1

"" neovim completion manager
""noremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
""inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

noremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")


"" vim-go

" Use goimports instead of gofmt on file save
let g:go_fmt_command = "goimports"

" Automatically show type information under cursor
let g:go_auto_type_info = 1

autocmd FileType go nmap <Leader>i <Plug>(go-describe)
autocmd FileType go nmap <leader>b  <Plug>(go-build)

"" Go to definition - default vim
" gd
"" Go back from definition - default vim
" ctrl+t
"" Documentation - default vim
" K


"""""""""""""""""""""""""""""
""" Key mappings

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" Save buffer
nmap <leader>w :w!<cr>

" Close buffer
nmap <leader>bd :Bclose<cr>

" Close quick fix list
map <leader>q :ccl<CR><CR>

" Fix common mistakes
command Wq wq
command WQ wq
command W write


" TESTS ----------------
" Switch between last two buffers
nnoremap <leader><leader> <C-^>


"""""""""""""""""""""""""""""
""" File type specific settings

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Git commit
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal nocursorline sp spell




"""--------""""""-------
""" TESTS

" auto reload files when changed on disk
set autoread

" switch to relative numbers in normal mode
"autocmd BufLeave * :set norelativenumber
"autocmd BufEnter * :set relativenumber
"autocmd InsertEnter * :set norelativenumber
"autocmd InsertLeave * :set relativenumber

" Move between splits
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"
"tnoremap <C-h> <C-\><C-n><C-w>h
"tnoremap <C-j> <C-\><C-n><C-w>j
"tnoremap <C-k> <C-\><C-n><C-w>k
"tnoremap <C-l> <C-\><C-n><C-w>l


tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l


" Potential bug fix - https://github.com/neovim/neovim/issues/5990
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
