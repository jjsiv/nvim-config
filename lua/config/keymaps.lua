local tsutils = require('utils')
local luasnip = require('luasnip')
local lazy = require('lazy.core.config')

---Returns true if the plugin is loaded.
---@param plugin string
---@return boolean
local function plugin_loaded(plugin)
  return lazy.plugins[plugin] ~= nil
end

-- next buffer ctrl+n
vim.keymap.set('n', "<C-n>", "<cmd>bnext<CR>", {})
vim.keymap.set('n', "<C-p>", "<cmd>bprev<CR>", {})

vim.keymap.set('i', '<C-h>', function() luasnip.jump(1) end, {})
vim.keymap.set('i', '<C-g>', function() luasnip.jump(-1) end, {})

-- other LSP related keybindings
vim.keymap.set('n', '<Leader>rn', function() vim.lsp.buf.rename() end, {})
vim.keymap.set('n', '<Leader>d', function() vim.diagnostic.open_float() end, {})

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

-- CopilotChat
if plugin_loaded('CopilotChat.nvim') then
  vim.keymap.set('n', '<Leader>cc', ':CopilotChatOpen<CR>')
end

-- diffview shortnames
if plugin_loaded('diffview.nvim') then
  vim.keymap.set('ca', 'Dvo', 'DiffviewOpen')
  vim.keymap.set('ca', 'Dvc', 'DiffviewClose')
end

-- oil.nvim
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
