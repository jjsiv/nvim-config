return {
  'sindrets/diffview.nvim',
  config = function()
    vim.keymap.set('ca', 'Dvo', 'DiffviewOpen')
    vim.keymap.set('ca', 'Dvc', 'DiffviewClose')
  end
}
