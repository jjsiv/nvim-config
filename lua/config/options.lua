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
  clipboard = "unnamedplus",
}

for opt, value in pairs(opts) do
  if type(value) ~= "table" then
    vim.o[opt] = value
  else
    vim.opt[opt] = value
  end
end

vim.diagnostic.config({
  virtual_text = true,
})

vim.o.winborder = "rounded"
vim.o.autocomplete = false

-- Experimental UI2: floating cmdline and messages
vim.o.cmdheight = 0
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    targets = {
      [""] = "msg",
      empty = "cmd",
      bufwrite = "msg",
      confirm = "cmd",
      emsg = "pager",
      echo = "msg",
      echomsg = "msg",
      echoerr = "pager",
      completion = "cmd",
      list_cmd = "pager",
      lua_error = "pager",
      lua_print = "msg",
      progress = "pager",
      rpc_error = "pager",
      quickfix = "msg",
      search_cmd = "cmd",
      search_count = "cmd",
      shell_cmd = "pager",
      shell_err = "pager",
      shell_out = "pager",
      shell_ret = "msg",
      undo = "msg",
      verbose = "pager",
      wildlist = "cmd",
      wmsg = "msg",
      typed_cmd = "cmd",
    },
    cmd = {
      height = 0.5,
    },
    dialog = {
      height = 0.5,
    },
    msg = {
      height = 0.3,
      timeout = 5000,
    },
    pager = {
      height = 0.5,
    },
  },
})
