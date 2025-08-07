local jdtls = require("jdtls")

local BREW_PREFIX = vim.fn.system("brew --prefix"):gsub("\n", "")
local CONFIG_PATH = vim.fn.stdpath("config")
local WORKSPACE_BASE = os.getenv("HOME") .. "/jdtls/workspace"

local function get_jdtls_paths()
    local jdtls_path = BREW_PREFIX .. "/opt/jdtls"
    return {
        launcher = vim.fn.glob(jdtls_path .. "/libexec/plugins/org.eclipse.equinox.launcher_*.jar"),
        config = jdtls_path .. "/libexec/config_mac",
        lombok = BREW_PREFIX .. "/opt/lombok/libexec/lombok.jar",
    }
end

local function get_workspace()
    local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
        or vim.fn.expand("%:p:h")

    local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
    return WORKSPACE_BASE .. "/" .. project_name
end

local paths = get_jdtls_paths()

local config = {}

config.cmd = {
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
    "-javaagent:" .. paths.lombok,
    "-jar",
    paths.launcher,
    "-configuration",
    paths.config,
    "-data",
    get_workspace(),
}

config.settings = {
    java = {
        format = {
            enabled = true,
            settings = {
                url = CONFIG_PATH .. "/lang_servers/intellij-java-google-style.xml",
                profile = "GoogleStyle",
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
            preferred = "fernflower",
        },
        saveActions = {
            organizeImports = true,
        },
        completion = {
            filteredTypes = {
                "com.sun.*",
                "io.micrometer.shaded.*",
                "java.awt.*",
                "jdk.*",
                "sun.*",
            },
            importOrder = {
                "java",
                "jakarta",
                "javax",
                "com",
                "org",
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
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            hashCodeEquals = {
                useJava7Objects = true,
            },
            useBlocks = true,
        },
        configuration = {
            updateBuildConfiguration = "interactive",
        },
        referencesCodeLens = {
            enabled = true,
        },
        inlayHints = {
            parameterNames = {
                enabled = "all",
            },
        },
    },
}

config.capabilities = vim.lsp.protocol.make_client_capabilities()

config.init_options = {
    extendedClientCapabilities = vim.tbl_extend("force", jdtls.extendedClientCapabilities, {
        resolveAdditionalTextEditsSupport = true,
    }),
}

vim.cmd("packadd nvim-jdtls")
require("jdtls").start_or_attach(config)
