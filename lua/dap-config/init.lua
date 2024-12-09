require("dap-config/dap-ui")
require("dap-config/dap-virtual-text")
require("dap.ext.vscode").load_launchjs()

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
