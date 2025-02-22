local wk = require("which-key")

local mappings = {
	{
		"<leader>C",
		"<cmd>:Bdelete!<CR>",
		desc = "Force Close Buffer",
		nowait = true,
		remap = false,
	},
	{
		"<leader>F",
		":Telescope live_grep<CR>",
		desc = "Search for files",
		nowait = true,
		remap = false,
	},
	{
		"<leader>H",
		"<cmd>hlsearch<CR>",
		desc = "Highlight",
		nowait = true,
		remap = false,
	},
	{
		"<leader>Q",
		"<cmd>qa!<CR>",
		desc = "Force Quit",
		nowait = true,
		remap = false,
	},
	{
		"<leader>S",
		group = "Splits / Tabs",
		nowait = true,
		remap = false,
	},
	{
		"<leader>Sc",
		"<cmd>tabclose<CR>",
		desc = "Close tab",
		nowait = true,
		remap = false,
	},
	{
		"<leader>Sh",
		"<cmd>split<CR>",
		desc = "Horizontal",
		nowait = true,
		remap = false,
	},
	{
		"<leader>Sm",
		"gt",
		desc = "Move to next tab",
		nowait = true,
		remap = false,
	},
	{
		"<leader>St",
		"<cmd>tabnew %<CR>",
		desc = "New tab",
		nowait = true,
		remap = false,
	},
	{
		"<leader>Sv",
		"<cmd>vsplit<CR>",
		desc = "Vertical",
		nowait = true,
		remap = false,
	},
	{
		"<leader>W",
		"<cmd>w!<CR>",
		desc = "Force Save",
		nowait = true,
		remap = false,
	},
	{
		"<leader>c",
		"<cmd>:Bdelete<CR>",
		desc = "Close Buffer",
		nowait = true,
		remap = false,
	},
	{
		"<leader>d",
		group = "Debug tools",
		nowait = true,
		remap = false,
	},
	{
		"<leader>dB",
		'<cmd>lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>',
		desc = "Set breakpoint with condition",
		nowait = true,
		remap = false,
	},
	{
		"<leader>db",
		'<cmd>lua require"dap".toggle_breakpoint()<CR>',
		desc = "Toggle Breakpoint",
		nowait = true,
		remap = false,
	},
	{
		"<leader>dl",
		'<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>',
		desc = "Log breakpoint",
		nowait = true,
		remap = false,
	},
	{
		"<leader>dr",
		'<cmd>lua require"dap".repl.open()<CR>',
		desc = "Debug Console",
		nowait = true,
		remap = false,
	},
	{
		"<leader>dx",
		"<cmd>lua require'dap'.terminate()<cr>",
		desc = "Terminate",
		nowait = true,
		remap = false,
	},
	{
		"<leader>e",
		"<cmd>NvimTreeToggle<cr>",
		desc = "Explorer",
		nowait = true,
		remap = false,
	},
	{
		"<leader>f",
		":Telescope find_files<CR>",
		desc = "Search for files",
		nowait = true,
		remap = false,
	},
	{
		"<leader>g",
		group = "Git",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gR",
		"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
		desc = "Reset Buffer",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gb",
		"<cmd>Telescope git_branches<cr>",
		desc = "Checkout branch",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gc",
		"<cmd>Telescope git_commits<cr>",
		desc = "Checkout commit",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gd",
		"<cmd>Gitsigns diffthis HEAD<cr>",
		desc = "Diff",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gg",
		"<cmd>lua _LAZYGIT_TOGGLE()<CR>",
		desc = "Lazygit",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gj",
		"<cmd>lua require 'gitsigns'.next_hunk()<cr>",
		desc = "Next Hunk",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gk",
		"<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
		desc = "Prev Hunk",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gl",
		"<cmd>lua require 'gitsigns'.blame_line()<cr>",
		desc = "Blame",
		nowait = true,
		remap = false,
	},
	{
		"<leader>go",
		"<cmd>Telescope git_status<cr>",
		desc = "Open changed file",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gp",
		"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
		desc = "Preview Hunk",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gr",
		"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
		desc = "Reset Hunk",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gs",
		"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
		desc = "Stage Hunk",
		nowait = true,
		remap = false,
	},
	{
		"<leader>gu",
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		desc = "Undo Stage Hunk",
		nowait = true,
		remap = false,
	},
	{
		"<leader>h",
		"<cmd>nohlsearch<CR>",
		desc = "No Highlight",
		nowait = true,
		remap = false,
	},
	{
		"<leader>l",
		group = "LSP",
		nowait = true,
		remap = false,
	},
	{
		"<leader>lI",
		"<cmd>LspInstallInfo<cr>",
		desc = "Installer Info",
		nowait = true,
		remap = false,
	},
	{
		"<leader>lS",
		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		desc = "Workspace Symbols",
		nowait = true,
		remap = false,
	},
	{
		"<leader>la",
		"<cmd>lua vim.lsp.buf.code_action()<cr>",
		desc = "Code Action",
		nowait = true,
		remap = false,
	},
	{
		"<leader>ld",
		"<cmd>Telescope diagnostics bufnr=0<cr>",
		desc = "Document Diagnostics",
		nowait = true,
		remap = false,
	},
	{
		"<leader>lf",
		"<cmd>lua vim.lsp.buf.format{async=true}<cr>",
		desc = "Format",
		nowait = true,
		remap = false,
	},
	{
		"<leader>li",
		"<cmd>LspInfo<cr>",
		desc = "Info",
		nowait = true,
		remap = false,
	},
	{
		"<leader>lj",
		"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
		desc = "Next Diagnostic",
		nowait = true,
		remap = false,
	},
	{
		"<leader>lk",
		"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
		desc = "Prev Diagnostic",
		nowait = true,
		remap = false,
	},
	{
		"<leader>ll",
		"<cmd>lua vim.lsp.codelens.run()<cr>",
		desc = "CodeLens Action",
		nowait = true,
		remap = false,
	},
	{
		"<leader>lq",
		"<cmd>lua vim.diagnostic.setloclist()<cr>",
		desc = "Problems List",
		nowait = true,
		remap = false,
	},
	{
		"<leader>lr",
		"<cmd>lua vim.lsp.buf.rename()<cr>",
		desc = "Rename",
		nowait = true,
		remap = false,
	},
	{
		"<leader>ls",
		"<cmd>Telescope lsp_document_symbols<cr>",
		desc = "Document Symbols",
		nowait = true,
		remap = false,
	},
	{
		"<leader>lw",
		"<cmd>Telescope diagnostics<cr>",
		desc = "Workspace Diagnostics",
		nowait = true,
		remap = false,
	},
	{
		"<leader>q",
		"<cmd>qa<CR>",
		desc = "Quit",
		nowait = true,
		remap = false,
	},
	{
		"<leader>s",
		group = "Search",
		nowait = true,
		remap = false,
	},
	{
		"<leader>sC",
		"<cmd>Telescope commands<cr>",
		desc = "Commands",
		nowait = true,
		remap = false,
	},
	{
		"<leader>sM",
		"<cmd>Telescope man_pages<cr>",
		desc = "Man Pages",
		nowait = true,
		remap = false,
	},
	{
		"<leader>sR",
		"<cmd>Telescope registers<cr>",
		desc = "Registers",
		nowait = true,
		remap = false,
	},
	{
		"<leader>sb",
		"<cmd>Telescope git_branches<cr>",
		desc = "Checkout branch",
		nowait = true,
		remap = false,
	},
	{
		"<leader>sc",
		"<cmd>Telescope colorscheme<cr>",
		desc = "Colorscheme",
		nowait = true,
		remap = false,
	},
	{
		"<leader>sh",
		"<cmd>Telescope help_tags<cr>",
		desc = "Find Help",
		nowait = true,
		remap = false,
	},
	{
		"<leader>sk",
		"<cmd>Telescope keymaps<cr>",
		desc = "Keymaps",
		nowait = true,
		remap = false,
	},
	{
		"<leader>sr",
		"<cmd>Telescope oldfiles<cr>",
		desc = "Open Recent File",
		nowait = true,
		remap = false,
	},
	{
		"<leader>t",
		group = "Terminal",
		nowait = true,
		remap = false,
	},
	{
		"<leader>tf",
		"<cmd>ToggleTerm direction=float<cr>",
		desc = "Float",
		nowait = true,
		remap = false,
	},
	{
		"<leader>th",
		"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
		desc = "Horizontal",
		nowait = true,
		remap = false,
	},
	{
		"<leader>tn",
		"<cmd>lua _NODE_TOGGLE()<cr>",
		desc = "Node",
		nowait = true,
		remap = false,
	},
	{
		"<leader>tp",
		"<cmd>lua _PYTHON_TOGGLE()<cr>",
		desc = "Python",
		nowait = true,
		remap = false,
	},
	{
		"<leader>tt",
		"<cmd>lua _HTOP_TOGGLE()<cr>",
		desc = "Htop",
		nowait = true,
		remap = false,
	},
	{
		"<leader>tu",
		"<cmd>lua _NCDU_TOGGLE()<cr>",
		desc = "NCDU",
		nowait = true,
		remap = false,
	},
	{
		"<leader>tv",
		"<cmd>ToggleTerm size=80 direction=vertical<cr>",
		desc = "Vertical",
		nowait = true,
		remap = false,
	},
	{
		"<leader>w",
		"<cmd>w<CR>",
		desc = "Save",
		nowait = true,
		remap = false,
	},
}

