return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'ray-x/lsp_signature.nvim'
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'tsserver', 'lua_ls', 'omnisharp' }
        })

        local lsp_defaults = {
            capabilities = require('cmp_nvim_lsp').default_capabilities()
        }
        local lspconfig = require('lspconfig')

        lspconfig.util.default_config = vim.tbl_deep_extend(
            'force',
            lspconfig.util.default_config,
            lsp_defaults
        )

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        -- ignore the vim global
                        globals = { 'vim' },
                    }
                }
            }
        })

        lspconfig.tsserver.setup({})
        lspconfig.omnisharp.setup({})

        -- show signature help on edit
        require('lsp_signature').setup({
            -- hide the virtual text hint
            hint_enable = false
        })

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = 'rounded',
        })

        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = 'rounded',
        })
    end
}
