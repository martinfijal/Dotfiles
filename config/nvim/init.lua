-- Booststrap packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
[[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]], false)


--
-- Helpers
--

-- Mapping helper function
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt


-- Disable builtin
local builtin_plugins = { "2html_plugin", "gzip", "man", "matchit", "netrwPlugin", "tarPlugin", "tutor_mode_plugin", "zipPlugin" }
for _, v in ipairs(builtin_plugins) do vim.g["loaded_" .. v] = 1 end


--
-- Plugins
--
local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'lazytanuki/nvim-mapper'

    -- Colorschemes
    -- use 'rafamadriz/neon'
    -- use 'marko-cerovac/material.nvim'
    -- use 'joshdick/onedark.vim'
    use 'sainnhe/sonokai'
    use 'sainnhe/everforest'
    use 'tomasiser/vim-code-dark'
    use 'NTBBloodbath/doom-one.nvim'
    use 'jacoborus/tender.vim'

    use 'YorickPeterse/vim-paper'
    use 'yorickpeterse/happy_hacking.vim'


    -- Colors
    use 'folke/lsp-colors.nvim'

    -- LSP and Auto-complete
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    --  Plug 'folke/lsp-trouble.nvim'

    -- Highlighting / syntax
    use { 'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate' }

    -- Git
    use 'TimUntersberger/neogit'
    use 'sindrets/diffview.nvim'
    use 'kdheepak/lazygit.nvim'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' }}

    -- Code
    -- use 'windwp/nvim-autopairs'
    use 'jiangmiao/auto-pairs'
    use 'terrortylor/nvim-comment'
    use 'sbdchd/neoformat'  -- TODO find a stable way to do with LSP

    -- Snippets
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- Buffers / tabs
    use 'ojroques/nvim-hardline'
    use 'ojroques/nvim-bufdel'

    -- UI
    -- puse 'akinsho/nvim-toggleterm.lua'
    use 'lukas-reineke/indent-blankline.nvim'

    -- Navigation
    use 'phaazon/hop.nvim'

    -- Helper
    use 'folke/which-key.nvim'
    use 'kyazdani42/nvim-tree.lua'

end)


--
-- Colorscheme
--

-- vim.g.neon_style = 'doom'
-- cmd [[colorscheme neon]]
-- vim.g.sonokai_style = 'maia'
-- vim.g.sonokai_disable_italic_comment  = true
-- cmd [[colorscheme sonokai]]
--
-- cmd [[set background=dark]]
vim.g.everforest_background = 'hard'
vim.g.everforest_disable_italic_comment = true
cmd [[colorscheme doom-one]]
-- cmd [[ colorscheme happy_hacking ]]


-- Hightlight yanked text in Neovim >= 0.5
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = true}'

--
-- Plugin settings
--

-- Remap leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.cursorline = true                               -- highlight current line
opt.hidden = true                                   -- background buffers
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.expandtab = true                                -- tabs to spaces
opt.hlsearch = true
opt.showmode = false
opt.showcmd = true
opt.mouse = 'a'                                     -- enable mouse support
opt.signcolumn = 'yes'
opt.formatoptions = 'crqnj'                         -- automatic formatting options
opt.shortmess = 'atToOFc'                           -- prompt message options
opt.laststatus = 2
opt.scrolloff = 5
opt.sidescrolloff = 8
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.pumheight = 10
opt.shiftround = true                               -- round indents
opt.termguicolors = true                            -- true color support
opt.updatetime = 100
opt.timeoutlen = 200                                -- command sequence timeout
opt.clipboard = 'unnamedplus'
opt.list = true                                     -- show invisible chars
opt.listchars = 'eol:¬,tab:>·,trail:~,extends:>,precedes:<,lead:.'
-- opt.listchars = 'eol:¬'
-- opt.wildmode = {'list', 'longest'}
opt.wildignore = {"*/.git/*", "*/node_modules/*"}
opt.completeopt = {'menuone', 'noinsert', 'noselect'}

-- Workaround for ghost indents with cursorline
-- https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"


