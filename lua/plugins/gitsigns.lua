return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup({
            -- use a space for the text character so that only a colour is shown
            signs = {
                add = { text = ' ' },
                change = { text = ' ' },
                delete = { text = ' ' },
                topdelete = { text = ' ' },
                changedelete = { text = ' ' }
            }
        })
    end
}
