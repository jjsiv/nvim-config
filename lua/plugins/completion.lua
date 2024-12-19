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
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = "copilot", priority = 10 },
      }),
      mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = false }),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
      },
      sorting = {
        priority_weight = 1,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          --cmp.config.compare.offset,
          --cmp.config.compare.exact,
          --cmp.config.compare.score,
          --cmp.config.compare.recently_used,
          --cmp.config.compare.locality,
          --cmp.config.compare.kind,
          --cmp.config.compare.sort_text,
          --cmp.config.compare.length,
          --cmp.config.compare.order,
        },
      }
    })

    require("luasnip.loaders.from_snipmate").lazy_load()
  end,
}
