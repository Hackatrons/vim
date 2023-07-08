return {
    'tpope/vim-obsession',
    config = function()
        local sessionFile = vim.fn.stdpath('data') .. '/session'
        local group = vim.api.nvim_create_augroup("auto_session", { clear = true })

        -- store localoptions so that syntax highlighting works when resuming the session
        -- https://stackoverflow.com/a/60875369
        vim.opt.sessionoptions:append('localoptions')

        vim.api.nvim_create_autocmd('VimEnter', {
            group = group,
            pattern = '*',
            callback = function()
                -- if neovim was opened with arguments then don't use a session
                if (vim.fn.argc() > 0) then return end

                if (vim.fn.filereadable(sessionFile) == 1) then
                    -- session file exists, resume it
                    vim.cmd('source ' .. sessionFile)
                else
                    -- session file doesn't exist, start a new session
                    vim.cmd('Obsession ' .. sessionFile)
                end
            end
        })
    end
}
