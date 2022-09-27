local opt = vim.opt

opt.background = 'dark'

if (vim.fn.has('termguicolors') == 1) then
    opt.termguicolors = true
end

vim.cmd('syntax enable')

-- tab width equivalent in spaces
opt.tabstop = 4
opt.shiftwidth = 4

-- convert tabs to spaces
opt.expandtab = true

-- retain indentation for new lines
opt.autoindent = true

-- indent based on the code syntax
opt.cindent = true

-- disable automatic comment continuation
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    command = 'setlocal formatoptions-=ro'
})

-- use devicons with neovide
-- disable them for other UIs that haven't got a patched font configured
vim.g.me_enable_icons = vim.g.neovide or false
