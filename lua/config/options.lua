local opt = vim.opt

-- Appearance
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.showmode = false

-- Indentation & Tabs (Standard 4 spaces for Rust)
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Behavior & Performance
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.swapfile = false
opt.completeopt = { "menu", "menuone", "noselect" }
opt.mouse = "a"

-- Diagnostic display configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Diagnostic icons in sign column
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
