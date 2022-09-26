vim.opt.background = 'dark'

if (vim.fn.has('termguicolors') == 1) then
    vim.opt.termguicolors = true
end

vim.cmd [[
syntax enable
]]

-- tab width equivalent in spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- convert tabs to spaces
vim.o.expandtab = true

-- retain indentation for new lines
vim.o.autoindent = true

-- indent based on the code syntax
vim.o.cindent = true

-- disable automatic comment continuation
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    command = 'setlocal formatoptions-=r'
})

