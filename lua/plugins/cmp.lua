local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-buffer",
        {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    {
                        "rafamadriz/friendly-snippets",
                        config = function()
                            -- load vscode style snippets from any package.json defined in our runtime path
                            -- friendly-snippet has a packages.json file that this will consume
                            require("luasnip.loaders.from_vscode").lazy_load()
                        end,
                    },
                },
            },
        },
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<tab>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ["<a-j>"] = cmp.mapping.select_next_item(),
                ["<a-k>"] = cmp.mapping.select_prev_item(),
            }),
            sources = {
                -- put snippets first (or could specify the priority number) to order them above lsp suggestions
                { name = "luasnip" },
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
            },
            formatting = {
                format = function(_, vim_item)
                    if vim.g.me_enable_icons then
                        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                    end

                    return vim_item
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })

        cmp.setup.filetype({ "markdown", "text" }, {
            sources = cmp.config.sources({
                { name = "buffer" },
            }),
        })
    end,
}

