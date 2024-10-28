return { 
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "python", "go", "yaml", "json", "markdown"},
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
