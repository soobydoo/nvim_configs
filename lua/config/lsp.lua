-- Configure rustaceanvim with rust-analyzer, clippy, inlay hints, and keymaps
vim.g.rustaceanvim = {
  tools = {
    float_win_config = {
      border = "rounded",
    },
    hover_actions = {
      auto_focus = false,
    },
  },
  server = {
    on_attach = function(client, bufnr)
      -- Enable inlay hints by default in Neovim 0.10+
      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end

      -- Auto-format on save with rustfmt / rust-analyzer
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = false })
        end,
      })

      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      end

      -- Standard LSP navigation
      map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
      map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
      map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
      map("n", "gr", vim.lsp.buf.references, "Find References")
      map("n", "gt", vim.lsp.buf.type_definition, "Type Definition")
      map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")

      -- Rustaceanvim enhanced actions
      map("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, "Rust Hover Actions")
      map("n", "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, "Rust Code Action")
      map("n", "<leader>cr", vim.lsp.buf.rename, "Rename Symbol")
      map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
      map("n", "<leader>ce", function() vim.cmd.RustLsp("explainError") end, "Rust Explain Error")
      map("n", "<leader>rd", function() vim.cmd.RustLsp("renderDiagnostic") end, "Rust Render Diagnostic")
      map("n", "<leader>cR", function() vim.cmd.RustLsp("runnables") end, "Rust Runnables (Run/Test)")
      map("n", "<leader>ct", function() vim.cmd.RustLsp("testables") end, "Rust Testables")
      map("n", "<leader>cm", function() vim.cmd.RustLsp("expandMacro") end, "Rust Expand Macro")
      map("n", "<leader>co", function() vim.cmd.RustLsp("openCargo") end, "Open Cargo.toml")
      map("n", "<leader>cp", function() vim.cmd.RustLsp("parentModule") end, "Go to Parent Module")
      map("n", "<leader>th", function()
        if vim.lsp.inlay_hint then
          local current = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
          vim.lsp.inlay_hint.enable(not current, { bufnr = bufnr })
        end
      end, "Toggle Inlay Hints")
      map("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format Document")
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        checkOnSave = true,
        check = {
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        procMacro = {
          enable = true,
        },
        diagnostics = {
          enable = true,
        },
        inlayHints = {
          bindingModeHints = { enable = false },
          chainingHints = { enable = true },
          closingBraceHints = { enable = true, minLines = 25 },
          closureReturnTypeHints = { enable = "always" },
          lifetimeElisionHints = { enable = "always", useParameterNames = true },
          typeHints = { enable = true },
          parameterHints = { enable = true },
        },
      },
    },
  },
}

-- Cargo command keymaps
local map = vim.keymap.set
map("n", "<leader>cb", "<cmd>!cargo build<CR>", { desc = "Cargo Build" })
map("n", "<leader>cc", "<cmd>!cargo check<CR>", { desc = "Cargo Check" })
map("n", "<leader>cl", "<cmd>!cargo clippy<CR>", { desc = "Cargo Clippy" })
map("n", "<leader>crr", "<cmd>!cargo run<CR>", { desc = "Cargo Run" })
map("n", "<leader>crt", "<cmd>!cargo test<CR>", { desc = "Cargo Test" })
