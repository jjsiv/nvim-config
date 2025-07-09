return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local md = require("render-markdown")
    md.setup({
      completions = {
        blink = {
          enabled = true,
        },
      },
    })

    vim.keymap.set("ca", "MD", "RenderMarkdown")
  end,
}
