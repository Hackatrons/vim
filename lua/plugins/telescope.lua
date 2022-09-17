require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            "\\.git"
        }
    }
})

local m = require('../common/map')

m.nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
m.nmap('<leader>fb', '<cmd>Telescope buffers<cr>')