-- Telescope
local telescope_actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        -- file_sorter = require'telescope.sorters'.get_fzy_file,
        file_ignore_patterns = {},
        --path_display = { shorten = 5 },

        mappings = {
            i = {
                ["<esc>"] = telescope_actions.close
            }
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('mapper')
local M = require('nvim-mapper')
M.setup({
    -- no_map = false,                                        -- do not assign the default keymap (<leader>MM)
    search_path = os.getenv("HOME") .. "/.config/nvim" -- default config search path is ~/.config/nvim/lua
})

M.map('n', '<leader>gd', ':DiffviewOpen<cr>', { noremap=true, silent=true }, 'Git', 'Open Diffview', 'desc?')

M.map_virtual('n', 'K', '', {}, 'LSP', 'lsp_hover', 'Show hover docs')
M.map_virtual('n', 'C-k', '', {}, 'LSP', 'lsp_signature' , 'Show signature')

-- Comments
require('nvim_comment').setup()

-- Indent guides
-- vim.g.indentLine_enabled = true
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_filetype_exclude = {"fugitive", "help", "terminal"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false

-- LSP
local lsp = require('lspconfig')
local lsp_on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local function lspmap(bufnr, mode, lhs, rhs)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    lspmap(bufnr, 'n', 'K', [[<cmd>Lspsaga hover_doc<cr>]])
    lspmap(bufnr, 'n', 'C-k', [[<cmd>Lspsaga signature_help<cr>]])
    lspmap(bufnr, 'n', 'gd', [[<cmd>Lspsaga preview_definition<cr>]])
    lspmap(bufnr, 'n', 'gD', [[<cmd>lua vim.lsp.buf.definition()]])
    lspmap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])

    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.pyright.setup {
    on_attach = lsp_on_attach,
    capabilities = lsp_capabilities,
}
lsp.gopls.setup {
    on_attach = lsp_on_attach,
    capabilities = lsp_capabilities,
}

-- Sumneko (Lua)
local sumneko_root_path = vim.fn.getenv("HOME").."/bin/lua-language-server"
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'

if fn.filereadable(sumneko_binary) ~= 0 then
    -- Make runtime files discoverable to the server
    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, 'lua/?.lua')
    table.insert(runtime_path, 'lua/?/init.lua')

    lsp.sumneko_lua.setup {
        cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
        on_attach = lsp_on_attach,
        capabilities = lsp_capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    path = runtime_path,
                },
                diagnostics = {
                    globals = { 'vim' }, -- Get the language server to recognize the `vim` global
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }
end

-- Completion
require('compe').setup{
    min_length = 1,
    preselect = 'disable',
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua  = true,
        vsnip  = true,
    }
}

-- Hardline
-- require('bufferline').setup {
--     options = {
--         numbers = "ordinal",
--         number_style = "none",
--         diagnostics = "nvim_lsp",
--         tab_size = 10,
--         show_buffer_icons = false,
--         show_buffer_close_icons = false,
--     }
-- }
require('hardline').setup {
    bufferline = true,
    sections = {
        {class = 'mode', item = require('hardline.parts.mode').get_item},
        {class = 'high', item = require('hardline.parts.git').get_item, hide = 80},
        '%<',
        {class = 'med', item = require('hardline.parts.filename').get_item},
        {class = 'med', item = '%='},
        -- {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 80},
        {class = 'error', item = require('hardline.parts.lsp').get_error},
        {class = 'warning', item = require('hardline.parts.lsp').get_warning},
        {class = 'warning', item = require('hardline.parts.whitespace').get_item},
        {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 80},
        {class = 'mode', item = require('hardline.parts.line').get_item},
    },
}

-- Treesitter
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    ensure_installed = "maintained",
}

-- gitsigns
require('gitsigns').setup {
    numhl = true,
    current_line_blame = false,  -- show git blame
}

-- neogit
require('neogit').setup {
    integrations = {
        diffview = true
    }
}

-- diffview
require('diffview').setup {
    diff_binaries = false,
    file_panel = {
        use_icons = false
    }
}


-- Neoformat

vim.api.nvim_exec(
[[
    augroup fmt
        autocmd!
        autocmd BufWritePre *.go undojoin | Neoformat
    augroup END
]], false)

-- toggleterm
-- require('toggleterm').setup {
--     hide_number = true,
--     start_in_insert = true,
-- }

-- require('nvim-autopairs').setup {}
--
-- local remap = vim.api.nvim_set_keymap
-- local npairs = require('nvim-autopairs')
--
-- -- skip it, if you use another global object
-- _G.MUtils= {}
--
-- vim.g.completion_confirm_key = ""
-- MUtils.completion_confirm=function()
--   if vim.fn.pumvisible() ~= 0  then
--     if vim.fn.complete_info()["selected"] ~= -1 then
--       return vim.fn["compe#confirm"](npairs.esc("<cr>"))
--     else
--       return npairs.esc("<cr>")
--     end
--   else
--     return npairs.autopairs_cr()
--   end
-- end
--
--
-- remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})


