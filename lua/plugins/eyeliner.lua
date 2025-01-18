return {
  'jinh0/eyeliner.nvim',
  config = function()
    require('eyeliner').setup()

    vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#CC6600', bold = true, underline = true })
    vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#FFB266', underline = true })
  end,
}
