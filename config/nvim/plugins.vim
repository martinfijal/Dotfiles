
call plug#begin('~/.config/nvim/plugged')


" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'


" Only when running inside VSCode
if exists('g:vscode')
else
  " ALL OTHER NVIM
  " Colors
  Plug 'joshdick/onedark.vim'
  Plug 'davidosomething/vim-colors-meh'
  Plug 'gryf/wombat256grf'
  Plug 'romgrk/doom-one.vim'

  " Fuzzy finding
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'

  " Telescope
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " LSP and Auto-complete
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'

  " Format code
  Plug 'sbdchd/neoformat'

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

  " Window/buffer stuffs
  Plug 'rbgrouleff/bclose.vim'


  Plug 'ntpeters/vim-better-whitespace'

endif

call plug#end()
