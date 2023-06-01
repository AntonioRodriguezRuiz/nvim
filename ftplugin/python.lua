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

require('swenv').setup({
    -- Should return a list of tables with a `name` and a `path` entry each.
    -- Gets the argument `venvs_path` set below.
    -- By default just lists the entries in `venvs_path`.
    get_venvs = function(venvs_path)
        return require('swenv.api').get_venvs(venvs_path)
    end,
    -- Path passed to `get_venvs`.
    venvs_path = vim.fn.expand('.'),
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
        c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
        r = { "<cmd>Debugpy program<cr>", "Debug file / program" },
        d = { "<cmd>Debugpy attach 127.0.0.1 5678<cr>", "Attach (port 5678)" },
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
