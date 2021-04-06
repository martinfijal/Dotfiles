

if !exists('g:vscode')
    " Save buffer
    nmap <leader>w :w!<cr>

    " Fix common mistakes
    "command Wq wq
    "command WQ wq
    command W write

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
    " map <leader>b :Buffers<CR>
    nnoremap <silent> <leader>o :Files<CR>

    " Ctrlp
    nmap <silent> <tab> :CtrlPBuffer<CR>
    "nnoremap <silent> <tab> :CtrlPBuffer<CR>

    " bclose
    nnoremap <silent> <Leader>bd :Bclose<CR>
    nnoremap <silent> <Leader>q :Bclose<CR>


    " inoremap <silent><expr> <TAB>
    " \ pumvisible() ? "\<C-n>" :
    " \ <SID>check_back_space() ? "\<TAB>" :
    " \ deoplete#manual_complete()
    " function! s:check_back_space() abort "{{{
    " let col = col('.') - 1
    " return !col || getline('.')[col - 1]  =~ '\s'
    " endfunction"}}}
endif
