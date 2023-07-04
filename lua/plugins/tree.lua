require("nvim-tree").setup({
    sync_root_with_cwd = true,
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

local m = require('utils/map')
m.nmap('<leader>sf', '<cmd>NvimTreeToggle<cr>')
m.nmap('<s-a-l>', '<cmd>NvimTreeFindFileToggle<cr>')
