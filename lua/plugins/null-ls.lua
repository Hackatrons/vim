require('mason-null-ls').setup({
    ensure_installed = { 'markdownlint', 'prettierd' }
})

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.markdownlint.with {
            -- disable max width 80 chars rule
            extra_args = { '--disable', 'MD013' }
        },
        null_ls.builtins.formatting.prettierd
    },
})
