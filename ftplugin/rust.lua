local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	R = {
		name = "Rust",
		h = { "<cmd>RustToggleInlayHints<Cr>", "Toggle Hints" },
		r = { "<cmd>RustLsp runnables<Cr>", "Runnables" },
		R = {
			function()
				vim.ui.input({ prompt = "Args: " }, function(input)
					vim.cmd("RustLsp runnables " .. input)
				end)
			end,
			"Runnables Custom",
		},
		-- r = { "<cmd>lua _CARGO_RUN()<cr>", "Cargo Run" },
		t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
		m = { "<cmd>RustLsp expandMacro<Cr>", "Expand Macro" },
		c = { "<cmd>RustLsp openCargo<Cr>", "Open Cargo" },
		p = { "<cmd>RustLsp parentModule<Cr>", "Parent Module" },
		-- j = { "<cmd>RustJoinLines<Cr>", "Join Lines" },
		-- s = { "<cmd>RustStartStandaloneServerForBuffer<Cr>", "Start Server Buf" },
		d = { "<cmd>RustLsp debuggables<Cr>", "Debuggables" },
		-- Run custom debbugable command by asking for the command
		D = {
			function()
				vim.ui.input({ prompt = "Args: " }, function(input)
					vim.cmd("RustLsp debuggables " .. input)
				end)
			end,
			"Debuggables Custom",
		},
		v = { "<cmd>RustLsp crateGraph<Cr>", "View Crate Graph" },
		-- S = { "<cmd>RustSSR<Cr>", "SSR" },
		o = { "<cmd>RustLsp externalDocs<Cr>", "Open External Docs" },
		-- h = { "<cmd>RustSetInlayHints<Cr>", "Enable Hints" },
		-- H = { "<cmd>RustDisableInlayHints<Cr>", "Disable Hints" },
		a = { "<cmd>RustLsp codeAction<Cr>", "Hover Actions" },
		-- a = { "<cmd>RustHoverRange<Cr>", "Hover Range" },
		-- j = { "<cmd>RustMoveItemDown<Cr>", "Move Item Down" },
		-- k = { "<cmd>RustMoveItemUp<Cr>", "Move Item Up" },
		e = { "<cmd>RustLsp explainError<Cr>", "Explain Error" },
	},
}

which_key.register(mappings, opts)

local notify_filter = vim.notify
vim.notify = function(msg, ...)
	if msg:match("message with no corresponding") then
		return
	end

	notify_filter(msg, ...)
end
