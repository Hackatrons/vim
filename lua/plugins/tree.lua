return {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        lazy = true
    },
    cmd = {
        "NvimTreeToggle",
        "NvimTreeFindFileToggle"
    },
    keys = {
        "<leader>sf",
        "<s-a-l>",
    },
    config = function()
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = true
                }
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
                    }
                }
            }
        })

        local map = vim.keymap.set
        map("n", "<leader>sf", "<cmd>NvimTreeToggle<cr>")
        map("n", "<s-a-l>", "<cmd>NvimTreeFindFileToggle<cr>")
    end
}
