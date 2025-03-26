-- :h option-list for all options
-- :h <option> for doc about option
local opts = {
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
  completeopt = { "menu", "menuone", "noselect", "noinsert", "popup" },
}

for opt, value in pairs(opts) do
  if type(value) ~= "table" then
    vim.o[opt] = value
  else
    vim.opt[opt] = value
  end
end

vim.diagnostic.config({
  virtual_lines = true,
})

vim.o.winborder = "rounded"
