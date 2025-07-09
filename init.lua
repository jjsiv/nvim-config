require("config.options")
require("config.lazy")
require("config.colorscheme")
require("config.keymaps")

vim.lsp.enable({
  -- "yaml-language-server",
  "basedpyright",
  "ruff",
  "gopls",
  "lua-language-server",
  "ansible-language-server",
  "bash-language-server",
  "terraform-ls",
  "helm_ls",
  "clangd",
})
