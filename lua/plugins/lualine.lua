local config = { 
    options = {
        icons_enabled = vim.g.me_enable_icons,
        component_separators = {
            left = '',
            right = '',
        }
    }
}

if (not vim.g.me_enable_icons) then
    config.options.section_separators = {
        left = '',
        right = ''
    }
end

require('lualine').setup(config)
