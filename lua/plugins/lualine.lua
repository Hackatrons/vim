return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        lazy = true
    },
    config = function()
        local lualine = require("lualine")
        local config = {
            options = {
                icons_enabled = vim.g.me_enable_icons,
                component_separators = {
                    left = "",
                    right = "",
                }
            },
            sections = { lualine_a = {} }
        }

        if (not vim.g.me_enable_icons) then
            config.options.section_separators = {
                left = "",
                right = ""
            }
        end

        lualine.setup(config)
    end
}
