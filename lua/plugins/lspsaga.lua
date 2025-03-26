return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    local lspsaga = require("lspsaga")

    lspsaga.setup({
      lightbulb = {
        enable = false,
      },
      callhierarchy = {
        keys = {
          vsplit = "<C-v>",
          toggle_or_req = "<CR>",
          shuttle = "<C-w>",
        },
      },
      definition = {
        keys = {
          edit = "<CR>",
          vsplit = "<C-v>",
        },
      },
      finder = {
        keys = {
          toggle_or_open = "<CR>",
          vsplit = "<C-v>",
        },
      },
      implement = {
        enable = true,
      },
    })

    vim.keymap.set(
      "n",
      "<Leader>cci",
      ":Lspsaga incoming_calls<CR>",
      { desc = "Incoming call hierarchy" }
    )
    vim.keymap.set(
      "n",
      "<Leader>cco",
      ":Lspsaga outgoing_calls<CR>",
      { desc = "Outgoing call hierarchy" }
    )
    vim.keymap.set("n", "<Leader>lr", ":Lspsaga finder<CR>", { desc = "LSP references" })
    vim.keymap.set(
      "n",
      "<Leader>lri",
      ":Lspsaga finder imp<CR>",
      { desc = "LSP interface implementations" }
    )
    vim.keymap.set("n", "<leader>ld", ":Lspsaga peek_definition<CR>", { desc = "LSP definitions" })
    vim.keymap.set(
      "n",
      "<leader>lt",
      ":Lspsaga peek_type_definition<CR>",
      { desc = "LSP type definitions" }
    )
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP hover doc" })
    vim.keymap.set("n", "<C-k>", ":Lspsaga hover_doc ++keep<CR>", { desc = "LSP hover doc keep" })
  end,
}
