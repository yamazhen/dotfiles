local jdtls = require("jdtls")

local MASON_PATH = vim.fn.expand("~/.local/share/nvim/mason/packages")
local CONFIG_PATH = vim.fn.stdpath("config")
local WORKSPACE_BASE = os.getenv("HOME") .. "/jdtls/workspace"

local function get_jdtls_paths()
	local jdtls_path = MASON_PATH .. "/jdtls"
	return {
		launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		config = jdtls_path .. "/config_mac",
		lombok = MASON_PATH .. "/lombok-nightly/lombok.jar",
	}
end

local function get_workspace()
	local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" })
		or vim.fn.expand("%:p:h")

	local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
	return WORKSPACE_BASE .. "/" .. project_name
end

local function get_bundles()
	local bundles = {}

	local java_debug =
		vim.fn.glob(MASON_PATH .. "/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
	if java_debug ~= "" then
		table.insert(bundles, java_debug)
	end

	local java_test = vim.fn.glob(MASON_PATH .. "/java-test/extension/server/*.jar", true)
	if java_test ~= "" then
		for jar in string.gmatch(java_test, "[^\n]+") do
			if jar ~= "" then
				table.insert(bundles, jar)
			end
		end
	end

	return bundles
end

local function setup_keybindings(bufnr)
	local opts = { silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>tc", jdtls.test_class, opts)
	vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, opts)
end

local paths = get_jdtls_paths()
local bundles = get_bundles()

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

config.capabilities = require("blink.cmp").get_lsp_capabilities()

config.init_options = {
	extendedClientCapabilities = vim.tbl_extend("force", jdtls.extendedClientCapabilities, {
		resolveAdditionalTextEditsSupport = true,
	}),
	bundles = bundles,
}

config.on_attach = function(_, bufnr)
	jdtls.setup_dap({ hotcodereplace = "auto" })
	require("jdtls.dap").setup_dap_main_class_configs()

	setup_keybindings(bufnr)
end

require("jdtls").start_or_attach(config)
