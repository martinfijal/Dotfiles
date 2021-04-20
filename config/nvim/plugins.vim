
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

  " Auto-complete
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'glepnir/lspsaga.nvim'

  Plug 'liuchengxu/vim-which-key'

  " Statusline and bufferline
  Plug 'itchyny/lightline.vim'
  Plug 'ap/vim-buftabline'
  Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}

  " Tmux integration
  Plug 'christoomey/vim-tmux-navigator'

  " Git
  Plug 'tpope/vim-fugitive'

  " Coding
  Plug 'tpope/vim-commentary'

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " File Explorer
  "Plug 'scrooloose/NERDTree'

" Code
" Movement
  Plug 'justinmk/vim-sneak'

  " Window/buffer stuffs
  Plug 'rbgrouleff/bclose.vim'

  " Icons
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'ryanoasis/vim-devicons'


  "Plug 'ntpeters/vim-better-whitespace'

endif

call plug#end()
