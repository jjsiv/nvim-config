vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "*/.gitlab-ci.yml",
    "*/.gitlab-ci.yaml",
  },
  callback = function()
    vim.bo.filetype = "yaml.gitlab"
  end,
})
