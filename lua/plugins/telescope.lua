return {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.1",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'desdic/telescope-rooter.nvim',
    },
    config = function()
        local actions = require("telescope.actions")

        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    ".git",
                    "node_modules",
                    "bin",
                    "obj"
                },
                -- only show the filename, exclude path
                path_display = { "tail" },
                mappings = {
                    i = {
                        ["<a-j>"] = actions.move_selection_next,
                        ["<a-k>"] = actions.move_selection_previous,
                        ["<tab>"] = actions.move_selection_next,
                        ["<s-tab>"] = actions.move_selection_previous,
                    },
                }
            },
            extensions = {
                rooter = {
                    enable = true,
                    patterns = { ".git" },
                    debug = false
                }
            }
        })

        require("telescope").load_extension("rooter")
    end
}
