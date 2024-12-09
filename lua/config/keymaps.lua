local tsutils = require('utils')
local luasnip = require('luasnip')

-- next buffer ctrl+n
vim.keymap.set('n', "<C-n>", "<cmd>bnext<CR>", {})
vim.keymap.set('n', "<C-p>", "<cmd>bprev<CR>", {})

-- mappings for coq_nvim
-- remap tab to ctrl+n in popupmenu
--vim.keymap.set('i', '<Tab>', function()
--  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
--end)
---- remap shift+tab to ctrl+p in popupmenu
--vim.keymap.set('i', '<S-Tab>', function()
--  return vim.fn.pumvisible() == 1 and "<C-p>" or "<BS>"
--end)
---- do ctrl+y when tab is pressed in a popumenu
--vim.keymap.set('i', '<Tab>', function()
--  if vim.fn.pumvisible() == 1 then return "<C-y>" else return "<Tab>" end
--end, { expr = true })

vim.keymap.set('i', '<C-h>', function() luasnip.jump(1) end, {})
vim.keymap.set('i', '<C-g>', function() luasnip.jump(-1) end, {})

-- other LSP related keybindings
vim.keymap.set('n', '<Leader>rn', function() vim.lsp.buf.rename() end, {})
vim.keymap.set('n', '<Leader>d', function() vim.diagnostic.open_float() end, {})

-- diffview shortnames
vim.keymap.set('ca', 'Dvo', 'DiffviewOpen')
vim.keymap.set('ca', 'Dvc', 'DiffviewClose')

-- go to function start
vim.keymap.set('n', 'gp', function()
  local node = tsutils.find_node_ancestor(
    vim.treesitter.get_node(),
    { 'function_declaration', 'method_declaration', 'function_definition' }
  )
  if not node then
    return nil
    end
  local row, col = node:field('name')[1]:start()
  vim.api.nvim_win_set_cursor(0, { row+1, col })
end, { desc = "Jump to function name"})

-- go to function end
vim.keymap.set('n', 'ge', function()
  local node = tsutils.find_node_ancestor(
    vim.treesitter.get_node(),
    { 'function_declaration', 'method_declaration', 'function_definition'}
  )
  if not node then
    return nil
  end
  local row, col = node:end_()
  vim.api.nvim_win_set_cursor(0, { row+1, col })
end, { desc = "Jump to function end"})
