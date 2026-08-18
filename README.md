# Neovim Setup

### 1. Clone Configuration

```bash
git clone git@github.com:soobydoo/nvim_configs.git ~/.config/nvim
```

### 2. Install Tools

```bash
# Rust components
rustup component add rust-analyzer clippy rustfmt

# CLI tools (Debian/Ubuntu)
sudo apt install ripgrep fd-find tree-sitter-cli gcc make
```

### 3. Launch

```bash
nvim
```

> Plugins automatically installed on first launch via `vim.pack`.
