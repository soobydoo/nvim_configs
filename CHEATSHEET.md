# Neovim Rust Development Cheat Sheet

Leader key is mapped to `<Space>`.

---

## 1. File Creation & File Explorer (`mini.files`)

| Action / Keymap | How to use |
| :--- | :--- |
| **`<leader>fn`** | Prompts for a new file path with autocompletion, then opens it |
| **`:e path/to/file.rs`** | Opens a buffer for that path (creates on `:w` / `<leader>w`) |
| **`:vsp path/to/file.rs`** | Opens the new file in a vertical split |
| **`<leader>e`** or **`-`** | Open File Explorer at **current file's directory** |
| **`<leader>E`** | Open File Explorer at **project root** |

### Creating files inside the File Explorer (`mini.files`):
1. Press `<leader>e` or `-` to open the explorer.
2. Navigate to the desired folder.
3. Press `o` (or `i`/`a`) to insert a new line in the list and type the file name (e.g. `utils.rs` or `models/user.rs`).
4. Press `=` (synchronize) to create it on disk.
5. Press `<CR>` or `l` to open the new file.

---

## 2. Fuzzy Finding & Repository Navigation (`mini.pick` + `mini.extra`)

| Keymap | Action |
| :--- | :--- |
| `<leader>ff` / `<leader><leader>` | Find files in workspace |
| `<leader>fg` | Live grep across all files (`ripgrep`) |
| `<leader>fr` / `<leader>fo` | Search **recent files** (oldfiles) |
| `<leader>fb` | Search open **buffers** |
| `<leader>gf` | Search **Git tracked files** |
| `<leader>gc` | Search **Git commits** |
| `<leader>fs` | Search **Document symbols** (functions, structs, traits) |
| `<leader>fS` | Search **Workspace symbols** across entire repo |
| `<leader>fd` | Search **Diagnostics** in workspace |
| `<leader>/` | Fuzzy search lines in current buffer |
| `<leader>fh` | Search Neovim help tags |

---

## 3. Rust & LSP Actions (rust-analyzer / rustaceanvim)

| Keymap | Description |
| :--- | :--- |
| `K` | Rust hover actions & documentation popup |
| `gd` | Go to definition |
| `<C-o>` | Jump backward to previous location (after `gd`) |
| `<C-i>` | Jump forward in jumplist |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find all references |
| `gt` | Go to type definition |
| `<C-k>` | Signature help |
| `<leader>ca` | Rust code actions (grouped fixes, auto-imports, refactors) |
| `<leader>cr` | Rename symbol across project |
| `<leader>cd` | Open line diagnostic float |
| `<leader>ce` | Rust explain compiler error (`--explain`) |
| `<leader>rd` | Rust render diagnostic popup |
| `<leader>cR` | Rust runnables (interactive main / test / bench runner) |
| `<leader>ct` | Rust testables (select and run specific tests) |
| `<leader>cm` | Expand macro recursively |
| `<leader>co` | Open `Cargo.toml` of current crate |
| `<leader>cp` | Go to parent module |
| `<leader>th` | Toggle inlay hints (types, parameter names, chaining) |
| `<leader>cf` | Format current buffer (`rustfmt` / LSP) |

> **Note:** Auto-formatting with `rustfmt` is enabled automatically on save (`:w`).

---

## 4. Cargo Commands

| Keymap | Command / Action |
| :--- | :--- |
| `<leader>cb` | Run `cargo build` |
| `<leader>cc` | Run `cargo check` |
| `<leader>cl` | Run `cargo clippy` |
| `<leader>crr` | Run `cargo run` |
| `<leader>crt` | Run `cargo test` |

---

## 5. `Cargo.toml` Crate Management (`crates.nvim`)

Active when editing `Cargo.toml`:

| Keymap | Action |
| :--- | :--- |
| `<leader>cv` | Show crate versions popup |
| `<leader>cf` | Show crate feature flags popup |
| `<leader>cd` | Show crate dependencies popup |
| `<leader>cu` | Update crate to latest matching version |
| `<leader>cua` | Update all crates in file |
| `<leader>cU` | Upgrade crate to latest release |
| `<leader>cUA` | Upgrade all crates in file |
| `<leader>cD` | Open crate documentation on [Docs.rs](https://docs.rs) |
| `<leader>cC` | Open crate on [Crates.io](https://crates.io) |
| `<leader>cH` | Open crate homepage |
| `<leader>cR` | Open crate repository |

---

## 6. Diagnostics & Quick Navigation

| Keymap | Action |
| :--- | :--- |
| `[d` / `]d` | Jump to previous / next diagnostic |
| `[b` / `]b` | Jump to previous / next buffer |
| `[f` / `]f` | Jump to previous / next file in directory |
| `<leader>e` | Open diagnostic error float |
| `<leader>dl` | Populate diagnostic location list |

---

## 7. General Editor & Window Navigation

| Keymap | Action |
| :--- | :--- |
| `<Esc>` | Clear search highlights |
| `<leader>w` | Save file (`:w`) |
| `<leader>q` | Quit window (`:q`) |
| `<leader>bd` | Delete current buffer (`:bdelete`) |
| `<S-h>` / `<S-l>` | Switch to previous / next buffer |
| `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` | Move between split windows |
| `<C-Up>` / `<C-Down>` | Resize window vertically |
| `<C-Left>` / `<C-Right>` | Resize window horizontally |
| `<leader>tt` | Open embedded terminal split |
| `J` / `K` (visual mode) | Move selected block up / down |

---

## 8. Autocompletion (`nvim-cmp`)

| Keymap | Action |
| :--- | :--- |
| `<Tab>` | Next item in popup / expand snippet |
| `<S-Tab>` | Previous item in popup / jump snippet backwards |
| `<C-n>` / `<C-p>` | Navigate completion items down / up |
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion manually |
| `<C-e>` | Abort completion |
| `<C-b>` / `<C-f>` | Scroll completion documentation window |
