local jdtls = require("jdtls")
local mason_registry = require("mason-registry")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

local function get_jdtls_paths()
	local jdtls_pkg = mason_registry.get_package("jdtls")
	local lombok_pkg = mason_registry.get_package("lombok-nightly")

	local jdtls_path = jdtls_pkg:get_install_path()
	local lombok_path = lombok_pkg:get_install_path() .. "/lombok.jar"

	local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
	local config = jdtls_path .. "/config_mac"
	return launcher, config, lombok_path
end

local function get_workspace()
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	return os.getenv("HOME") .. "/jdtls/workspace/" .. project_name
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
local workspace_dir = get_workspace()

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local cmd = {
	"java",
	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	"-Dosgi.bundles.defaultStartLevel=4",
	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	"-Dlog.protocol=true",
	"-Dlog.level=INFO",
	"-Xms256m",
	"-Xmx1g",
	"-XX:+UseParallelGC",
	"-XX:GCTimeRatio=4",
	"-XX:AdaptiveSizePolicyWeight=90",
	"--add-modules=ALL-SYSTEM",
	"--add-opens",
	"java.base/java.util=ALL-UNNAMED",
	"--add-opens",
	"java.base/java.lang=ALL-UNNAMED",
	"--add-opens",
	"java.base/sun.nio.fs=ALL-UNNAMED",
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
				url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
			},
		},
		eclipse = {
			downloadSource = true,
		},
		maven = {
			downloadSources = true,
			updateSnapshots = true,
		},
		signatureHelp = {
			enabled = true,
			description = {
				enabled = true,
			},
		},
		contentProvider = {
			preferred = "fernflower",
		},
		saveActions = {
			organizeImports = true,
		},
		import = {
			maven = {
				enabled = true,
			},
			exclusions = {
				"*/test/**",
				"**/node_modules/**",
				"**/.metadata/**",
				"**/archetype-resources/**",
				"**/META-INF/maven/**",
			},
		},
		completion = {
			filteredTypes = {
				"com.sun.*",
				"io.micrometer.shaded.*",
				"java.awt.*",
				"jdk.*",
				"sun.*",
			},
			mportOrder = {
				"java",
				"jakarta",
				"org.springframework",
				"org",
				"com",
				"lombok",
				"javax",
				"",
				"#",
			},
			enabled = true,
			guessMethodArguments = true,
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
				codeStyle = "STRING_BUILDER_CHAINED",
			},
			hashCodeEquals = {
				useJava7Objects = true,
				useInstanceof = true,
			},
			useBlocks = true,
		},
		configuration = {
			maven = {
				notCoveredPluginExecutionSeverity = "warning",
			},
			runtimes = {
				{
					name = "JavaSE-21",
					path = "/Users/zhen/.sdkman/candidates/java/21.0.5-amzn",
					default = true,
				},
			},
			updateBuildConfiguration = "automatic",
		},
		inlayHints = {
			parameterNames = {
				enabled = "all",
			},
		},
		maxConcurrentBuilds = 2,
		errors = {
			incompleteClasspath = {
				severity = "warning",
			},
		},
	},
}

require("jdtls").start_or_attach({
	cmd = cmd,
	root_dir = root_dir,
	settings = settings,
	capabilities = capabilities,
	init_options = {
		extendedClientCapabilities = extendedClientCapabilities,
	},
})
