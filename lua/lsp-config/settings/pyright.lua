return {
	on_attach = require("lsp-config.handlers").on_attach,
	capabilities = require("lsp-config.handlers").capabilities,
	settings = {
		python = {
			analysis = {
				reportWildcardImportFromLibrary = "none",
				reportUnusedImport = "none",
			},
		},
	},
}
