local cmp = require('cmp')
local luasnip = require('luasnip')

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
})

cmp.setup.filetype({ 'markdown', 'text' }, {
    sources = cmp.config.sources({
        { name = 'buffer' },
    })
})
