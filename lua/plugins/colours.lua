return {
    "catppuccin/nvim",
    -- load before other plugins
    priority = 1000,
    opts = {
        flavour = "mocha",
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            telescope = true,
            notify = true,
            mason = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)

        vim.cmd.colorscheme("catppuccin")
    end,
}
