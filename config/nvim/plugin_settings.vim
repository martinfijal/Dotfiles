
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
    " indent-blankline
    "------------------------
    "let g:indent_blankline_char = '▎'
    let g:indent_blankline_char = '│'
    "let g:indent_blankline_space_char = '·'
    "let g:indent_blankline_space_char = '⬫'
    let g:indent_blankline_space_char = '⬩'
    "let g:indent_blankline_space_char = '.'
    "let g:indent_blankline_space_char_blankline = ' '
    let g:indent_blankline_show_end_of_line = v:true
    let g:indent_blankline_show_trailing_blankline_indent = v:true
    let g:indent_blankline_space_char_blankline = ' '
    " WORK AROUND https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
    set colorcolumn=99999

    "------------------------
    " nvim tree
    "------------------------
    let g:nvim_tree_side = 'left' "left by default
    let g:nvim_tree_width = 30 "30 by default
    let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
    let g:nvim_tree_gitignore = 1
    let g:nvim_tree_auto_close = 1
    let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
    let g:nvim_tree_indent_markers = 1
    let g:nvim_tree_git_hl = 1
    let g:nvim_tree_tab_open = 1
    let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
    let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
    let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
    let g:nvim_tree_add_trailing = 1
    let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
    let g:nvim_tree_show_icons = {
        \ 'git': 1,
        \ 'folders': 1,
        \ 'files': 1,
        \ }

    " default will show icon by default if no icon is provided
    " default shows no icon by default
    let g:nvim_tree_icons = {
        \ 'default': '',
        \ 'symlink': '',
        \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': ""
        \   },
        \ 'folder': {
        \   'default': "",
        \   'open': "",
        \   'empty': "",
        \   'empty_open': "",
        \   'symlink': "",
        \   'symlink_open': "",
        \   }
        \ }

    set termguicolors " this variable must be enabled for colors to be applied properly

    " a list of groups can be found at `:help nvim_tree_highlight`
    highlight NvimTreeFolderIcon guibg=blue


endif
