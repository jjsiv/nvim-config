# nvim-config

**Currently tested for version 0.10.2**

## Requirements

- internet connection (direct or through proxy)
- C compiler (gcc/clang)
- Lua 5.1
- git
- python
- pip
- python-venv
- ripgrep
- npm
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
7. Once everything has been installed, restart Neovim and it should be ready to use.

## Plugins

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
- [glow.nvim](https://github.com/ellisonleao/glow.nvim)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-path](https://github.com/hrsh7th/cmp-path)
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
- [LuaSnip](https://github.com/L3M0N4D3/LuaSnip)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

## LSP

LSPs are installed via Mason in `lua/plugins/mason.lua`.

**lua/config/lsp.lua** defines config for LSPs. The config will be only activated if the LSP is installed and executable.
