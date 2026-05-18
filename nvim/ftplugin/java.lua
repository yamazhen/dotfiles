vim.pack.add({ { src = "https://github.com/mfussenegger/nvim-jdtls" } })

local root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" })
local workspace = os.getenv("HOME") .. "/jdtls/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local lombok = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"

local config = {
	name = "jdtls",
	cmd = {
		"jdtls",
		"-data",
		workspace,
		"--jvm-arg=-javaagent:" .. lombok,
		"--jvm-arg=-XX:+UseParallelGC",
		"--jvm-arg=-XX:GCTimeRatio=4",
		"--jvm-arg=-XX:AdaptiveSizePolicyWeight=90",
		"--jvm-arg=-XX:+UseStringDeduplication",
		"--jvm-arg=-Xmx2G",
		"--jvm-arg=-Xms100m",
	},
	root_dir = root_dir,
	settings = {
		java = {
			eclipse = { downloadSources = true },
			maven = { downloadSources = true },
			signatureHelp = { enabled = true },
			completion = { guessMethodArguments = true },
			configuration = { updateBuildConfiguration = "interative" },
		},
	},
}
require("jdtls").start_or_attach(config)