-- Which-key
local wk = require('which-key')
local wk_options = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
}
wk.setup {
    show_help = false,
    triggers = 'auto',
    key_labels = {
        ['<space>'] = 'SPC',
        ['<CR>'] = 'RET',
        ['<tab>'] = 'TAB',
    },
}
wk.register({
    w = {'write'},
    n = {'<cmd>NvimTreeFindFile<CR>', 'file tree'},
}, wk_options)
wk.register({
    f = {
        name = '+file',
        f = {"New file"},
    },
    b = {
        name = '+buffers',
        o = {'switch buffer'},
    },
    g = {
        name = '+git',
        g = {'<cmd>:LazyGit<CR>', 'lazygit'}
    },
    l = {
        name = '+lsp',
    },
    s = {
        name = '+search',
    },
    v = {
        name = "+windows",
        ["w"] = { "<C-W>p", "other-window" },
        ["d"] = { "<C-W>c", "delete-window" },
        ["-"] = { "<C-W>s", "split-window-below" },
        ["|"] = { "<C-W>v", "split-window-right" },
        ["2"] = { "<C-W>v", "layout-double-columns" },
        ["h"] = { "<C-W>h", "window-left" },
        ["j"] = { "<C-W>j", "window-below" },
        ["l"] = { "<C-W>l", "window-right" },
        ["k"] = { "<C-W>k", "window-up" },
        ["H"] = { "<C-W>5<", "expand-window-left" },
        ["J"] = { ":resize +5", "expand-window-below" },
        ["L"] = { "<C-W>5>", "expand-window-right" },
        ["K"] = { ":resize -5", "expand-window-up" },
        ["="] = { "<C-W>=", "balance-window" },
        ["s"] = { "<C-W>s", "split-window-below" },
        ["v"] = { "<C-W>v", "split-window-right" }
    },

--}, {prefix = '<leader>'})
}, wk_options)

-- nvim tree
g.nvim_tree_side = 'left'
g.nvim_tree_width = 30
g.nvim_tree_quit_on_open = 0
g.nvim_tree_disable_netrw = 0
g.nvim_tree_gitignore = 1

--
-- Keymappings / keybindings
--

-- TODO : refactor all of this into Lua
vim.api.nvim_exec(
[[
" move between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" move out of terminal as regular moving
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <leader><esc> <c-\><c-n>
]], true)


local map_options = { noremap = true, silent = true}
map('i', 'jj', '<ESC>', map_options)
map('i', 'jk', '<ESC>', map_options)
map('t', 'jj', '<ESC>', map_options)
map('n', '<leader>q', '<cmd>:BufDel<CR>', map_options)
map('n', '<leader>x', '<cmd>:BufDel<CR>', map_options)
map('n', '<leader>bd', '<cmd>:bd<CR>', map_options)
map('n', '<leader>w', '<cmd>:w!<CR>', map_options)
map('n', '<leader>t', '<cmd>:terminal<CR>', map_options)
map('n', '<leader>q', '<cmd>:bd<CR>', map_options)
map('n', '<leader>Q', '<cmd>:qa!<CR>', map_options)

map('n', 's', '<cmd>:HopChar2<CR>', {silent = true})
map('n', 'S', '<cmd>:HopWord<CR>', {silent = true})
-- map('t', '<leader>t', '<cmd>:ToggleTerm<CR>', map_options)
map('t', '<ESC>', '&filetype == "fzf" ? "\\<ESC>" : "\\<C-\\>\\<C-n>"' , {expr = true})

-- telescope
map('n', '<TAB>', '<cmd>:Telescope buffers sort_lastused=true theme=get_ivy winblend=10<CR>', map_options)
map('n', '<leader>o', '<cmd>:Telescope find_files sort_lastused=true theme=get_ivy winblend=10<CR>', map_options)
map('n', '<leader>fg', '<cmd>:Telescope live_grep theme=get_ivy<CR>', map_options)


--
-- Commands
--
function setup_terminal()
    cmd 'setlocal signcolumn=auto'
    cmd 'setlocal nospell'
    cmd 'setlocal norelativenumber nonumber'
end

vim.api.nvim_exec(
[[
" Fix my bad keyboard skills :)
command! W write
command! Wq wq

autocmd TermOpen * lua setup_terminal()

" Enter and leave when moving to and from a terminal
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

autocmd FileType hcl setlocal shiftwidth=2 softtabstop=2 expandtab
]], false)

-- Tab/shift-tab to move in complete menu
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col '.' - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
--  elseif luasnip.expand_or_jumpable() then
--    return t '<Plug>luasnip-expand-or-jump'
    elseif check_back_space() then
        return t '<Tab>'
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
 --elseif luasnip.jumpable(-1) then
 --   return t '<Plug>luasnip-jump-prev'
  else
    return t '<S-Tab>'
  end
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
--
---- Map compe confirm and complete functions
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
