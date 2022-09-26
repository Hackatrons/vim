local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

-- auto download packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    print('Installing...')
    local packer_url = 'https://github.com/wbthomason/packer.nvim'
    vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})

    vim.cmd('packadd packer.nvim')
    install_plugins = true
end

-- recompile this packer loader file upon making changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- specify plugins
require('packer').startup(function(use)
    -- packer can update itself
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
    use 'tomasiser/vim-code-dark'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'lewis6991/gitsigns.nvim'
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn["mkdp#util#install"]() end,
        ft = { 'markdown' }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'numToStr/Comment.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)

function loadConfig()
    require('impatient')
    vim.cmd('colorscheme codedark')
    require('nvim-web-devicons').setup()
    require('Comment').setup()
    require('plugins/lualine')
    require('plugins/bufferline')
    require('plugins/gitsigns')
    require('plugins/telescope')
    require('plugins/disable')
    require('plugins/tree')
end

if install_plugins then
    vim.api.nvim_create_autocmd('User', {
        pattern = 'PackerComplete',
        once = true,
        callback = function()
            -- close the packer window
            vim.cmd("q")
            -- load the rest of our config
            loadConfig()
        end,
    })

    require('packer').sync()
else
    loadConfig()
end

