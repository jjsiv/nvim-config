return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    local builtin = require('telescope.builtin')
    -- keymaps for telescope
    -- add some LSP pickers later
    vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ no_ignore = true}) end, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Telescope marks' })
    -- LSP pickers
    vim.keymap.set('n', '<leader>lr', builtin.lsp_references, { desc = 'Telescope LSP references'} )
    vim.keymap.set('n', '<leader>li', builtin.lsp_incoming_calls, { desc = 'Telescope LSP incoming calls' })
    vim.keymap.set('n', '<leader>lo', builtin.lsp_outgoing_calls, { desc = 'Telescope LSP outgoing calls' })
    vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = 'Telescope LSP definitions' })
    vim.keymap.set('n', '<leader>lt', builtin.lsp_type_definitions, { desc = 'Telescope LSP type definitions' })
    -- Git pickers
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope Git commits' })
    vim.keymap.set('n', '<leader>gcc', builtin.git_bcommits, { desc = 'Telescope Git buffer commits' })
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope Git branches' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope Git status' })
    -- Keymap picker
    vim.keymap.set('n', '<leader>k', builtin.keymaps, { desc = 'Telescope keymaps' })
  end
}
