return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml", "yaml.gitlab" },
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
