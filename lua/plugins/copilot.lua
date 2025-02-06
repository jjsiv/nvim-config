return {
  {
    'zbirenbaum/copilot.lua',
    dependencies = {
      'zbirenbaum/copilot-cmp',
    },
    cmd = "Copilot",
    enabled = false,
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = { enabled = true, auto_refresh = true },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          hide_during_completion = true,
        },
      })

      require("copilot_cmp").setup()
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    build = "make tiktoken",
    enabled = true,
    opts = {
      model = 'claude-3.5-sonnet'
    }
  },
}
