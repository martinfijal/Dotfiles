
if !exists('g:vscode')

    "------------------------
    " Movment / sneak
    "------------------------
    let g:sneak#label = 1


    "------------------------
    " Fuzzy
    "------------------------
    nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
    nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


    "------------------------
    " Ctrlp
    "------------------------
    " Ignore files in .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

    "------------------------
    " Lightline
    "------------------------
    " Hide mode since it's in the statusline
    set noshowmode

    function! LightlineFilename()
        let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
        let modified = &modified ? ' +' : ''
        return filename . modified
    endfunction

    function! LightlineLineNumber()
        let a = line('.') . ':' . col('.')

        if &modified == 1
            return a . ' +'
        else
            return a
        endif
    endfunction

    let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ ['mode', 'paste'], ['readonly', 'linenumber', 'gitbranch'], ['filename'],
        \   ],
        \   'right': [ ['filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \   'linenumber': 'LightlineLineNumber',
        \   'filename': 'LightlineFilename',
        \ },
        \ }


    "------------------------
    " buftabline
    "------------------------
    let g:buftabline_show=1
    let g:buftabline_numbers=2
    let g:buftabline_indicators='on'

    "------------------------
    " bclose
    "------------------------
    let g:bclose_no_plugin_maps=1

    "------------------------
    " Neoformat
    "------------------------
    augroup fmt
      autocmd!
      autocmd BufWritePre *.go undojoin | Neoformat
    augroup END

endif
