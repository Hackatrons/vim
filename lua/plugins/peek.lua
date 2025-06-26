return {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup({
            app = "browser",
        })
        vim.api.nvim_create_user_command("MarkdownRender", require("peek").open, {})
        vim.api.nvim_create_user_command("MarkdownClose", require("peek").close, {})
    end,
}
