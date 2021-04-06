
call plug#begin('~/.config/nvim/plugged')


" Auto pairs for '(' '[' '{' 
Plug 'jiangmiao/auto-pairs'


" Only when running inside VSCode
if exists('g:vscode')
else
  " ALL OTHER NVIM
  " Colors
  Plug 'joshdick/onedark.vim'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'

  " Auto complete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Statusline and bufferline
  Plug 'itchyny/lightline.vim'
  Plug 'ap/vim-buftabline'

  " Tmux integration
  Plug 'christoomey/vim-tmux-navigator'

  " Git
  Plug 'tpope/vim-fugitive'

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " File Explorer
  Plug 'scrooloose/NERDTree'
  
  " Movement
  Plug 'justinmk/vim-sneak'

endif


call plug#end()
