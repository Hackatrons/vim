local cmp = require('cmp')
local luasnip = require('luasnip')

local formatting = nil

if (vim.g.me_enable_icons) then
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
        TypeParameter = ""
    }

    formatting = {
        format = function(_, vim_item)
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
            return vim_item
        end
    }
end

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<c-space>'] = cmp.mapping.complete({ select = true }),
        ['<tab>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ['<a-j>'] = cmp.mapping.select_next_item(),
        ['<a-k>'] = cmp.mapping.select_prev_item(),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    },
    formatting = formatting
})

cmp.setup.filetype({ 'markdown', 'text' }, {
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})
