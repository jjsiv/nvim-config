-- Go uses actual tabs
vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.tabstop = 4

--vim.api.nvim_create_autocmd({'BufWrite'}, {
--  pattern = { '*.go' },
--  callback = function()
--    local current_buffer = 0
--    local filepath = vim.api.nvim_buf_get_name(current_buffer)
--    vim.fn.jobstart(
--      { 'go', 'fmt', filepath },
--      { on_exit = function(_, code, _)
--        if code == 0 then
--          vim.cmd.edit()
--        end
--      end})
--  end
--})
