return {
    "williamboman/mason-lspconfig.nvim",
    priority = 60,
    opts = {
        ensure_installed = { 'lua_ls', 'ansiblels' },
        automatic_installation = false
    }
}
