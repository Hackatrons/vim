return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    opts = function()
        local actions = require("telescope.actions")

        return {
            defaults = {
                file_ignore_patterns = {
                    "\\.git",
                    "node_modules",
                    "bin",
                    "obj",
                },
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<a-j>"] = actions.move_selection_next,
                        ["<a-k>"] = actions.move_selection_previous,
                        ["<tab>"] = actions.move_selection_next,
                        ["<s-tab>"] = actions.move_selection_previous,
                    },
                },
            },
        }
    end,
}
