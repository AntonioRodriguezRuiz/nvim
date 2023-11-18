-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Requirements
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("antoinemadec/FixCursorHold.nvim") -- neotest

	-- Essentials
	use("wbthomason/packer.nvim")
	use("navarasu/onedark.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("neovim/nvim-lspconfig")
	use("folke/which-key.nvim")
	use("moll/vim-bbye")

	--Extensions
	use("windwp/nvim-ts-autotag")
	use("HiPhish/nvim-ts-rainbow2")
	use("windwp/nvim-autopairs")
	use("stevearc/dressing.nvim")
	use("linux-cultist/venv-selector.nvim")

	use("nvim-telescope/telescope-media-files.nvim")

	use({ "lewis6991/gitsigns.nvim" })
	-- Lualine, Bufferline, NVim tree, Telescope
	use("nvim-lualine/lualine.nvim")
	use({ "akinsho/bufferline.nvim", tag = "*" })
	use("nvim-tree/nvim-tree.lua")

	use("nvim-telescope/telescope.nvim")

	-- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	use("onsails/lspkind.nvim")

	use({ "zbirenbaum/copilot.lua" })

	-- LSP
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" }) -- :MasonUpdate updates registry contents
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("mfussenegger/nvim-jdtls")
	use("python-rope/pylsp-rope")
	use("mfussenegger/nvim-dap-python")
	use("simrat39/rust-tools.nvim")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/cmp-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("HiPhish/debugpy.nvim")

	-- Tests
	use("nvim-neotest/neotest")
	use("nvim-neotest/neotest-python")

	-- Term
	use("akinsho/toggleterm.nvim")

	-- MARKDOWN

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Docker

	use({ "https://codeberg.org/esensar/nvim-dev-container" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
