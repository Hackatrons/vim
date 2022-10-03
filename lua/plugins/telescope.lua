local actions = require('telescope.actions')

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            '\\.git'
        },
        mappings = {
            i = {
                ['<a-j>'] = actions.move_selection_next,
                ['<a-k>'] = actions.move_selection_previous,
                ['<Tab>'] = actions.move_selection_next,
                ['<S-Tab>'] = actions.move_selection_previous,
            },
        }
    }
})
