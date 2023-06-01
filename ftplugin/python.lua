local home = os.getenv "HOME"
require('dap-python').setup(home .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

require('neotest').setup({
    adapters = {
        require("neotest-python")({
            dap = {
                justMyCode = false,
                console = "integratedTerminal"
            },
            args = { "--log-level", "DEBUG", "--quiet" },
            runner = "pytest"
        })
    }
})

require('venv-selector').setup({
    auto_refresh = false,
    search_venv_managers = true,
    search_workspace = true,
    search = true,
    dap_enabled = true,
    parents = 0,
    name = { "venv", ".venv", "env", ".env" }, -- NOTE: You can also use a lua table here for multiple names: {"venv", ".venv"}`
    fd_binary_name = "fd",
    notify_user_on_activate = true,
})

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
    mode = "n",     -- normal mode
    prefix = "<leader>",
    buffer = nil,   -- global mappings. specify a buffer number for buffer local mappings
    silent = true,  -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
    P = {
        name = "Python",
        c = { "<cmd>VenvSelect<cr>", "Choose Env" },
        r = { "<cmd>Debugpy program<cr>", "Run main" },
        R = { function()
            vim.ui.input({ prompt = 'File: ' },
                function(input) vim.cmd("python " .. input) end)
        end, "Run file" },
        d = { "<cmd>Debugpy program<cr>", "Debug file / program" },
        D = { "<cmd>Debugpy attach 127.0.0.1 5678<cr>", "Attach (port 5678)" },
        a = {
            function()
                vim.ui.input({ prompt = 'Port: ' },
                    function(input) vim.cmd("Debugpy attach 127.0.0.1 " .. input) end)
            end, "Attach (Specify port)" },
        t = {
            name = "Testing",
            m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
            M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" },
            c = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
            C = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
            s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
        }
    },
}

which_key.register(mappings, opts)
