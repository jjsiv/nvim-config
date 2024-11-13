return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    { "ms-jpq/coq_nvim", branch = "coq" },
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
  },
  init = function()
    vim.g.coq_settings = {
      auto_start = "shut-up",
      keymap = {
        recommended = false,
        pre_select = false
      },
      limits = {
        completion_auto_timeout = 0,
      }
    }
    -- mappings for coq_nvim
    -- remap tab to ctrl+n in popupmenu
    vim.keymap.set('i', '<Tab>', function()
      return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
    end)
    -- remap shift+tab to ctrl+p in popupmenu
    vim.keymap.set('i', '<S-Tab>', function()
      return vim.fn.pumvisible() == 1 and "<C-p>" or "<BS>"
    end)
    -- do ctrl+y when tab is pressed in a popumenu
    vim.keymap.set('i', '<Tab>', function()
      if vim.fn.pumvisible() == 1 then return "<C-y>" else return "<Tab>" end
    end, { expr = true })

    -- other LSP related keybindings
    vim.keymap.set('n', '<Leader>rn', function() vim.lsp.buf.rename() end, {})
    vim.keymap.set('n', '<Leader>d', function() vim.diagnostic.open_float() end, {})
  end,
}
