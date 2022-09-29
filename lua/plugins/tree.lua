require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true
        }
    },
    renderer = {
        icons = {
            show = {
                file = vim.g.me_enable_icons,
                folder = vim.g.me_enable_icons,
                folder_arrow = vim.g.me_enable_icons,
                git = vim.g.me_enable_icons,
            }
        }
    }
})