return {
    "williamboman/mason-lspconfig.nvim",
    priority = 60,
    opts = {
        ensure_installed = { 'lua_ls', 'ansiblels', 'bashls', 'pyright', 'helm_ls', 'gopls', 'marksman' },
        automatic_installation = false
    }
}
