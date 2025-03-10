return {
  'hrsh7th/nvim-cmp',
  lazy = false,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    { 'L3MON4D3/LuaSnip', version = "v2.*", build = 'make install_jsregexp' },
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require('cmp')
    local ls = require('luasnip')
    cmp.setup({
      experimental = {
        ghost_text = true,
      },
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "copilot", priority = 2 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
      mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
      },
    })

    require("luasnip.loaders.from_snipmate").lazy_load()
  end,
}
