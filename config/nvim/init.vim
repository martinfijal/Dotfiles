"
" Neovim config intended to work with regular neovim and when embedded in VSCode
"


source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/plugins.vim


" Only when running inside VSCode
if exists('g:vscode')
  source $HOME/.config/nvim/vscode.vim
else
  " ALL OTHER NVIM
  source $HOME/.config/nvim/plugin_settings.vim
  source $HOME/.config/nvim/keymappings.vim
  source $HOME/.config/nvim/lsp.vim
  source $HOME/.config/nvim/which.vim

  colorscheme wombat256grf

endif


"---------------------------------------
"
" WORK IN PROGRESS
"
"---------------------------------------

" Enter and leave when moving to and from a terminal
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction


" TODO: move autocommand to own file
"
autocmd FileType hcl setlocal shiftwidth=2 softtabstop=2 expandtab
