local jdtls = require("jdtls")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

local function get_jdtls_paths()
	-- hard coded path for now because mason-registry is not working
	local jdtls_path = vim.fn.expand("~/.local/share/nvim/mason/packages/jdtls")
	local lombok_path = vim.fn.expand("~/.local/share/nvim/mason/packages/lombok-nightly/lombok.jar")

	local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
	local config = jdtls_path .. "/config_mac"
	return launcher, config, lombok_path
end

local function get_workspace(root_dir)
	local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
	return os.getenv("HOME") .. "/jdtls/workspace/" .. project_name
end

local function get_init_options()
	local extendedClientCapabilities = jdtls.extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

	local dap_path = vim.fn.glob(
		"~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
	)

	return {
		extendedClientCapabilities = extendedClientCapabilities,
		bundles = {
			dap_path,
		},
	}
end

local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
if not root_dir then
	root_dir = vim.fn.expand("%:p:h")
end

local capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities.workspace = capabilities.workspace or {}
capabilities.workspace.configuration = true
capabilities.textDocument = capabilities.textDocument or {}
capabilities.textDocument.completion = capabilities.textDocument.completion or {}
capabilities.textDocument.completion.snippetSupport = false

local launcher, os_config, lombok = get_jdtls_paths()
local workspace_dir = get_workspace(root_dir)
local init_options = get_init_options()

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
				url = vim.fn.stdpath("config") .. "/lang_servers/intellij-java-google-style.xml",
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

local dap = require("dap")
dap.configurations.java = {
	{
		type = "java",
		request = "attach",
		name = "[ATTACH] Remote Debug",
		hostName = "127.0.0.1",
		port = 5005,
	},
}

require("jdtls").start_or_attach({
	cmd = cmd,
	root_dir = root_dir,
	settings = settings,
	capabilities = capabilities,
	init_options = init_options,
	on_attach = function(client, bufnr)
		jdtls.setup_dap({ hotcodereplace = "auto" })

		local opts = { buffer = bufnr, silent = true }
		vim.keymap.set("n", "<leader>tc", function()
			jdtls.test_class()
		end, opts)

		vim.keymap.set("n", "<leader>tm", function()
			jdtls.test_nearest_method()
		end, opts)
	end,
})
