return {
    "akinsho/toggleterm.nvim",
    keys = {
        "<c-cr>",
    },
    cmd = {
        "ToggleTerm"
    },
    config = function()
        require("toggleterm").setup({
            open_mapping = "<c-cr>",
            direction = "float",
            shell = function()
                if vim.loop.os_uname().sysname == "Windows_NT" and vim.fn.executable("pwsh.exe") then
                    return "pwsh.exe"
                end

                return vim.o.shell
            end,
            float_opts = {
                border = "curved",
            }
        })
    end
}
