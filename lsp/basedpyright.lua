return {
  cmd = { "basedpyright-langserver", "--stdio" },
  root_markers = { ".git" },
  filetypes = { "python" },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
}
