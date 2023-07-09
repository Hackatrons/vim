return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            open_mapping = "<c-cr>",
            direction = "float",
            shell = "pwsh.exe",
            float_opts = {
                border = "curved",
            }
        })
    end
}
