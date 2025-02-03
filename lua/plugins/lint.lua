return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      python = { 'ruff' },
      yaml = { 'yamllint' },
    }

    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end
}
