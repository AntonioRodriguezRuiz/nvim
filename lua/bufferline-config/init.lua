require("bufferline").setup {
    options = {
        close_command = "Bdelete %d",
        right_mouse_command = "Bdelete %d",
        middle_mouse_command = "Bdelete %d",
        left_mouse_command = "budder %d",
        indicator = {
            style = 'underline'
        },
        separator_style = { "", "" },
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _, _)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
            }
        }
    }
}
