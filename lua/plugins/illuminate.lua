return {
    "RRethy/vim-illuminate",
    event = "InsertEnter",
    config = function()
        require("illuminate").configure({
            providers = {
                "lsp",
                "treesitter",
                "regex",
            },
            filetypes_denylist = {
                "NvimTree",
            },
        })
    end,
}
