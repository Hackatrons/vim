return {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        renderer = {
            indent_markers = {
                enable = true,
            },
            icons = {
                show = {
                    file = vim.g.me_enable_icons,
                    folder = vim.g.me_enable_icons,
                    folder_arrow = vim.g.me_enable_icons,
                    git = vim.g.me_enable_icons,
                },
            },
        },
    },
}
