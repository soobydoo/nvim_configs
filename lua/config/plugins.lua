-- Built-in Neovim 0.12 package management via vim.pack
vim.pack.add({
  -- Tree-sitter for rich Rust & TOML syntax highlighting
  "https://github.com/nvim-treesitter/nvim-treesitter",

  -- Essential Rust plugin (rust-analyzer integration, runnables, cargo commands, inlay hints)
  "https://github.com/mrcjkb/rustaceanvim",

  -- Cargo.toml crate management (version check, feature flags, docs, upgrades)
  "https://github.com/saecki/crates.nvim",

  -- LSP configuration
  "https://github.com/neovim/nvim-lspconfig",

  -- Autocompletion engine & snippet integration
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/hrsh7th/cmp-buffer",
  "https://github.com/hrsh7th/cmp-path",
  "https://github.com/saadparwaiz1/cmp_luasnip",
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",

  -- UI Suite (Fuzzy finder, statusline, icons, pairs, surround, comments, navigation)
  "https://github.com/nvim-mini/mini.nvim",

  -- Color theme
  "https://github.com/folke/tokyonight.nvim",

  -- Markdown preview in editor
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})
