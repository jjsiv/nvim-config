return {
  'zbirenbaum/copilot.lua',
  dependencies = {
    'zbirenbaum/copilot-cmp',
    'CopilotC-Nvim/CopilotChat.nvim',
  },
  cmd = "Copilot",
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
    require("CopilotChat").setup()
  end,
}
