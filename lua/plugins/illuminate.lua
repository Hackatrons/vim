return {
    "RRethy/vim-illuminate",
    event = "InsertEnter",
    opts = {
        providers = {
            "lsp",
            "treesitter",
            "regex",
        },
        filetypes_denylist = {
            "NvimTree",
        },
    },
    config = function(_, opts)
        require("illuminate").configure(opts)
    end
}
