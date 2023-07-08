return {
    'tomasiser/vim-code-dark',
    -- load before other plugins
    priority = 1000,

    config = function()
        vim.cmd.colorscheme('codedark')

        local gethl = function(name) return vim.api.nvim_get_hl_by_name(name, true) end
        local sethl = function(name, opts) return vim.api.nvim_set_hl(0, name, opts) end

        -- vim-code-dark doesn't set diagnostic colours
        -- so patch them in
        local error = gethl('Error')

        -- change the harsh red to the colour scheme red
        local diagnostic_error = gethl('DiagnosticError')
        diagnostic_error.foreground = error.foreground
        sethl('DiagnosticError', diagnostic_error)

        local diagnostic_underline_error = gethl('DiagnosticUnderlineError')
        diagnostic_underline_error.special = error.foreground
        sethl('DiagnosticUnderlineError', diagnostic_underline_error)

        -- change the background colour to the colour scheme bg
        local normal = gethl('Normal')
        local pmenu = gethl('PMenu')
        pmenu.background = normal.background

        sethl('PMenu', pmenu)
    end
}
