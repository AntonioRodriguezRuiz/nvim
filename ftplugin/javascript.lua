local _, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- normal mode
	prefix = "<leader>",
	buffer = nil, -- global mappings. specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	J = {
		name = "JavaScript",
		o = { "<Esc><Cmd>lua require('typescript-tools.api').organize_imports()<CR>", "Organize Imports" },
	},
}

which_key.register(mappings, opts)

-- Autoformatting
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format{async=true}]])
