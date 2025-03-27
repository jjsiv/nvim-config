return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.mod" },
  settings = {
    gopls = {
      usePlaceholders = true,
    },
  },
}
