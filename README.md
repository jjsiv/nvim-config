# nvim-config

**Currently tested for version 0.10.2**

## Requirements

- internet connection (direct or through proxy) C compiler (gcc/clang)
- Lua (preferably 5.1)
- git
- python
- pip
- python-venv
- luarocks (optional, for lazy.nvim)
- ripgrep (for nvim-telescope)
- fd (optional, for nvim-telescope)
- npm (optional, required for some installations via Mason)
- go (optional, required for some installations via Mason)

1. [Download and install Neovim 0.10.2](https://github.com/neovim/neovim/releases/tag/v0.10.2)
2. Untar and move directory to /opt. Update PATH accordingly  
   `export PATH=$PATH:/opt/nvim-linux64/bin`
3. Create local config directory ~/.config/nvim  
   `mkdir -p ~/.config/nvim`
4. Clone this repo into the config directory  
   `git clone https://github.com/jjsiv/nvim-config.git ~/.config/nvim`
5. Launch Neovim. First launch will bootstrap **lazy.nvim** package manager and subsequently all other plugins. This will require internet access.
6. Mason will try to automatically install default LSPs defined in _mason-lspconfig.lua_. Some might fail in case npm/pip/go are missing.
7. Once all plugins have been installed, you will be asked to update dependencies for **coq_nvim** by running  
   `:COQdeps.`
8. Once everything has been installed, restart Neovim and it should be ready to use.

## Plugins included

- [lazy.nvim](https://github.com/folke/lazy.nvim) (package manager)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [coq_nvim](https://github.com/ms-jpq/coq_nvim)
- [coq.artifacts](https://github.com/ms-jpq/coq.artifacts)
- [glow.nvim](https://github.com/ellisonleao/glow.nvim)

## LSP

LSPs are installed via Mason. LSPs to install automatically on launch can be specified in lua/plugins/mason-lspconfig.lua in ensure_installed. **Some LSPs require additional tools to be installed (e.g. npm or pip)**

**lua/config/lsp.lua** defines config for LSPs. The config will be only activated if the LSP is installed and executable.

## TODO

- Plugin for jumping to function name, params, etc.
