return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        lazy = true,
    },
    opts = {
        options = {
            icons_enabled = vim.g.me_enable_icons,
            component_separators = {
                left = "",
                right = "",
            },
            section_separators = not vim.g.me_enable_icons and {
                left = "",
                right = "",
            } or nil,
        },
        sections = { lualine_a = {} },
    },
}
