return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        lazy = true,
    },
    opts = function()
        local config = {
            options = {
                show_buffer_close_icons = false,
                show_buffer_icons = vim.g.me_enable_icons,
                separator_style = "slant",
                middle_mouse_command = "bdelete! %d",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Files",
                        highlight = "Directory",
                    },
                },
            },
        }

        if not vim.g.me_enable_icons then
            config.options.indicator = {
                style = "none"
            }
            config.options.buffer_close_icon = "x"
            config.options.modified_icon = "+"
            config.options.left_trunc_marker = "<-"
            config.options.right_trunc_marker = "->"
            config.options.separator_style = "thick"
        end

        return config
    end,
}
