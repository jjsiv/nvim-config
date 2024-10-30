# nvim-config
**Currently tested for version 0.10.2**

## Requirements
- internet connection (direct or through proxy)
- C compiler (gcc/clang)
- Lua (preferably 5.1)
- git
- python
- luarocks (optional, for lazy.nvim)
- ripgrep (for nvim-telescope)
- fd (optional, for nvim-telescope)
- npm (optional, required for some installations via Mason)

1. [Download and install Neovim 0.10.2](https://github.com/neovim/neovim/releases/tag/v0.10.2)

## Plugins included
- [lazy.nvim](https://github.com/folke/lazy.nvim) (package manager)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [coq_nvim](https://github.com/ms-jpq/coq_nvim)

## LSP
LSPs are installed via Mason. LSPs to install automatically on launch can be specified in lua/plugins/mason-lspconfig.lua in ensure_installed. **Some LSPs require additional tools to be installed (e.g. npm or pip)**

**lua/config/lsp.lua** defines config for LSPs. The config will be only activated if the LSP is installed and executable.

## TODO
- ftdetects for ansible (if needed)
- some markdown plugin
- indents (for terraform at least)
- some colorschemes
- shortcuts for some commands (dvo=DiffviewOpen, dvc=DiffviewClose)
- keymaps for buffers (maybe not needed?)
