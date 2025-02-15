return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      python = { 'ruff' },
      yaml = { 'yamllint' },
      markdown = { 'markdownlint' },
    }

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "InsertEnter", "BufEnter" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end
}
