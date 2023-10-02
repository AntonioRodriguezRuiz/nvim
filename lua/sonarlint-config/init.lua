local home = os.getenv("HOME")
MASON_PTH = home .. "/.local/share/nvim/mason/packages/sonarlint-language-server"

require("sonarlint-config.sonarlint").setup({
	server = {
		cmd = {
			MASON_PTH .. "/sonarlint-language-server",
			-- Ensure that sonarlint-language-server uses stdio channel
			"-stdio",
			"-analyzers",
			-- paths to the analyzers you need, using those for python and java in this example
			vim.fn.expand(MASON_PTH .. "/extension/analyzers/sonarpython.jar"),
			vim.fn.expand(MASON_PTH .. "/extension/analyzers/sonarcfamily.jar"),
			vim.fn.expand(MASON_PTH .. "/extension/analyzers/sonarjava.jar"),
		},
	},
	filetypes = {
		-- Tested and working
		"python",
		"cpp",
		-- Requires nvim-jdtls, otherwise an error message will be printed
		"java",
	},
})
