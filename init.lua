require("config.lazy")

-- colorscheme
vim.api.nvim_cmd({
  cmd = "colorscheme",
  args = { "kanagawa-dragon" }
},
  {})

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



-- :h option-list for all options
-- :h <option> for doc about option
set_opts({
  number = true,
  relativenumber = true,
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
  cursorline = true,
  completeopt = { 'menu', 'menuone' }
})

-- next buffer ctrl+n
vim.keymap.set('n', "<C-n>", "<cmd>bnext<CR>", {})
vim.keymap.set('n', "<C-p>", "<cmd>bprev<CR>", {})

-- contains setups for various LSPs. Each LSP is only activated when installed
require('config.lsp')
