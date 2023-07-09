return {
    "nvim-web-devicons",
    lazy = true,
    cond = vim.g.me_enable_icons,
    config = function()
        require("nvim-web-devicons").setup()
    end
}
