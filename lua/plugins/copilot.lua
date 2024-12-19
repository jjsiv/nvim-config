return {
  'zbirenbaum/copilot.lua',
  dependencies = { 'zbirenbaum/copilot-cmp' },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = { enabled = false },
      suggestion = { enabled = false },
    })

    require("copilot_cmp").setup()
  end,
}
