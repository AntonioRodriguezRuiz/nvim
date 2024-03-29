local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

require("lsp-config.mason")
require("lsp-config.handlers").setup()
require("lsp-config.null-ls")
require("lsp-config.tsserver")
