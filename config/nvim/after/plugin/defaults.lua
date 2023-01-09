
vim.o.wrap = false
vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.scrolloff = 5
vim.o.sidescrolloff = 8

vim.o.laststatus = 2
vim.o.cmdheight = 0  -- Combine command and status bars
vim.o.shortmess = "filnxtToOFWIcC"

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true -- Put new windows right of current

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.timeoutlen = 250

vim.o.listchars = 'tab:>·,extends:>,precedes:<'

vim.o.wildmode = "longest:full,full" -- Command-line completion mode
vim.o.completeopt = "menu,menuone,noselect"

vim.o.clipboard = 'unnamedplus'
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
    c = {'<cmd>:close<CR>', 'Close buffer'},
    d = {'<cmd>:bd<CR>', 'Delete buffer [<SPC-q>]'},
    l = {'<cmd>:Telescope buffers<CR>', 'List buffers' },
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
  h = {
    name = "+help",
    t = { "<cmd>:Telescope builtin<cr>", "Telescope" },
    c = { "<cmd>:Telescope commands<cr>", "Commands" },
    h = { "<cmd>:Telescope help_tags<cr>", "Help Pages" },
    m = { "<cmd>:Telescope man_pages<cr>", "Man Pages" },
    k = { "<cmd>:Telescope keymaps<cr>", "Key Maps" },
    s = { "<cmd>:Telescope highlights<cr>", "Search Highlight Groups" },
    l = { vim.show_pos, "Highlight Groups at cursor" },
    f = { "<cmd>:Telescope filetypes<cr>", "File Types" },
    o = { "<cmd>:Telescope vim_options<cr>", "Options" },
    a = { "<cmd>:Telescope autocommands<cr>", "Auto Commands" },
    p = {
      name = "+packer",
      p = { "<cmd>PackerSync<cr>", "Sync" },
      s = { "<cmd>PackerStatus<cr>", "Status" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      c = { "<cmd>PackerCompile<cr>", "Compile" },
    },
  },
  l = {
    name = '+lsp',
    a = {vim.lsp.buf.code_action, '[C]ode [A]ction'},
    r = {vim.lsp.buf.rename, '[R]e[n]ame'},
    t = {'<cmd>TroubleToggle<CR>', 'Toggle trouble'},
    s = {
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        })
      end,
      "Goto Symbol",
    },
  },
  s = {
    name = '+search',
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
    h = { "<cmd>Telescope command_history<cr>", "Command History" },
    m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
  },
  t = {
    name = "+terminal",
    t = {"<cmd>terminal<CR>", "Start terminal"},
  },
  w = {
    name = "+windows",
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
  z = { [[<cmd>ZenMode<cr>]], "Zen Mode" },
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


-- Close certain file types with q
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})


vim.api.nvim_exec(
[[
autocmd FileType hcl setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType terraform setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd bufread *.nomad set ft=hcl
]], false)
