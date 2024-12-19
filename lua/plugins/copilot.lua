return {
  'zbirenbaum/copilot.lua',
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = true,
      keymap = {
        jump_prev = "<M-p>",
        jump_next = "<M-n>",
      }
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
    }
  },
}
