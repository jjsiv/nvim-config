return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      python = { 'ruff_format' },
      go = { 'gofmt', 'goimports' },
      sh = { 'shfmt' },
      yaml = { 'prettier' },
      json = { 'prettier' },
      markdown = { 'prettier' },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = 'fallback',
    }
  },
}
