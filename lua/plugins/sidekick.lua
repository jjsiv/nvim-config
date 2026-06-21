return {
  "folke/sidekick.nvim",
  lazy = false,
  config = function()
    require("sidekick").setup({
      nes = {
        enabled = false,
      },
      cli = {
        mux = {
          enabled = true,
          backend = "tmux",
          create = "terminal",
        },
        prompts = {
          explain_in_depth = "Explain this for someone without experience on the subject. {this}",
        },
        tools = {
          copilot = {
            cmd = { "copilot", "--banner", "--allow-all-tools" },
          },
        },
        win = {
          keys = {
            prompt = { "<c-s>", "prompt", mode = "t", desc = "insert prompt or context" },
          },
        },
      },
    })
  end,
  keys = {
    {
      "<leader>cf",
      function()
        require("sidekick.cli").focus()
      end,
      desc = "Sidekick Focus",
      mode = { "n", "x" },
    },
    {
      "<leader>cc",
      function()
        require("sidekick.cli").toggle({ name = "claude", focus = true })
      end,
      desc = "Toggle Claude",
    },
    {
      "<leader>cd",
      function()
        require("sidekick.cli").hide()
      end,
      desc = "Hide CLI",
    },
    {
      "<leader>cs",
      function()
        require("sidekick.cli").show()
      end,
      desc = "Show CLI",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
  },
}
