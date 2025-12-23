return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    local linters = require("lint").linters

    lint.linters_by_ft = {
      python = { "ruff" },
      yaml = { "yamllint" },
      markdown = {},
      terraform = { "tflint" },
    }

    vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "InsertEnter", "BufEnter" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
