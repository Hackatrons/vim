return {
    "numToStr/Comment.nvim",
    event = "InsertEnter",
    config = function()
        require("Comment").setup({
            -- disable mappings as it conflicts with my 'gb' bind
            mappings = false,
        })

        local map = vim.keymap.set

        map("v", "<leader>cc", "<Plug>(comment_toggle_linewise_visual)")
        map("n", "<leader>cc", "<Plug>(comment_toggle_linewise_current)")
        map("n", "<c-k><c-c>", "<Plug>(comment_toggle_linewise_current)")

        -- visual studio muscle memory binding
        map("v", "<c-k><c-c>", "<Plug>(comment_toggle_linewise_visual)")
    end,
}
