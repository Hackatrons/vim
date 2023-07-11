return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = { "lua", "javascript", "typescript", "html", "c_sharp" },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
        },
        config = function(_, opts)
            -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1985
            if vim.fn.has("win32") == 1 then
                require("nvim-treesitter.install").compilers = { "zig" }
            end

            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
