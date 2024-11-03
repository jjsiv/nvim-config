return {
    "williamboman/mason.nvim",
    config = function()
        require('mason').setup()
        local registry = require('mason-registry')

        registry:on(
            "package:handle",
            vim.schedule_wrap(function(pkg, handle)
                print(string.format("Installing %s", pkg.name))
            end)
        )

        registry:on(
            "package:install:success",
            vim.schedule_wrap(function(pkg, handle)
                print(string.format("Successfully installed %s", pkg.name))
            end)
        )

        registry:on(
            "package:install:failed",
            vim.schedule_wrap(function(pkg, handle)
                print(string.format("Failed to install %s", pkg.name))
            end)
        )

        ---@param packages table<string>
        local function install_packages(packages)
            for _, package in ipairs(packages) do
                local installed = registry.is_installed(package)
                if not installed then
                    if registry.has_package(package) then
                        registry.get_package(package):install()
                    end
                end
            end
        end

        install_packages({
            'prettier',
            'ansible-lint'
        })

    end,
}
