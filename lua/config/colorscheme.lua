vim.api.nvim_cmd({
    cmd = "colorscheme",
    args = { "catppuccin" }
  },
  {})

vim.api.nvim_set_hl(0, 'LineNr', { fg = '#808080' })
