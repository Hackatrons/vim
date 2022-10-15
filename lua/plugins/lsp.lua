require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'sumneko_lua', 'omnisharp' }
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

lspconfig.sumneko_lua.setup({
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
    hint_enable = false,
    -- place the window below the line instead of above
    floating_window_above_cur_line = false,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
})
