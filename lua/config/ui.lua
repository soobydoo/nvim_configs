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

-- File Explorer (mini.files)
local files_ok, files = pcall(require, "mini.files")
if files_ok then
  files.setup({
    windows = {
      preview = true,
      width_focus = 35,
      width_preview = 50,
    },
    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "<CR>",
      go_out = "h",
      go_out_plus = "-",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "=",
      trim_left = "<",
      trim_right = ">",
    },
  })

  local map = vim.keymap.set
  -- Open file tree at current file location
  map("n", "<leader>e", function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    if buf_name ~= "" and vim.uv.fs_stat(buf_name) then
      files.open(buf_name, true)
    else
      files.open(nil, false)
    end
  end, { desc = "File Explorer (Current File)" })

  -- Open file tree at project root (cwd)
  map("n", "<leader>E", function()
    files.open(nil, false)
  end, { desc = "File Explorer (Project Root)" })

  -- Quick '-' keymap to open file explorer
  map("n", "-", function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    if buf_name ~= "" and vim.uv.fs_stat(buf_name) then
      files.open(buf_name, true)
    else
      files.open(nil, false)
    end
  end, { desc = "Open File Explorer in Dir" })
end

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

-- Extra Pickers (mini.extra)
local extra_ok, extra = pcall(require, "mini.extra")
if extra_ok and pick_ok then
  extra.setup()
  local map = vim.keymap.set
  map("n", "<leader>fr", function() extra.pickers.oldfiles() end, { desc = "Recent Files (Oldfiles)" })
  map("n", "<leader>fo", function() extra.pickers.oldfiles() end, { desc = "Recent Files (Oldfiles)" })
  map("n", "<leader>gf", function() extra.pickers.git_files() end, { desc = "Git Files" })
  map("n", "<leader>gc", function() extra.pickers.git_commits() end, { desc = "Git Commits" })
  map("n", "<leader>fs", function() extra.pickers.lsp({ scope = "document_symbol" }) end, { desc = "Document Symbols" })
  map("n", "<leader>fS", function() extra.pickers.lsp({ scope = "workspace_symbol" }) end, { desc = "Workspace Symbols" })
  map("n", "<leader>fd", function() extra.pickers.diagnostic() end, { desc = "Workspace Diagnostics" })
  map("n", "<leader>/", function() extra.pickers.buf_lines() end, { desc = "Search Current Buffer" })
end

-- Render markdown
safe_setup("render-markdown")
