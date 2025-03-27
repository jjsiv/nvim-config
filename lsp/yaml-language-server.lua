return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      validate = true,
      completion = true,
    },
  },
}
