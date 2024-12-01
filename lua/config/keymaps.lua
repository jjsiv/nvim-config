local tsutils = require('utils')

-- next buffer ctrl+n
vim.keymap.set('n', "<C-n>", "<cmd>bnext<CR>", {})
vim.keymap.set('n', "<C-p>", "<cmd>bprev<CR>", {})

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

-- diffview shortnames
vim.keymap.set('ca', 'Dvo', 'DiffviewOpen')
vim.keymap.set('ca', 'Dvc', 'DiffviewClose')

-- go to function start
vim.keymap.set('n', 'gp', function()
  local row, col, byte = tsutils.find_node_ancestor(
    vim.treesitter.get_node(),
    { 'function_declaration', 'method_declaration' }
  ):start()
  if row ~= nil then
    vim.fn.cursor(row+1, 0)
  end
end, {})

-- go to function end
vim.keymap.set('n', 'ge', function()
  local srow, scol, erow, ecol = tsutils.find_node_ancestor(
    vim.treesitter.get_node(),
    { 'function_declaration', 'method_declaration' }
  ):range()
  if erow ~= nil then
    vim.fn.cursor(erow+1, 0)
  end
end, {})

