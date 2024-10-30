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
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#daa520" })
end

set_colorscheme("kanagawa-wave")

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
    completeopt = { 'menu', 'menuone', 'noselect'}
})

-- keymappings
-- center screen after hitting ctrl+d/u
vim.keymap.set("n", "<C-d>", "C-d>zz")
vim.keymap.set("n", "<C-u>", "C-u>zz")
-- remap tab to ctrl+n in popupmenu
vim.keymap.set('i', '<Tab>', function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end)
-- remap shift+tab to ctrl+p in popupmenu
vim.keymap.set('i', '<S-Tab>', function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<BS>"
end)
-- do ctrl+y when tab is pressed in a popumenu
vim.keymap.set('i', '<Tab>', function()
    if vim.fn.pumvisible() == 1 then return "<C-y>" else return "<Tab>" end
end, { expr = true })

-- contains setups for various LSPs. Each LSP is only activated when installed
require('config.lsp')

