return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "ray-x/lsp_signature.nvim"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "tsserver", "lua_ls", "omnisharp" }
        })

        local lsp_defaults = {
            capabilities = require("cmp_nvim_lsp").default_capabilities()
        }
        local lspconfig = require("lspconfig")

        lspconfig.util.default_config = vim.tbl_deep_extend(
            "force",
            lspconfig.util.default_config,
            lsp_defaults
        )

        lspconfig.lua_ls.setup({})
        lspconfig.tsserver.setup({})
        lspconfig.omnisharp.setup({})

        -- show signature help on edit
        require("lsp_signature").setup({
            -- hide the virtual text hint
            hint_enable = false
        })

        -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local function toSnakeCase(str)
                    return string.gsub(str, "%s*[- ]%s*", "_")
                end

                if client.name == "omnisharp" then
                    local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
                    for i, v in ipairs(tokenModifiers) do
                        tokenModifiers[i] = toSnakeCase(v)
                    end
                    local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
                    for i, v in ipairs(tokenTypes) do
                        tokenTypes[i] = toSnakeCase(v)
                    end
                end
            end,
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
        })
    end
}
