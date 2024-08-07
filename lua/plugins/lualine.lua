-- https://www.reddit.com/r/neovim/comments/xy0tu1/cmdheight0_recording_macros_message/
local function show_macro_recording()
    local recording_register = vim.fn.reg_recording()
    if recording_register == "" then
        return ""
    else
        return "Recording @" .. recording_register
    end
end

vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        require("lualine").refresh({
            place = { "statusline" },
        })
    end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()
        timer:start(
            50,
            0,
            vim.schedule_wrap(function()
                require("lualine").refresh({
                    place = { "statusline" },
                })
            end)
        )
    end,
})

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
        lazy = true,
    },
    opts = {
        options = {
            icons_enabled = vim.g.me_enable_icons,
            component_separators = {
                left = "",
                right = "",
            },
            section_separators = not vim.g.me_enable_icons and {
                left = "",
                right = "",
            } or nil,
        },
        sections = {
            -- hide the insert/normal mode section
            -- add our macro recording section
            lualine_a = {
                {
                    "macro-recording",
                    fmt = show_macro_recording,
                },
            },
        },
    },
}
