local utils = require('utils')

-- Prettier config
if utils.is_executable('prettier') then
  local grp = vim.api.nvim_create_augroup('prettier', { clear = true })
  vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = { '*.md', '*.json', '*.yaml', '*.yml' },
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

-- autopep8 config
if utils.is_executable('autopep8') then
  local grp = vim.api.nvim_create_augroup('autopep8', { clear = true })
  vim.api.nvim_create_autocmd({'BufWritePre'}, {
    pattern = { '*.py' },
    group = grp,
    callback = function()
      local current_buffer = 0
      local filepath = vim.api.nvim_buf_get_name(current_buffer)
      vim.fn.jobstart(
        { 'autopep8', '-i', filepath },
        { on_exit = function(_, code, _)
          if code == 0 then
            vim.cmd.edit()
          end
        end})
    end
  })
end
