local grp = vim.api.nvim_create_augroup('sh', { clear = true })
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = { '*.sh' },
  group = grp,
  callback = function()
    vim.lsp.buf.format({async = false})
  end
})
