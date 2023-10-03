local HOME = os.getenv("HOME")

return {
	on_attach = require("lsp-config.handlers").on_attach,
	capabilities = require("lsp-config.handlers").capabilities,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				reportWildcardImportFromLibrary = "none",
				reportUnusedImport = "none",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "off",
				stubPath = HOME .. "/.local/share/nvim/mason/registry/typings/",
			},
		},
	},
}
