vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 69

-- Save & Close Keymaps
vim.keymap.set('n', '<leader>q', '<CMD>q<CR>', { desc="Close" } )
vim.keymap.set('n', '<leader>w', '<CMD>w<CR>', { desc="Save file"} )

-- Moving lines
-- Move current line in normal mode
vim.keymap.set('n', '<A-j>', '<CMD>m .+1<CR>==', { desc='Move current line down' })
vim.keymap.set('n', '<A-k>', '<CMD>m .-2<CR>==', { desc='Move current line up' })
-- Move current line in insert mode
vim.keymap.set('i', '<A-j>', '<CMD>m .+1<CR>==gi', { desc='Move current line down' })
vim.keymap.set('i', '<A-k>', '<CMD>m .-2<CR>==gi', { desc='Move current line up' })
-- Move current line in visual mode
vim.keymap.set('v', '<A-j>', '<CMD>m .+1<CR>gv=gv', { desc='Move current line down' })
vim.keymap.set('v', '<A-k>', '<CMD>m .-2<CR>gv=gv', { desc='Move current line up' })

-- Duplicating lines
-- Duplicate current line in normal mode
vim.keymap.set('n', '<A-S-j>', '<CMD>t.<CR>', { desc='Duplicate current line down' })
vim.keymap.set('n', '<A-S-k>', '<CMD>t.-1<CR>', { desc='Duplicate current line up' })
-- Duplicate current line in insert mode
vim.keymap.set('i', '<A-S-j>', '<CMD>t.<CR>==gi', { desc='Duplicate current line down' })
vim.keymap.set('i', '<A-S-k>', '<CMD>t.-1<CR>==gi', { desc='Duplicate current line up' })
-- Duplicate current line in visual mode
vim.keymap.set('v', '<A-S-j>', '<CMD>t.<CR>gv=gv', { desc='Duplicate current line down' })
vim.keymap.set('v', '<A-S-k>', '<CMD>t.-1<CR>gv=gv', { desc='Duplicate current line up' })

--[[ ###############################################################
 _                                  _           
| | __ _ _____   _       _ ____   _(_)_ __ ___  
| |/ _` |_  / | | |     | '_ \ \ / / | '_ ` _ \ 
| | (_| |/ /| |_| |  _  | | | \ V /| | | | | | |
|_|\__,_/___|\__, | (_) |_| |_|\_/ |_|_| |_| |_|
             |___/                              
--################################################################]]
require("config.lazy")

-- Colorscheme
vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Treesitter
-- #################################################################
-- Suported languages can be found on this page: https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
-- #################################################################
require('nvim-treesitter.install').install({
  -- 1. System and Compiled Languages (The base for many tools)
  'c', 'cpp', 'rust',

  -- 2. Scripting and General Purpose
  'python', 'lua', 'php', 'php_only', 'dart',

  -- 3. Web Dev (Frontend y Backend)
  'javascript', 'typescript', 'html', 'css',

  -- 4. Documentation, Text & Markup
  'markdown', 'markdown_inline', 'latex', 'bibtex', 'xml', 'regex',

  -- 5. Data, Configuration & Serialization
  'json', 'yaml', 'toml', 'desktop',

  -- 6. Shell, Build Systems, CI/CD & DevOps
  'bash', 'make', 'cmake', 'dockerfile', 'nix', 'gitignore',
})
-- #################################################################
-- Activate Highlighting
-- #################################################################
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

-- Neotree
vim.keymap.set('n', '<leader>nh', '<CMD>Neotree filesystem reveal left toggle<CR>', { desc='Open Neotree - left' })
