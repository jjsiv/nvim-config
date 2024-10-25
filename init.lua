---@param opts table<string, any>
function set_opts(opts)
    for opt, value in pairs(opts) do
	if (type(value) ~= "table") then
	    vim.o[opt] = value
        else
            vim.opt[opt] = value
	end
    end
end

--- :h option-list for all options
--- :h <option> for doc about option
opts = {
    relativenumber = true,
    --- indentation. convert tab to spaces, set actual tabs to be different width (to spot tabs better)
    tabstop = 8,
    softtabstop = 8,
    shiftwidth = 4,
    expandtab = true,
    showmatch = true,
    smartcase = true,
    termguicolors = true,
    completeopt = { 'menu', 'menuone' }
}

set_opts(opts)

showmatch
