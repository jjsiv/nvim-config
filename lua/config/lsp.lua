local lspconfig = require('lspconfig')
local coq = require('coq')

-- This file contains config for various LSPs
-- Each setup call should be guarded with is_executable to avoid errors setting up LSPs that aren't installed
-- setup doc here https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

--- @param program string
local function is_executable(program)
    return vim.fn.executable(program) == 1 and true or false
end

-- Lua LSP setup
if is_executable('lua-language-server') then
    lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
        cmd = { 'lua-language-server' },
        on_init = function(client)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                    return
                end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                    }
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                    -- library = vim.api.nvim_get_runtime_file("", true)
                }
            })
        end,
        settings = {
            Lua = {}
        }
    }))
end

-- Ansible LSP setup
if is_executable('ansible-language-server') then
    lspconfig.ansiblels.setup(coq.lsp_ensure_capabilities({
        cmd = { 'ansible-language-server', '--stdio' },
        filetypes = { 'yaml.ansible' },
        settings = {
            ansible = {
                ansible = {
                    path = "ansible"
                },
                executionEnvironment = {
                    enabled = false
                },
                python = {
                    interpreterPath = "python"
                },
                validation = {
                    enabled = true,
                    lint = {
                        enabled = is_executable('ansible-lint'),
                        path = "ansible-lint"
                    }
                }
            }
        }
    }))
end

-- Bash LSP setup
if is_executable('bash-language-server') then
    lspconfig.bashls.setup(coq.lsp_ensure_capabilities({
        cmd = { 'bash-language-server', 'start' },
        filetypes = { 'sh' },
    }))
end

-- Python LSP setup
if is_executable('pyright-langserver') then
    lspconfig.pyright.setup(coq.lsp_ensure_capabilities({
        cmd = { 'pyright-langserver', '--stdio' },
        filetypes = { 'python' },
    }))
end

-- Helm LSP setup
if is_executable('helm_ls') then
    lspconfig.helm_ls.setup(coq.lsp_ensure_capabilities({
        cmd = { 'helm_ls', 'serve' },
        filetypes = { 'helm' },
    }))
end

-- Go LSP setup
if is_executable('gopls') then
    lspconfig.gopls.setup(coq.lsp_ensure_capabilities({
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    }))
end

-- Markdown LSP setup
if is_executable('marksman') then
    lspconfig.marksman.setup(coq.lsp_ensure_capabilities({
        cmd = { 'marksman', 'server' },
        filetypes = { 'markdown', 'markdown.mdx' },
    }))
end
