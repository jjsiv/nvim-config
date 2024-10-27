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


---@param remaps table<table<string, string>>
local function set_keymappings(remaps)
    for k, remap in pairs(remaps) do
        vim.keymap.set(remap["mode"], remap["from"], remap["to"])
    end
end

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
    scrolloff = 5,
    completeopt = { 'menu', 'menuone' }
})

set_colorscheme("default")

-- a list of remaps, each entry must be a map<mode=string, from=string, to=string>
set_keymappings({
    {mode = "n", from = "<C-d>", to = "<C-d>zz"},
    {mode = "n", from = "<C-u>", to = "<C-u>zz"},
})

