return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1985
        if vim.fn.has('win32') == 1 then
            require 'nvim-treesitter.install'.compilers = { 'zig' }
        end

        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'javascript', 'typescript', 'html', 'c_sharp' },
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}
