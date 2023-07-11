return {
    {
        "jayp0521/mason-null-ls.nvim",
        event = "VeryLazy",
        opts = {
            ensure_installed = {
                "markdownlint",
                "prettierd",
                "stylua",
            },
        },
        dependencies = {
            "williamboman/mason.nvim",
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        config = function()
            local null_ls = require("null-ls")
            local opts = {
                sources = {
                    null_ls.builtins.diagnostics.markdownlint.with({
                        -- disable max width 80 chars rule
                        extra_args = { "--disable", "MD013" },
                    }),
                    null_ls.builtins.formatting.prettierd,
                    null_ls.builtins.formatting.stylua,
                },
            }
            null_ls.setup(opts)
        end,
    },
}
