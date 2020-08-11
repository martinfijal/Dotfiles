

if !exists('g:vscode')
    " Save buffer
    nmap <leader>w :w!<cr>

    " Fix common mistakes
    "command Wq wq
    "command WQ wq
    "command W write

    " Move between splits
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " Move out of terminal as regular moving
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
    tnoremap <leader><ESC> <C-\><C-n>

    " FZF
    map <leader>b :Buffers<CR>
    map <leader>o :Files<CR>

    " Ctrlp
    nmap <silent> <tab> :CtrlPBuffer<CR>
endif
