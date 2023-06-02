local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Normal Mode
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Move between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize Splits
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<A-h>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<C-c>", ":q<CR>", opts)
keymap("n", "<C-w>", ":Bdelete<CR>", opts)

-- Instert Mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual Mode
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Dap
keymap('n', '<F5>', ':lua require"dap".continue()<CR>', opts)
keymap('n', '<F6>', ':lua require"dap".step_over()<CR>', opts)
keymap('n', '<F7>', ':lua require"dap".step_into()<CR>', opts)
keymap('n', '<F8>', ':lua require"dap".step_out()<CR>', opts)
