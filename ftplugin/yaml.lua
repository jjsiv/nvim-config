if vim.fn.executable('prettier') == 1 then
  local grp = vim.api.nvim_create_augroup('yaml-prettier', { clear = true })
  vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = { '*.yaml', '*.yml' },
    group = grp,
    callback = function()
      local current_buffer = 0
      local filepath = vim.api.nvim_buf_get_name(current_buffer)
      vim.fn.jobstart(
        { 'prettier', '-w', filepath },
        { on_exit = function(_, code, _)
          if code == 0 then
            vim.cmd.edit()
          end
        end})
    end
  })
end
