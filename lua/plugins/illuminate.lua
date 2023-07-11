return {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
        providers = {
            "lsp",
            "treesitter",
            "regex",
        },
        filetypes_denylist = {
            "NvimTree",
            "lazy",
        },
    },
    config = function(_, opts)
        require("illuminate").configure(opts)
    end,
}
