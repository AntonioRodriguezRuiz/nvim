-- Autocommand that reloads neovim whenever you save this file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return require('packer').startup(function(use)
    -- Requirements
    use 'nvim-tree/nvim-web-devicons'
    use { 'nvim-tree/nvim-web-devicons', opt = true }
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- Essentials
    use 'wbthomason/packer.nvim'
    use 'navarasu/onedark.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
    use 'neovim/nvim-lspconfig'
    use 'folke/which-key.nvim'

    --Extensions
    use 'windwp/nvim-ts-autotag'
    use 'HiPhish/nvim-ts-rainbow2'
    use 'windwp/nvim-autopairs'

    use 'nvim-telescope/telescope-media-files.nvim'

    -- Lualine, Bufferline, NVim tree, Telescope
    use 'nvim-lualine/lualine.nvim'
    use { 'akinsho/bufferline.nvim', tag = "*" }
    use 'nvim-tree/nvim-tree.lua'

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }

    -- CMP
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'onsails/lspkind.nvim'

    -- LSP
    use { "williamboman/mason.nvim", run = ":MasonUpdate" } -- :MasonUpdate updates registry contents
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'mfussenegger/nvim-jdtls'

    -- DAP
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/cmp-dap'

    -- Term
    use 'akinsho/toggleterm.nvim'

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
