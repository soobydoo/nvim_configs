local crates_ok, crates = pcall(require, "crates")
if not crates_ok then
  return
end

crates.setup({
  lsp = {
    enabled = true,
    on_attach = function(client, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
      end

      map("n", "<leader>cv", crates.show_versions_popup, "Show Crate Versions")
      map("n", "<leader>cf", crates.show_features_popup, "Show Crate Features")
      map("n", "<leader>cd", crates.show_dependencies_popup, "Show Crate Dependencies")
      map("n", "<leader>cu", crates.update_crate, "Update Crate")
      map("v", "<leader>cu", crates.update_crates, "Update Selected Crates")
      map("n", "<leader>cua", crates.update_all_crates, "Update All Crates")
      map("n", "<leader>cU", crates.upgrade_crate, "Upgrade Crate")
      map("v", "<leader>cU", crates.upgrade_crates, "Upgrade Selected Crates")
      map("n", "<leader>cUA", crates.upgrade_all_crates, "Upgrade All Crates")
      map("n", "<leader>cH", crates.open_homepage, "Open Crate Homepage")
      map("n", "<leader>cR", crates.open_repository, "Open Crate Repository")
      map("n", "<leader>cD", crates.open_documentation, "Open Crate Docs.rs")
      map("n", "<leader>cC", crates.open_crates_io, "Open Crates.io")
    end,
    actions = true,
    completion = true,
    hover = true,
  },
})
