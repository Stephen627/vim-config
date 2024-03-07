local notify = require "mason-core.notify"

local function resolve_package(server_name)
    local registry = require "mason-registry"
    local Optional = require "mason-core.optional"

    return Optional.of_nilable(server_name):map(function (package_name)
        local ok, pkg = pcall(registry.get_package, package_name)
        if ok then
            return pkg
        end
    end)
end

return function(ensure_installed)
    for _, server_identifier in ipairs(ensure_installed) do
        local Package = require "mason-core.package"

        local server_name, version = Package.Parse(server_identifier)
        resolve_package(server_name)
            :if_present(
                ---@param pkg Package
                function(pkg)
                    if not pkg:is_installed() then
                        notify(("[mason-dap] installing %s"):format(server_name))
                        pkg:install {
                            version = version,
                        }
                    end
                end
            )
            :if_not_present(function()
                notify(
                    ("[mason-dap] Server %q is not a valid entry in ensure_installed."):format(
                        server_name
                    ),
                    vim.log.levels.WARN
                )
            end)
    end
end
