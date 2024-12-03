vim.g.rustaceanvim = function()
	-- Update this path
	local extension_path = "/home/antonio/.local/share/nvim/mason/packages/codelldb/"
	local codelldb_path = extension_path .. "codelldb"
	local liblldb_path = "/usr/lib64/liblldb.so"

	local cfg = require("rustaceanvim.config")

	return {
		tools = {
			-- callback to execute once rust-analyzer is done initializing the workspace
			-- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
			on_initialized = function()
				vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
					pattern = { "*.rs" },
					callback = function()
						vim.lsp.codelens.refresh()
					end,
				})
			end,

			-- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
			reload_workspace_from_cargo_toml = true,

			-- options same as lsp hover / vim.lsp.util.open_floating_preview()
			hover_actions = {
				-- the border that is used for the hover window
				-- see vim.api.nvim_open_win()
				border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				},

				-- Maximal width of the hover window. Nil means no max.
				max_width = nil,

				-- Maximal height of the hover window. Nil means no max.
				max_height = nil,

				-- whether the hover action window gets automatically focused
				-- default: false
				auto_focus = true,
			},

			-- settings for showing the crate graph based on graphviz and the dot
			-- command
			crate_graph = {
				-- Backend used for displaying the graph
				-- see: https://graphviz.org/docs/outputs/
				-- default: x11
				backend = "x11",
				-- where to store the output, nil for no output stored (relative
				-- path from pwd)
				-- default: nil
				output = nil,
				-- true for all crates.io and external crates, false only the local
				-- crates
				-- default: true
				full = true,

				-- List of backends found on: https://graphviz.org/docs/outputs/
				-- Is used for input validation and autocompletion
				-- Last updated: 2021-08-26
				enabled_graphviz_backends = {
					"bmp",
					"cgimage",
					"canon",
					"dot",
					"gv",
					"xdot",
					"xdot1.2",
					"xdot1.4",
					"eps",
					"exr",
					"fig",
					"gd",
					"gd2",
					"gif",
					"gtk",
					"ico",
					"cmap",
					"ismap",
					"imap",
					"cmapx",
					"imap_np",
					"cmapx_np",
					"jpg",
					"jpeg",
					"jpe",
					"jp2",
					"json",
					"json0",
					"dot_json",
					"xdot_json",
					"pdf",
					"pic",
					"pct",
					"pict",
					"plain",
					"plain-ext",
					"png",
					"pov",
					"ps",
					"ps2",
					"psd",
					"sgi",
					"svg",
					"svgz",
					"tga",
					"tiff",
					"tif",
					"tk",
					"vml",
					"vmlz",
					"wbmp",
					"webp",
					"xlib",
					"x11",
				},
			},
		},

		-- all the opts to send to nvim-lspconfig
		-- these override the defaults set by rust-tools.nvim
		-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
		server = {
			-- standalone file support
			-- setting it to false may improve startup time
			on_attach = require("lsp-config.handlers").on_attach,
			capabilities = require("lsp-config.handlers").capabilities,
			standalone = true,

			settings = {
				["rust-analyzer"] = {
					lens = {
						enable = true,
					},
					checkOnSave = {
						command = "clippy",
					},
				},
			},
		}, -- rust-analyzer options

		-- debugging stuff
		dap = {
			adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
		},
	}
end
