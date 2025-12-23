return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    enabled = true,
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
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    enabled = true,
    opts = {
      model = "claude-4.5-sonnet",
    },
  },
}
