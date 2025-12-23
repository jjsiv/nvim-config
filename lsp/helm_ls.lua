return {
  cmd = { "helm_ls", "serve" },
  filetypes = { "helm" },
  settings = {
    ["helm-ls"] = {
      yamlls = {
        enabled = false,
      },
    },
  },
}
