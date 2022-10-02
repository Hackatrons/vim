-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp')
    .update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- show signature help on edit
require("lsp_signature").setup({
    -- hide the virtual text hint
    hint_enable = false,
    -- place the window below the line instead of above
    floating_window_above_cur_line = false,
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'sumneko_lua', 'omnisharp' }
})

local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    -- defaults to be used by all lsp servers
    {
        capabilities = capabilities
    }
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
