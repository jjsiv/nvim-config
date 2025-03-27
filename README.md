# nvim-config

Requires Neovim 0.11.0+

## Requirements

- C compiler (gcc/clang)
- Lua
- git
- python
- pip
- ripgrep
- npm
- go (optional, required for some installations via Mason)

1. [Download and install Neovim 0.11.0](https://github.com/neovim/neovim/releases/tag/v0.11.0)
2. Untar and move directory to desired directory. Update PATH if necessary
3. Create local config directory ~/.config/nvim  
   `mkdir -p ~/.config/nvim`
4. Clone this repo into the config directory  
   `git clone https://github.com/jjsiv/nvim-config.git ~/.config/nvim`
5. Launch Neovim. First launch will bootstrap **lazy.nvim** package manager and subsequently all other plugins. This will require internet access.
6. Mason is used to install LSPs, linters, formatters, etc. setup_packages() function defined in `mason.lua` is used for declarative installations.
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
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [LuaSnip](https://github.com/L3M0N4D3/LuaSnip)
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [CopilotC-Nvim/CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)
- [jinh0/eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim)
- [Wansmer/treesj](https://github.com/Wansmer/treesj)
- [nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
- [Saghen/blink.cmp](https://github.com/Saghen/blink.cmp)

## LSP

LSPs/linters/formatters/etc. are installed via Mason in `lua/plugins/mason.lua`.

LSPs are configured in `lsp/` and enabled in `init.lua`.
