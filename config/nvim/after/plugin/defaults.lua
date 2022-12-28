
vim.o.wrap = false
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.scrolloff = 5
vim.o.sidescrolloff = 8

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.timeoutlen = 250

vim.o.listchars = 'tab:>·,extends:>,precedes:<'
-- vim.o.fillchars = { eob = "~" }

-- vim.o.wildignore = {"*/.git/*", "*/node_modules/*", "*__pycache__*", "*.pyc"}


-- Find files
local telescope_find_files = '<cmd>:Telescope find_files hidden=true sort_lastused=true theme=get_ivy winblend=10<CR>'
vim.keymap.set('n', '<leader>o', telescope_find_files, {desc='Find files [<SPC-o>]'})
-- Grep files
local telescope_grep_files = '<cmd>:Telescope live_grep theme=get_ivy<CR>'
vim.keymap.set('n', '<leader>g', telescope_grep_files, {desc='Grep files [<SPC-g>]'})

-- Save buffer
vim.keymap.set('n', '<leader>w', '<cmd>:w!<CR>', {desc='Save buffer [<SPC-w>]'})
vim.keymap.set('n', '<leader>x', '<cmd>:BufDel<CR>', {desc='Remove buffer [<SPC-x>]'})
-- Switch buffers
vim.keymap.set('n', '<TAB>', '<cmd>CtrlPBuffer<CR>', {desc='Switch buffer [TAB]'})
-- Backspace to toggle previous buffer
-- vim.api.nvim_set_keymap('n', '<bs>', '<c-^>\'”zz', { silent = true, noremap = true })

-- Move around
vim.keymap.set('n', '<C-h>', '<C-w>h', {desc='Window left [C-h]'})
vim.keymap.set('n', '<C-l>', '<C-w>l', {desc='Window right [C-l]'})
vim.keymap.set('n', '<C-j>', '<C-w>j', {desc='Window down [C-j]'})
vim.keymap.set('n', '<C-k>', '<C-w>k', {desc='Window up [C-k]'})
-- Move from terminal
vim.keymap.set('t', '<C-h>', '<c-\\><c-n><c-w>h', {desc='Window left [C-h]'})
vim.keymap.set('t', '<C-l>', '<c-\\><c-n><c-w>l', {desc='Window right [C-l]'})
vim.keymap.set('t', '<C-j>', '<c-\\><c-n><c-w>j', {desc='Window down [C-j]'})
vim.keymap.set('t', '<C-k>', '<c-\\><c-n><c-w>k', {desc='Window up [C-k]'})

-- Move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- harpoon
-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
--
-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)


-- Sane escape in terminal
vim.keymap.set('t', '<ESC>', '&filetype == "fzf" ? "\\<ESC>" : "\\<C-\\>\\<C-n>"' , {expr = true})

local noresil = { noremap = true, silent = true}
local wk = require("which-key")

wk.register({
  c = {
    name = 'comment',
    c = {'<cmd>gc<CR>', 'Toggle linewise [gc]'},
  },
  b = {
    name = 'buffer',
    d = {'<cmd>:bd<CR>', 'Delete buffer [<SPC-q>]'},
    x = {'<cmd>:BufDel<CR>', 'Remove buffer [<SPC-x>]'},
    w = {'<cmd>:w!<CR>', 'Save buffer [<SPC-w>]'},
  },
  f = {
    name = 'files',
    f = {'<cmd>NvimTreeToggle<CR>', 'Nvim tree toggle'},
    n = {'<cmd>NvimTreeFindFileToggle<CR>', 'Nvim tree find file'},
    o = {telescope_find_files, 'Find files [<SPC-o>]'},
    g = {telescope_grep_files, 'Grep files [<SPC-g>]'},
  },
  g = {
    name = 'git',
    g = {'<cmd>Neogit<CR>', 'Neogit'},
  },
  l = {
    name = 'lsp',
  },
  t = {
    name = "terminal",
    t = {"<cmd>terminal<CR>", "Start terminal"},
  },
  w = {
    name = "windows",
    h = {"<C-w>h", 'window left'},
    j = {"<C-w>j", 'window down'},
    k = {"<C-w>k", 'window up'},
    l = {"<C-w>l", 'window right'},

    w = {"<C-w>p", 'previous window'},

    H = {"<C-w>5<", 'expand window left'},
    J = {"<cmd>resize +5<CR>", 'expand window below'},
    K = {"<cmd>resize -5<CR>", 'expand window up'},
    L = {"<C-w>5>", 'expand window right'},
    ['='] = {"<C-w>=", 'balance window'},

  },
}, { prefix = "<leader>" })


--
-- Autocommands
--

-- Local settings for terminals
vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = {"*"},
  callback = function()
    vim.opt_local.signcolumn='auto'
    vim.opt_local.spell=false
    vim.opt_local.relativenumber=false
    vim.opt_local.number=false
  end,
})

-- Enter/exit terminal in insert/normal mode
vim.api.nvim_create_autocmd({"BufWinEnter", "WinEnter"}, {
  pattern = {"term://*"},
  command = "startinsert",
})
vim.api.nvim_create_autocmd({"BufLeave"}, {
  pattern = {"term://*"},
  command = "stopinsert",
})


vim.api.nvim_exec(
[[
autocmd FileType hcl setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType terraform setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd bufread *.nomad set ft=hcl
]], false)
