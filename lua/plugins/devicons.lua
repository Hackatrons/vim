return {
    "nvim-web-devicons",
    lazy = true,
    config = function()
        if (vim.g.me_use_icons) then
            vim.cmd.packadd("nvim-web-devicons")
            require("nvim-web-devicons").setup()
        end
    end
}
