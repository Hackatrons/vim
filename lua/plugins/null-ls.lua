require('mason-null-ls').setup({
    ensure_installed = { 'markdownlint', 'prettierd' }
})

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.prettierd
    },
})