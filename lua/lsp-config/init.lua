local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

require("lsp-endhints").setup({
	icons = {
		type = "󰜁 ",
		parameter = "󰏪 ",
		offspec = " ", -- hint kind not defined in official LSP spec
		unknown = " ", -- hint kind is nil
	},
	label = {
		truncateAtChars = 20,
		padding = 1,
		marginLeft = 0,
		sameKindSeparator = ", ",
	},
	autoEnableHints = true,
})

require("lsp-config.mason")
require("lsp-config.handlers").setup()
require("lsp-config.null-ls")
require("lsp-config.tsserver")
