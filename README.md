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

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) (package manager)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [sindrets/diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- [L3M0N4D3/LuaSnip](https://github.com/L3M0N4D3/LuaSnip)
- [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [CopilotC-Nvim/CopilotC-Nvim/CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)
- [jinh0/eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim)
- [Wansmer/treesj](https://github.com/Wansmer/treesj)
- [nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
- [Saghen/blink.cmp](https://github.com/Saghen/blink.cmp)
- [fang2hou/blink-copilot](https://github.com/fang2hou/blink-copilot)
- [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

## LSP

LSPs/linters/formatters/etc. are installed via Mason in `lua/plugins/mason.lua`.

LSPs are configured in `lsp/` and enabled in `init.lua`.
