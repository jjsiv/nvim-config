return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
  },
  version = "1.*",

  ---@module 'blink.cmp'
  opts = {
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },

      ["<Tab>"] = { "accept", "fallback" },
      ["<C-h>"] = { "snippet_forward" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-n>"] = { "select_next", "fallback_to_mappings" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = true,
      },
      menu = {
        draw = {
          align_to = "label",
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", gap = 1 },
            { "kind" },
          },
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = {
      enabled = true,
    },
  },
  opts_extend = { "sources.default" },
}
