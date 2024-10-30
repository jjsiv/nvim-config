return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        { "ms-jpq/coq_nvim", branch = "coq" },
    },
    init = function()
        vim.g.coq_settings = {
            auto_start = true,
            keymap = {
                recommended = false,
                pre_select = false
            }
        }
    end,
}
