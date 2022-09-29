local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<a-cr>', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<c-t>', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    nmap('K', vim.lsp.buf.hover, 'Symbol Information')

    local format = function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end

    nmap('<leader>fd', format, '[F]ormat [d]ocument')
    -- visual studio keybinding muscle memory
    nmap('<c-k><c-d>', format, 'Format document')
end

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
    -- ensure these servers are installed
    ensure_installed = { 'tsserver', 'sumneko_lua', 'omnisharp' }
})

local lspconfig = require('lspconfig')
lspconfig.util.default_config = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config,
    -- defaults to be used by all lsp servers
    {
        capabilities = capabilities,
        on_attach = on_attach,
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
