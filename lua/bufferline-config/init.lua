require("bufferline").setup {
    options = {
        indicator = {
            style = 'underline'
        },
        separator_style = { "", "" },
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        }
    }
}
