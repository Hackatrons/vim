return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {},
        opts = {
            ensure_installed = {
                "prettier",
                "stylua",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
            },
        },
    },
}
