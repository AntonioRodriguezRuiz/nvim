require("dressing").setup({
	input = {
		mappings = {
			n = {
				["<Esc>"] = "Close",
				["<C-c>"] = "Close",
				["<CR>"] = "Confirm",
			},
			i = {
				["<C-c>"] = "Close",
				["<CR>"] = "Confirm",
				["<Up>"] = "HistoryPrev",
				["<Down>"] = "HistoryNext",
			},
		},
		relative = "editor",
	},
})
