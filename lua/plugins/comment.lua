return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
        -- disable mappings as it conflicts with my 'gb' bind
        mappings = false,
    },
    keys = {
        { "<leader>cc", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
        { "<leader>cc", "<Plug>(comment_toggle_linewise_current)" },
        { "<c-k><c-c>", "<Plug>(comment_toggle_linewise_current)" },
        -- visual studio muscle memory binding
        { "<c-k><c-c>", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
    },
}