-- local mappings = {
-- 	["f"] = {
-- 		":Telescope find_files<CR>",
-- 		"Search for files",
-- 	},
-- 	["F"] = {
-- 		":Telescope live_grep<CR>",
-- 		"Search for files",
-- 	},
-- 	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
-- 	["w"] = { "<cmd>w<CR>", "Save" },
-- 	["q"] = { "<cmd>qa<CR>", "Quit" },
-- 	["c"] = { "<cmd>:Bdelete<CR>", "Close Buffer" },
-- 	["W"] = { "<cmd>w!<CR>", "Force Save" },
-- 	["Q"] = { "<cmd>qa!<CR>", "Force Quit" },
-- 	["C"] = { "<cmd>:Bdelete!<CR>", "Force Close Buffer" },
-- 	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
-- 	["H"] = { "<cmd>hlsearch<CR>", "Highlight" },
--
-- 	g = {
-- 		name = "Git",
-- 		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
-- 		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
-- 		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
-- 		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
-- 		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
-- 		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
-- 		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
-- 		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
-- 		u = {
-- 			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
-- 			"Undo Stage Hunk",
-- 		},
-- 		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
-- 		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
-- 		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
-- 		d = {
-- 			"<cmd>Gitsigns diffthis HEAD<cr>",
-- 			"Diff",
-- 		},
-- 	},
--
-- 	l = {
-- 		name = "LSP",
-- 		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
-- 		d = {
-- 			"<cmd>Telescope diagnostics bufnr=0<cr>",
-- 			"Document Diagnostics",
-- 		},
-- 		w = {
-- 			"<cmd>Telescope diagnostics<cr>",
-- 			"Workspace Diagnostics",
-- 		},
-- 		f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
-- 		i = { "<cmd>LspInfo<cr>", "Info" },
-- 		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
-- 		j = {
-- 			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
-- 			"Next Diagnostic",
-- 		},
-- 		k = {
-- 			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
-- 			"Prev Diagnostic",
-- 		},
-- 		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
-- 		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Problems List" },
-- 		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
-- 		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
-- 		S = {
-- 			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
-- 			"Workspace Symbols",
-- 		},
-- 	},
-- 	s = {
-- 		name = "Search",
-- 		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
-- 		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
-- 		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
-- 		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
-- 		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
-- 		R = { "<cmd>Telescope registers<cr>", "Registers" },
-- 		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
-- 		C = { "<cmd>Telescope commands<cr>", "Commands" },
-- 	},
--
-- 	t = {
-- 		name = "Terminal",
-- 		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
-- 		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
-- 		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
-- 		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
-- 		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
-- 		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
-- 		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
-- 	},
--
-- 	d = {
-- 		name = "Debug tools",
-- 		b = { '<cmd>lua require"dap".toggle_breakpoint()<CR>', "Toggle Breakpoint" },
-- 		B = { '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>', "Set breakpoint with condition" },
-- 		l = { '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>', "Log breakpoint" },
-- 		r = { '<cmd>lua require"dap".repl.open()<CR>', "Debug Console" },
-- 		x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
-- 	},
--
-- 	S = {
-- 		name = "Splits / Tabs",
-- 		v = { "<cmd>vsplit<CR>", "Vertical" },
-- 		h = { "<cmd>split<CR>", "Horizontal" },
-- 		t = { "<cmd>tabnew %<CR>", "New tab" },
-- 		c = { "<cmd>tabclose<CR>", "Close tab" },
-- 		m = { "gt", "Move to next tab" },
-- 	},
-- }

-- local opts = {
-- 	mode = "n", -- NORMAL mode
-- 	prefix = "<leader>",
-- 	silent = true, -- use `silent` when creating keymaps
-- 	noremap = true, -- use `noremap` when creating keymaps
-- 	nowait = true, -- use `nowait` when creating keymaps
-- }

wk.add(mappings)
