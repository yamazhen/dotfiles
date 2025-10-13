vim.pack.add({ { src = "https://github.com/mfussenegger/nvim-jdtls" } })

local jdtls = require("jdtls")
local mason = vim.fn.expand("~/.local/share/nvim/mason/packages")
local jdtls_path = mason .. "/jdtls"
local root_dir = jdtls.setup.find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }) or vim.fn.expand("%:p:h")
local workspace = os.getenv("HOME") .. "/jdtls/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

jdtls.start_or_attach({
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. mason .. "/lombok-nightly/lombok.jar",
		"-jar",
		vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		jdtls_path .. "/config_mac",
		"-data",
		workspace,
	},
	settings = {
		java = {
			format = { enabled = true },
			saveActions = { organizeImports = true },
		},
	},
})
