return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function ()
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client then
                    client.server_capabilities.semanticTokensProvider = nil
                end
            end,
        })
        local mason_registry = require('mason-registry')
        local function get_jdtls()
            local jdtls = mason_registry.get_package('jdtls')
            local lombok = mason_registry.get_package('lombok-nightly')
            local jdtls_path = jdtls:get_install_path()
            local lombok_path = lombok:get_install_path()
            local launcher = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
            local config = jdtls_path .. '/config_mac'
            local lombok_config = lombok_path .. '/lombok.jar'
            return launcher, config, lombok_config
        end
        local function get_workspace()
            local home = os.getenv("HOME")
            local workspace_path = home .. '/jdtls/workspace/'
            local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
            local workspace_dir = workspace_path .. project_name
            return workspace_dir
        end

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function ()
                local jdtls = require('jdtls')
                local launcher, os_config, lombok = get_jdtls()
                local workspace_dir = get_workspace()
                local root_dir = jdtls.setup.find_root({'.git','mvnw','gradlew','pom.xml','build.gradle'})
                local capabilities = {
                    workspace = {
                        configuration = true,
                    },
                    textDocument = {
                        completion = {
                            snippetSupport = false,
                        },
                    },
                }
                local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
                for k,v in pairs(lsp_capabilities) do
                    capabilities[k] = v
                end
                local extendedClientCapabilities = jdtls.extendedClientCapabilities
                extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
                local cmd = {
                    "java",
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.protocol=true",
                    "-Dlog.level=ALL",
                    "-Xmx1g",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens",
                    "java.base/java.util=ALL-UNNAMED",
                    "--add-opens",
                    "java.base/java.lang=ALL-UNNAMED",
                    "-javaagent:" .. lombok,
                    "-jar",
                    launcher,
                    "-configuration",
                    os_config,
                    "-data",
                    workspace_dir,
                }
                local settings = {
                    java = {
                        format = {
                            enabled = true,
                            settings = {
                                url = 'https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml',
                            },
                        },
                        eclipse = {
                            downloadSource = true,
                        },
                        maven = {
                            downloadSources = true,
                        },
                        signatureHelp = {
                            enabled = true,
                        },
                        contentProvider = {
                            preferred = 'fernflower',
                        },
                        saveActions = {
                            organizeImports = true,
                        },
                        completion = {
                            favoriteStaticMembers = {
                                'org.junit.jupiter.api.Assertions.*',
                                'org.mockito.Mockito.*',
                            },
                            filteredTypes = {
                                'com.sun.*',
                                'io.micrometer.shaded.*',
                                'java.awt.*',
                                'jdk.*',
                                'sun.*',
                            },
                            importOrder = {
                                'com',
                                'lombok',
                                'org',
                                'jakarta',
                                'javax',
                                'java',
                                '',
                                '#',
                            },
                        },
                        sources = {
                            organizeImports = {
                                starThreshold = 9999,
                                staticThreshold = 9999,
                            },
                        },
                        codeGeneration = {
                            toString = {
                                template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
                            },
                            hashCodeEquals = {
                                useJava7Objects = true,
                            },
                            useBlocks = true,
                        },
                        configuration = {
                            runtimes = {
                                {
                                    name = 'JavaSE-21',
                                    path = '/Users/zhen/.sdkman/candidates/java/21.0.5-amzn',
                                },
                            },
                            updateBuildConfiguration = 'interactive',
                        },
                        inlayHints = {
                            parameterNames = {
                                enabled = 'all',
                            },
                        },
                    },
                }
                local init_options = {
                    extendedClientCapabilities = extendedClientCapabilities,
                }
                local config = {
                    cmd = cmd,
                    root_dir = root_dir,
                    settings = settings,
                    capabilities = capabilities,
                    init_options = init_options
                }
                require('jdtls').start_or_attach(config)
            end
        })
    end
}
