return {
	url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
	ft = { "java" },
	config = function()
		local data_path = vim.fn.stdpath("data")
		local mason_root = data_path .. "/mason"
		local analyzer_jar = mason_root .. "/share/sonarlint-analyzers/sonarjava.jar"

		require("sonarlint").setup({
			server = {
				cmd = {
					"sonarlint-language-server",
					"-stdio",
					"-analyzers",
					analyzer_jar,
				},
				settings = {
					sonarlint = {
						rules = {
							["java:S1541"] = { level = "on", parameters = { threshold = 15 } },
							["java:S138"] = { level = "on", parameters = { max = 75 } },
							["java:S1200"] = { level = "on", parameters = { max = 200 } },
							["java:S107"] = { level = "on", parameters = { max = 7 } },
							["java:S1067"] = { level = "on", parameters = { max = 3 } },

							["java:S2259"] = { level = "on" },
							["java:S2095"] = { level = "on" },
							["java:S1854"] = { level = "on" },
							["java:S1068"] = { level = "on" },
							["java:S1481"] = { level = "on" },
							["java:S1764"] = { level = "on" },

							["java:S2077"] = { level = "on" },
							["java:S5542"] = { level = "on" },
							["java:S2092"] = { level = "on" },
							["java:S4425"] = { level = "on" },

							["java:S1118"] = { level = "on" },
							["java:S1132"] = { level = "on" },
							["java:S1172"] = { level = "on" },
							["java:S1133"] = { level = "on" },
							["java:S1134"] = { level = "on" },
							["java:S1135"] = { level = "on" },

							["java:S101"] = { level = "on", parameters = { format = "^[A-Z][a-zA-Z0-9]*$" } },
							["java:S100"] = { level = "on", parameters = { format = "^[a-z][a-zA-Z0-9]*$" } },
							["java:S116"] = { level = "on", parameters = { format = "^[a-z][a-zA-Z0-9]*$" } },
							["java:S117"] = { level = "on", parameters = { format = "^[a-z][a-zA-Z0-9]*$" } },
							["java:S115"] = { level = "on", parameters = { format = "^[A-Z][A-Z0-9]*(_[A-Z0-9]+)*$" } },

							["java:S103"] = { level = "on", parameters = { maximumLineLength = 120 } },
							["java:S1186"] = { level = "on" },
							["java:S1171"] = { level = "on" },
							["java:S1157"] = { level = "on" },
						},
					},
				},
			},
			filetypes = { "java" },
		})
	end,
}
