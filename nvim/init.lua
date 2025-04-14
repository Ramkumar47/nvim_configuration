-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NeoVim Lua configuration script
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4") vim.cmd("set ignorecase")
vim.cmd("set smartcase")
vim.cmd("set autochdir")

-- lazy setup
require("config.lazy")

-- setting up colorscheme
vim.cmd.colorscheme "catppuccin"

-- setting up relative numbering
vim.cmd("set number relativenumber")

-- setting up highlighter and eof marker
vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
vim.cmd("set colorcolumn=80")
vim.cmd("set nohlsearch")

-- setting up telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n','<C-p>',builtin.find_files,{})
vim.keymap.set('n','<leader>fg',builtin.live_grep,{})

-- setting up nvim tree toggle
vim.keymap.set('n','<leader>nt',":NvimTreeToggle<CR>",{})

-- disabling mouse
vim.opt.mouse=""

-- loading custom functions definitions
require("customLuaScripts/generalFunctions")
require("customLuaScripts/cFunctions")
require("customLuaScripts/latexFunctions")
require("customLuaScripts/pythonFunctions")
require("customLuaScripts/quartoFunctions")

-- loading autocmds definitions
require("config.autocmds")

-- loading lualine configuration
require("lualineConfiguration")

-- hiding command window
vim.opt.cmdheight = 1

-- command to remove mixed indents
vim.keymap.set('n','<leader>rt',":retab<CR>")

