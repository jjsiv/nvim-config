return {
  'zbirenbaum/copilot.lua',
  dependencies = { 'zbirenbaum/copilot-cmp' },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = { enabled = true, auto_refresh = true },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        hide_during_completion = false,
      },
    })

    require("copilot_cmp").setup()
  end,
}
