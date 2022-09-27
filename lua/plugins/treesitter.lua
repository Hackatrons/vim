require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'javascript', 'typescript', 'html', 'c_sharp' },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
})
