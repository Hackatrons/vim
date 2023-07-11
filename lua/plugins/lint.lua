return {
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
        {
            "williamboman/mason.nvim",
            opts = {},
        },
        {
            "jose-elias-alvarez/null-ls.nvim",
            opts = function()
                local nls = require("null-ls")
                return {
                    sources = {
                        nls.builtins.diagnostics.markdownlint.with({
                            -- disable max width 80 chars rule
                            extra_args = { "--disable", "MD013" },
                        }),
                        nls.builtins.formatting.prettierd,
                        nls.builtins.formatting.stylua,
                    },
                }
            end,
        },
    },
}
