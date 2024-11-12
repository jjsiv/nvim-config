require("config.lazy")

---@param opts table<string, any>
local function set_opts(opts)
  for opt, value in pairs(opts) do
    if (type(value) ~= "table") then
      vim.o[opt] = value
    else
      vim.opt[opt] = value
    end
  end
end


---@param colorscheme? string
local function set_colorscheme(colorscheme)
  if (type(colorscheme) ~= "nil") then
    vim.api.nvim_cmd({
      cmd = "colorscheme",
      args = { colorscheme }
    },
      {})
  end
  -- set gold color to line numbers, should be visible on most schemes
  -- set at the end to overwrite any colorscheme config
  --vim.api.nvim_set_hl(0, "LineNr", { bold = true, bg = "#2A2A37" })
end

set_colorscheme("kanagawa-dragon")

-- :h option-list for all options
-- :h <option> for doc about option
set_opts({
  number = true,
  relativenumber = true,
  -- indentation. convert tab to spaces, set actual tabs to be different width (to spot tabs better)
  tabstop = 8,
  softtabstop = 8,
  shiftwidth = 4,
  expandtab = true,
  showmatch = true,
  ignorecase = true,
  smartcase = true,
  termguicolors = true,
  scrolloff = 10,
  splitright = true,
  completeopt = { 'menu', 'menuone' }
})

-- next buffer ctrl+n
vim.keymap.set('n', "<C-n>", "<cmd>bnext<CR>", {})
vim.keymap.set('n', "<C-p>", "<cmd>bprev<CR>", {})

-- contains setups for various LSPs. Each LSP is only activated when installed
require('config.lsp')
