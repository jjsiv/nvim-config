local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local utils = require('utils')

-- This file contains config for various LSPs
-- Each setup call should be guarded with utils.is_executable to avoid errors setting up LSPs that aren't installed
-- setup doc here https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- Lua LSP setup
if utils.is_executable('lua-language-server') then
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    cmd = { 'lua-language-server' },
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
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
      Lua = {
        completion = {
          callSnippet = 'Replace',
        }
      }
    }
  })
end

-- Ansible LSP setup
if utils.is_executable('ansible-language-server') then
  lspconfig.ansiblels.setup({
    capabilities = capabilities,
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
            enabled = utils.is_executable('ansible-lint'),
            path = "ansible-lint"
          }
        }
      }
    }
  })
end

-- Bash LSP setup
if utils.is_executable('bash-language-server') then
  lspconfig.bashls.setup({
    capabilities = capabilities,
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh' },
  })
end

-- Python LSP setup
if utils.is_executable('pyright-langserver') then
  lspconfig.pyright.setup({
    capabilities = capabilities,
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
  })
end

if utils.is_executable('ruff') then
  lspconfig.ruff.setup({
    capabilities = capabilities,
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
  })
end

-- Helm LSP setup
if utils.is_executable('helm_ls') then
  lspconfig.helm_ls.setup({
    capabilities = capabilities,
    cmd = { 'helm_ls', 'serve' },
    filetypes = { 'helm' },
    settings = {
      ['helm-ls'] = {
        yamlls = {
          enabled = false,
        }
      }
    }
  })
end

-- Go LSP setup
if utils.is_executable('gopls') then
  lspconfig.gopls.setup({
    capabilities = capabilities,
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    settings = {
      gopls = {
        usePlaceholders = true,
      }
    }
  })
end

-- Markdown LSP setup
if utils.is_executable('marksman') then
  lspconfig.marksman.setup({
    capabilities = capabilities,
    cmd = { 'marksman', 'server' },
    filetypes = { 'markdown', 'markdown.mdx' },
  })
end

-- Terraform LSP setup
if utils.is_executable('terraform-ls') then
  lspconfig.terraformls.setup({
    capabilities = capabilities,
    cmd = { 'terraform-ls', 'serve' },
    filetypes = { 'terraform', 'terraform-vars', 'tf', 'tfvars' },
  })
end

-- C/C++ LSP setup
if utils.is_executable('clangd') then
  lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = { 'clangd' },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  })
end
--
-- yaml LSP setup
if utils.is_executable('yaml-language-server') then
  lspconfig.yamlls.setup({
    capabilities = capabilities,
    cmd = { 'yaml-language-server', '--stdio' },
    filetypes = { 'yaml' },
    settings = {
      yaml = {
        format = {
          enable = true,
        },
        validate = true,
        completion = true,
      },
    },
  })
end
