local home = os.getenv("HOME")
local dap_python = require("dap-python")

dap_python.setup(
	home .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
	{ console = "integratedTerminal" }
)
local debugpy_default = { console = "integratedTerminal" }

require("neotest").setup({
	adapters = {
		require("neotest-python")({
			dap = {
				justMyCode = false,
				console = "integratedTerminal",
			},
			args = { "--log-level", "DEBUG", "--quiet" },
			runner = "pytest",
		}),
	},
})

require("venv-selector").setup({
	auto_refresh = false,
	search_venv_managers = true,
	search_workspace = true,
	search = true,
	dap_enabled = true,
	parents = 2,
	name = { "venv", ".venv", "env", ".env" }, -- NOTE: You can also use a lua table here for multiple names: {"venv", ".venv"}`
	fd_binary_name = "fd",
	notify_user_on_activate = true,
})

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

function activate_env()
	vim.ui.input({ prompt = "Env path: " }, function(input)
		vim.cmd('TermExec cmd="source ' .. input .. '/bin/activate.fish"')
	end)
end

-- Both here and in debug_remote I am doing the if else like this because otherwhise it would execute the statetemt after the else before the one inside the else. I am new to lua so I do not know how to fix that, this is the best I could do
function run(custom)
	if not custom then
		vim.cmd('TermExec cmd="python main.py"')
	else
		vim.ui.input({ prompt = "File: " }, function(input)
			vim.cmd('TermExec cmd="python ' .. input .. '"')
		end)
	end
end

function debug_remote(custom)
	local debugpy = require("debugpy")
	local config
	if not custom then
		config = debugpy.configure("attach", "127.0.0.1", "5678")
		local final = vim.tbl_extend("keep", config, debugpy_default)
		debugpy.run(final)
	else
		vim.ui.input({ prompt = "Port: " }, function(input)
			config = debugpy.configure("attach", "127.0.0.1", input)
		end)
		local final = vim.tbl_extend("keep", config, debugpy_default)
		debugpy.run(final)
	end
end

function debug_local()
	local debugpy = require("debugpy")
	local config = debugpy.configure("program")
	local final = vim.tbl_extend("keep", config, debugpy_default)
	debugpy.run(final)
end

local mappings = {
	P = {
		name = "Python",
		c = { "<cmd>VenvSelect<cr>", "Choose Env" },
		v = {
			function()
				activate_env()
			end,
			"Activate env",
		},
		r = {
			function()
				run()
			end,
			"Run main",
		},
		R = {
			function()
				run(true)
			end,
			"Run file",
		},
		d = {
			function()
				debug_local()
			end,
			"Debug file / program",
		},
		D = {
			function()
				debug_remote()
			end,
			"Attach (port 5678)",
		},
		a = {
			function()
				debug_remote(true)
			end,
			"Attach (Specify port)",
		},
		t = {
			name = "Testing",
			m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
			M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
			c = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
			C = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
			s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
		},
	},
}

which_key.register(mappings, opts)
