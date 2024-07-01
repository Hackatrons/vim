return {
    {
        "hrsh7th/cmp-nvim-lsp",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                "neovim/nvim-lspconfig",
                {
                    "williamboman/mason.nvim",
                    opts = {},
                },
            },
            opts = {
                ensure_installed = {
                    "tsserver",
                    "lua_ls",
                    "omnisharp",
                },
            },
        },
        config = function()
            local lsp_defaults = {
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
            }
            local lspconfig = require("lspconfig")

            lspconfig.util.default_config = vim.tbl_deep_extend("force", lspconfig.util.default_config, lsp_defaults)

            lspconfig.lua_ls.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.omnisharp.setup({})

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "rounded",
            })
        end,
    },
}
