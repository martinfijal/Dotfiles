
if !exists('g:vscode')

    "------------------------
    " Movment / sneak
    "------------------------
    let g:sneak#label = 1


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
        \   'left': [ ['mode', 'paste'], ['readonly', 'linenumber', 'gitbranch'],
        \   ],
        \   'right': [ ['filename'], ['filetype'],
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
endif
