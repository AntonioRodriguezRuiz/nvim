local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dapui.setup({
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    force_buffers = true,
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.4
        }, {
            id = "stacks",
            size = 0.3
        }, {
            id = "breakpoints",
            size = 0.3
        } },
        position = "left",
        size = 40
    }, {
        elements = { {
            id = "console",
            size = 0.7
        }, {
            id = "repl",
            size = 0.3
        } },
        position = "bottom",
        size = 15
    } },
    mappings = {
        edit = "e",
        expand = "o",
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    render = {
        indent = 1,
        max_value_lines = 100
    }

})
