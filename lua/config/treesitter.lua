-- Tree-sitter setup
local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

-- Enable treesitter highlighting for rust and config files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust", "toml", "ron", "lua", "markdown" },
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})
