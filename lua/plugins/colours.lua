return {
    "catppuccin/nvim",
    -- load before other plugins
    priority = 1000,

    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                telescope = true,
                notify = true,
                mason = true
            }
        })

        vim.cmd.colorscheme("catppuccin")
    end
}
