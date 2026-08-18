-- Leader key MUST be set before loading plugins and keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load modular configurations
require("config.options")
require("config.keymaps")
require("config.plugins")
require("config.treesitter")
require("config.completion")
require("config.lsp")
require("config.crates")
require("config.ui")
