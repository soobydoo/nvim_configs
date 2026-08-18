-- Apply TokyoNight theme
pcall(function()
  vim.cmd("colorscheme tokyonight-moon")
end)

-- Setup mini.nvim modules
local function safe_setup(mod, config)
  local ok, m = pcall(require, mod)
  if ok and m.setup then
    m.setup(config or {})
  end
end

safe_setup("mini.statusline")
safe_setup("mini.pairs")
safe_setup("mini.surround")
safe_setup("mini.comment")
safe_setup("mini.icons")
safe_setup("mini.bracketed")
safe_setup("mini.cursorword")
safe_setup("mini.indentscope", { symbol = "│" })

-- Fuzzy finder setup (mini.pick)
local pick_ok, pick = pcall(require, "mini.pick")
if pick_ok then
  pick.setup()
  local map = vim.keymap.set
  map("n", "<leader>ff", function() pick.builtin.files() end, { desc = "Find Files" })
  map("n", "<leader>fg", function() pick.builtin.grep_live() end, { desc = "Live Grep" })
  map("n", "<leader>fb", function() pick.builtin.buffers() end, { desc = "Find Buffers" })
  map("n", "<leader>fh", function() pick.builtin.help() end, { desc = "Find Help" })
  map("n", "<leader><leader>", function() pick.builtin.files() end, { desc = "Find Files (Root)" })
end

-- Render markdown
safe_setup("render-markdown")
