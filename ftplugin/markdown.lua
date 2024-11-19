if vim.fn.executable('prettier') == 1 then
  vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = { '*.md' },
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
