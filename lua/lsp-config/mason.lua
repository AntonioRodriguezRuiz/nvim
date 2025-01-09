local servers = {
	"lua_ls",
	"pyright",
	"ruff",
	"jsonls",
	"rust_analyzer",
	"jdtls",
	"clangd",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})
require("mason-nvim-dap").setup({
	handlers = {
		function(config)
			-- all sources with no handler get passed here

			-- Keep original functionality
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp-config.handlers").on_attach,
		capabilities = require("lsp-config.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "lsp-config.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	if server == "rust_analyzer" then
		require("lsp-config.settings.rust")
		goto continue
	end

	if server == "ruff" then
		local ruff_opts = require("lsp-config.settings.ruff")
		lspconfig.ruff.setup(ruff_opts)
		goto continue
	end

	if server == "pyright" then
		local pyright_opts = require("lsp-config.settings.pyright")
		lspconfig.pyright.setup(pyright_opts)
		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
